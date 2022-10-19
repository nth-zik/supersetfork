from urllib.parse import quote

from flask import redirect, request
from flask_appbuilder.security.manager import AUTH_OID
from flask_appbuilder.security.views import AuthOIDView
from flask_appbuilder.views import expose
from flask_login import login_user
from flask_oidc import OpenIDConnect
from httplib2 import Response

from superset import is_feature_enabled
from superset.security import SupersetSecurityManager

KEY_GROUPS_MEMBERSHIPS = "groups_membership"


def sync_role(roles, user, security_manager: SupersetSecurityManager):
    user_roles = [role.name.lower() for role in list(security_manager.get_user_roles())]
    if "admin" in user_roles:
        return
    roles_new = (
        list(map(security_manager.add_role, roles)) if isinstance(roles, list) else None
    )
    if len(roles_new) == 0:
        roles_new = [security_manager.add_role("Public")]
    user.roles = roles_new
    security_manager.update_user(user)


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
            # Key groups_membership from client of keycloak
            groups = oidc.user_getinfo([KEY_GROUPS_MEMBERSHIPS])
            roles = groups.get(KEY_GROUPS_MEMBERSHIPS, [])
            info["username"] = info.get("preferred_username")
            info["first_name"] = info.get("given_name", "")
            info["last_name"] = info.get("family_name", "")
            user = sm.auth_user_oauth(info)
            if user is None:
                user = sm.add_user(
                    username=info.get("preferred_username"),
                    first_name=info.get("given_name"),
                    last_name=info.get("family_name"),
                    email=info.get("email"),
                    role=sm.find_role("Gamma"),
                )
            else:
                if is_feature_enabled("SYNC_GROUP_FROM_KEYCLOAK"):
                    sync_role(roles, user, sm)

                sync_role(roles, user, sm)
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
