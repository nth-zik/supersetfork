from urllib.parse import quote

from flask import redirect, request
from flask_appbuilder.security.manager import AUTH_OID
from flask_appbuilder.security.views import AuthOIDView
from flask_appbuilder.views import expose
from flask_login import login_user
from flask_oidc import OpenIDConnect
from httplib2 import Response

from superset.security import SupersetSecurityManager


class AuthOIDCView(AuthOIDView):
    @expose("/login/", methods=["GET", "POST"])
    def login(self, flag: bool = True) -> None:
        sm = self.appbuilder.sm
        oidc = sm.oid

        @self.appbuilder.sm.oid.require_login
        def handle_login() -> Response:
            info = oidc.user_getinfo(
                [
                    "preferred_username",
                    "given_name",
                    "family_name",
                    "email",
                    "first_name",
                    "last_name",
                ]
            )
            info["username"] = info["preferred_username"]
            user = sm.auth_user_oauth(info)
            if user is None:
                user = sm.add_user(
                    info.get("preferred_username"),
                    info.get("given_name"),
                    info.get("family_name"),
                    info.get("email"),
                    sm.find_role("Gamma"),
                )
                print("user", user)
            login_user(user, remember=False)
            return redirect(self.appbuilder.get_url_for_index)

        return handle_login()

    @expose("/logout/", methods=["GET", "POST"])
    def logout(self) -> Response:
        oidc = self.appbuilder.sm.oid
        oidc.logout()
        super(AuthOIDCView, self).logout()
        redirect_url = request.url_root.strip("/") + self.appbuilder.get_url_for_login
        return redirect(
            oidc.client_secrets.get("issuer")
            + "/protocol/openid-connect/logout?redirect_uri="
            + quote(redirect_url)
        )


class OIDCSecurityManager(SupersetSecurityManager):
    authoidview = AuthOIDCView

    def __init__(self, appbuilder: object) -> None:
        super(OIDCSecurityManager, self).__init__(appbuilder)
        if self.auth_type == AUTH_OID:
            self.oid = OpenIDConnect(self.appbuilder.get_app)
