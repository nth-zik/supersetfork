--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:u4j2gWdd9NlKG9c9JiHPXA==$3+fAwE7Jt8zBk6CoTv5f57/DptI/S+1gtFt3LZzAIus=:khFM07TyTV/DxSLt0iPeAyX5VRfa6PUw3hdgJUQjhiY=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO postgres;

\connect keycloak

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO postgres;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO postgres;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO postgres;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO postgres;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO postgres;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO postgres;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO postgres;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO postgres;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO postgres;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO postgres;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO postgres;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO postgres;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO postgres;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO postgres;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO postgres;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO postgres;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO postgres;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO postgres;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO postgres;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO postgres;

--
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO postgres;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO postgres;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO postgres;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO postgres;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO postgres;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO postgres;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO postgres;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO postgres;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO postgres;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO postgres;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO postgres;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO postgres;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO postgres;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO postgres;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO postgres;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO postgres;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO postgres;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO postgres;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO postgres;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO postgres;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO postgres;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO postgres;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO postgres;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO postgres;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO postgres;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO postgres;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO postgres;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO postgres;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO postgres;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO postgres;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO postgres;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO postgres;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO postgres;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO postgres;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO postgres;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO postgres;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO postgres;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO postgres;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO postgres;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO postgres;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO postgres;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO postgres;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO postgres;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO postgres;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO postgres;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO postgres;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO postgres;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO postgres;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO postgres;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO postgres;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO postgres;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO postgres;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO postgres;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO postgres;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO postgres;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO postgres;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO postgres;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO postgres;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO postgres;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO postgres;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO postgres;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO postgres;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO postgres;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO postgres;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
8dfc60b3-8991-4d85-8ad8-e47b39907868	8131cb22-1055-4732-a4d7-660e77ada763
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
1bf8a63c-7335-4654-9629-c5b6163f132b	\N	auth-cookie	master	725bf9de-3603-4455-a424-d7d208df26fe	2	10	f	\N	\N
2975ebae-be94-4392-a4d5-a17ef7143bef	\N	auth-spnego	master	725bf9de-3603-4455-a424-d7d208df26fe	3	20	f	\N	\N
4a22e0b8-30d7-417f-9f2d-008ba00f943f	\N	identity-provider-redirector	master	725bf9de-3603-4455-a424-d7d208df26fe	2	25	f	\N	\N
cb499380-b264-48ec-aecf-731f844216b3	\N	\N	master	725bf9de-3603-4455-a424-d7d208df26fe	2	30	t	c1d546b2-bccc-4aaf-87c2-e6d8f959e77c	\N
808a9749-a135-4a60-8259-484f34edbd80	\N	auth-username-password-form	master	c1d546b2-bccc-4aaf-87c2-e6d8f959e77c	0	10	f	\N	\N
d7cd3128-db26-4d34-8df5-ed88f2f7a327	\N	\N	master	c1d546b2-bccc-4aaf-87c2-e6d8f959e77c	1	20	t	db3404e1-a17e-4dea-ab98-193288f0d70f	\N
d4b13025-3024-474f-86c6-65ca44823864	\N	conditional-user-configured	master	db3404e1-a17e-4dea-ab98-193288f0d70f	0	10	f	\N	\N
52f09a63-a765-438b-95c0-8265dfd6c987	\N	auth-otp-form	master	db3404e1-a17e-4dea-ab98-193288f0d70f	0	20	f	\N	\N
6f58ca5b-f847-4b39-a6c0-7c60d8a02fa2	\N	direct-grant-validate-username	master	6a23c015-0b05-4146-b98d-d25aa7f46797	0	10	f	\N	\N
313e1c67-c9de-48a8-9eaf-55cef0736a33	\N	direct-grant-validate-password	master	6a23c015-0b05-4146-b98d-d25aa7f46797	0	20	f	\N	\N
39d93a87-ac44-47fc-b7b4-87493982a162	\N	\N	master	6a23c015-0b05-4146-b98d-d25aa7f46797	1	30	t	3c68ad1e-de94-4b64-aaec-077ee3c391e6	\N
ebda7fb6-b180-46ac-bff0-fffee37e89f3	\N	conditional-user-configured	master	3c68ad1e-de94-4b64-aaec-077ee3c391e6	0	10	f	\N	\N
89d66db3-5fba-494e-ab80-81e4ddebecdd	\N	direct-grant-validate-otp	master	3c68ad1e-de94-4b64-aaec-077ee3c391e6	0	20	f	\N	\N
5fc22063-7199-4cb5-b0ac-f20c773643e5	\N	registration-page-form	master	c6f6141b-5d62-401a-a34d-99f4cce166be	0	10	t	01bd0f81-1a17-47fa-924d-6ec8ade6af82	\N
d5a43b81-e406-4ccf-96fd-f7d9b51e73ee	\N	registration-user-creation	master	01bd0f81-1a17-47fa-924d-6ec8ade6af82	0	20	f	\N	\N
82d3ae9b-77b7-4fbe-b6cc-17ccc47eaee4	\N	registration-profile-action	master	01bd0f81-1a17-47fa-924d-6ec8ade6af82	0	40	f	\N	\N
c637f784-61c7-445a-a7c6-37ee9f09104f	\N	registration-password-action	master	01bd0f81-1a17-47fa-924d-6ec8ade6af82	0	50	f	\N	\N
397c8425-e3e8-4eeb-a110-91b09f3d9875	\N	registration-recaptcha-action	master	01bd0f81-1a17-47fa-924d-6ec8ade6af82	3	60	f	\N	\N
7fc9765e-4e4c-448c-b357-0acc8e32a156	\N	reset-credentials-choose-user	master	b4362b81-58f7-4f37-a30a-e41902aace24	0	10	f	\N	\N
e5d8d954-715e-4177-9253-51d52c69ab1a	\N	reset-credential-email	master	b4362b81-58f7-4f37-a30a-e41902aace24	0	20	f	\N	\N
7665d36c-b3b4-4319-80b5-13c51f4f605f	\N	reset-password	master	b4362b81-58f7-4f37-a30a-e41902aace24	0	30	f	\N	\N
8e98e12f-44e4-499a-9d4f-ed421419cc4c	\N	\N	master	b4362b81-58f7-4f37-a30a-e41902aace24	1	40	t	aacde058-6ccd-4719-b8c3-d0a66b82e599	\N
7efb48c2-4dce-4726-8ab5-5a7e5e0be26d	\N	conditional-user-configured	master	aacde058-6ccd-4719-b8c3-d0a66b82e599	0	10	f	\N	\N
b722d45f-328e-4ad6-ba14-c0e7f749c1ad	\N	reset-otp	master	aacde058-6ccd-4719-b8c3-d0a66b82e599	0	20	f	\N	\N
d9fea594-1c35-4b7a-8f19-106a58e34b66	\N	client-secret	master	beebf7bd-e1e9-4bce-99f0-26a10b01e5ed	2	10	f	\N	\N
ff1ce4f5-ab52-409d-973c-885d8805bfc6	\N	client-jwt	master	beebf7bd-e1e9-4bce-99f0-26a10b01e5ed	2	20	f	\N	\N
0af49663-5dc4-4e0b-8be3-c1f8f9127971	\N	client-secret-jwt	master	beebf7bd-e1e9-4bce-99f0-26a10b01e5ed	2	30	f	\N	\N
2cccd0c3-35f2-4225-b33d-b77414816973	\N	client-x509	master	beebf7bd-e1e9-4bce-99f0-26a10b01e5ed	2	40	f	\N	\N
a627dafc-88ca-4e2e-bee8-96efebf11bb7	\N	idp-review-profile	master	fc0a7226-e07d-4027-ade4-2ba23bbf3069	0	10	f	\N	cc1c9f17-930f-4898-ad3c-4b12b03e0690
438c0cdb-2e02-4476-82f2-6d2262ea559d	\N	\N	master	fc0a7226-e07d-4027-ade4-2ba23bbf3069	0	20	t	9de89393-b683-4b19-89ca-dd3106e40634	\N
59808a48-fb6a-4260-816b-f1bdf83ac4c9	\N	idp-create-user-if-unique	master	9de89393-b683-4b19-89ca-dd3106e40634	2	10	f	\N	6cb9ed02-61e4-4e8b-9528-b76887f54fbb
b27dbc0c-cbbd-490f-81ac-a08599d73bcf	\N	\N	master	9de89393-b683-4b19-89ca-dd3106e40634	2	20	t	80a97fa4-37c3-4201-8d56-cdf35ec8a0b9	\N
cb699dfc-b41c-490c-9f2c-e9b4f4732dc0	\N	idp-confirm-link	master	80a97fa4-37c3-4201-8d56-cdf35ec8a0b9	0	10	f	\N	\N
60d3acdf-0e32-405f-90b4-2bcc868fa19a	\N	\N	master	80a97fa4-37c3-4201-8d56-cdf35ec8a0b9	0	20	t	6d04f671-2ce6-4826-9f80-21119f410d2f	\N
0026664b-ef5e-427c-bf67-b1c48d151490	\N	idp-email-verification	master	6d04f671-2ce6-4826-9f80-21119f410d2f	2	10	f	\N	\N
b9f92811-6d3f-4162-abf6-0897b512581e	\N	\N	master	6d04f671-2ce6-4826-9f80-21119f410d2f	2	20	t	6d021334-5d3b-43f9-9d6d-4cae51d47c24	\N
b7f90f85-8e01-4ff3-a6ab-8421ed321306	\N	idp-username-password-form	master	6d021334-5d3b-43f9-9d6d-4cae51d47c24	0	10	f	\N	\N
1c1e3bcb-602e-4213-9dc1-8434f2f880c9	\N	\N	master	6d021334-5d3b-43f9-9d6d-4cae51d47c24	1	20	t	b9e1e624-2a90-4b16-b113-46444f759b55	\N
3d3beb1d-9a9f-4bb4-828d-991492315e14	\N	conditional-user-configured	master	b9e1e624-2a90-4b16-b113-46444f759b55	0	10	f	\N	\N
cd9eabb2-a517-46fe-b599-ee53446f8850	\N	auth-otp-form	master	b9e1e624-2a90-4b16-b113-46444f759b55	0	20	f	\N	\N
4ed1117b-e7bf-480f-95d2-51d5606795e1	\N	http-basic-authenticator	master	9b37a9cc-6a19-4ef1-a75f-47e6927ebbaa	0	10	f	\N	\N
62cce3a8-0e70-4ceb-b984-562dd9baef2f	\N	docker-http-basic-authenticator	master	6755f763-61cf-486d-8d86-008fce3f1c93	0	10	f	\N	\N
2d563e55-f77a-4ed7-b250-e045a164578a	\N	no-cookie-redirect	master	ecdcbe43-2efb-4777-8c52-68663c697709	0	10	f	\N	\N
5c18ed25-d441-4c8b-8179-8ea7ef3e506b	\N	\N	master	ecdcbe43-2efb-4777-8c52-68663c697709	0	20	t	413e927e-74f9-4418-b6c3-bd68b536637f	\N
7035a5be-f9a7-4254-8ea3-ee743a783b52	\N	basic-auth	master	413e927e-74f9-4418-b6c3-bd68b536637f	0	10	f	\N	\N
235dcfd5-81e4-43e8-bd12-9febea55fb38	\N	basic-auth-otp	master	413e927e-74f9-4418-b6c3-bd68b536637f	3	20	f	\N	\N
20255d2d-1665-483a-ab8d-36d7ff38b3c3	\N	auth-spnego	master	413e927e-74f9-4418-b6c3-bd68b536637f	3	30	f	\N	\N
c2b32735-afb6-4f99-b5a7-a7a6ba51cc9e	\N	auth-cookie	Superset	b77a16aa-603d-4f20-9cc3-8dc74c91cf7f	2	10	f	\N	\N
7c40b729-e2fc-424d-bb55-862390ad3b78	\N	auth-spnego	Superset	b77a16aa-603d-4f20-9cc3-8dc74c91cf7f	3	20	f	\N	\N
fbfb70f6-47fc-40cb-8c4d-a8f93a822112	\N	identity-provider-redirector	Superset	b77a16aa-603d-4f20-9cc3-8dc74c91cf7f	2	25	f	\N	\N
8ed38798-d682-4c54-8b3e-e76fb5e3e01d	\N	\N	Superset	b77a16aa-603d-4f20-9cc3-8dc74c91cf7f	2	30	t	d0748309-7547-43e9-b718-93c48e0a2157	\N
844b768f-af9f-46bf-8580-7a46b47fcd20	\N	auth-username-password-form	Superset	d0748309-7547-43e9-b718-93c48e0a2157	0	10	f	\N	\N
eb0b0d6d-84f4-4c18-b76c-4d9d7a9529f5	\N	\N	Superset	d0748309-7547-43e9-b718-93c48e0a2157	1	20	t	49b76d27-040a-4914-b5ba-6e0909cd4189	\N
33908d83-27f7-46a2-9a52-66204c844cca	\N	conditional-user-configured	Superset	49b76d27-040a-4914-b5ba-6e0909cd4189	0	10	f	\N	\N
6459106f-2521-4c2c-b7d3-246520d49058	\N	auth-otp-form	Superset	49b76d27-040a-4914-b5ba-6e0909cd4189	0	20	f	\N	\N
5862a923-7757-4232-b97b-381cae02e524	\N	direct-grant-validate-username	Superset	75da2a91-8b58-4368-be0f-f8ba3829ffd5	0	10	f	\N	\N
bc0307dd-4c76-4684-9019-9a0e7ccb0bc5	\N	direct-grant-validate-password	Superset	75da2a91-8b58-4368-be0f-f8ba3829ffd5	0	20	f	\N	\N
85532e4a-e0e8-43f3-bf98-63f05169f301	\N	\N	Superset	75da2a91-8b58-4368-be0f-f8ba3829ffd5	1	30	t	8df75bb9-feac-437b-bf5b-b4ab9d48a510	\N
a6aa85c6-1f25-4f4c-97d1-c14ac69b8713	\N	conditional-user-configured	Superset	8df75bb9-feac-437b-bf5b-b4ab9d48a510	0	10	f	\N	\N
c18179d9-bcbd-45fb-b376-2ced96d4d05a	\N	direct-grant-validate-otp	Superset	8df75bb9-feac-437b-bf5b-b4ab9d48a510	0	20	f	\N	\N
2bed9799-cfdc-48a7-b347-58e1f9b8cbf3	\N	registration-page-form	Superset	ab05f7ab-76d8-431f-9692-f3b89dfe35fa	0	10	t	a025dabd-9d56-4176-9eb1-826e98ea76a5	\N
1eb034da-1279-43eb-a863-bab514e68eaa	\N	registration-user-creation	Superset	a025dabd-9d56-4176-9eb1-826e98ea76a5	0	20	f	\N	\N
2046e601-5844-4c9f-bb07-ea1f069fb374	\N	registration-profile-action	Superset	a025dabd-9d56-4176-9eb1-826e98ea76a5	0	40	f	\N	\N
2c22d7b2-2f54-464b-b30c-a7d0aebd0836	\N	registration-password-action	Superset	a025dabd-9d56-4176-9eb1-826e98ea76a5	0	50	f	\N	\N
c35e43df-12cf-490a-b771-45dad66c5f58	\N	registration-recaptcha-action	Superset	a025dabd-9d56-4176-9eb1-826e98ea76a5	3	60	f	\N	\N
ce67132a-1e43-49d2-acd5-531b965aaf6e	\N	reset-credentials-choose-user	Superset	723b3de5-47d8-47bc-be92-d90bc11f0d31	0	10	f	\N	\N
44aeba00-0013-4bb1-8386-d137c22d0130	\N	reset-credential-email	Superset	723b3de5-47d8-47bc-be92-d90bc11f0d31	0	20	f	\N	\N
708914b9-7c37-435f-9a5b-e6a58fc9fd64	\N	reset-password	Superset	723b3de5-47d8-47bc-be92-d90bc11f0d31	0	30	f	\N	\N
0991207d-d39e-4d3e-9887-4376d18e40a4	\N	\N	Superset	723b3de5-47d8-47bc-be92-d90bc11f0d31	1	40	t	b2b2a0b5-601f-4802-8f32-ad8392a02857	\N
3d373e5f-41bc-492b-86c0-475793906ddb	\N	conditional-user-configured	Superset	b2b2a0b5-601f-4802-8f32-ad8392a02857	0	10	f	\N	\N
4c0bb53f-e3f9-432f-a2d7-83ee1a77f111	\N	reset-otp	Superset	b2b2a0b5-601f-4802-8f32-ad8392a02857	0	20	f	\N	\N
d885ed0f-ad71-4a88-83c4-758ac6fb91be	\N	client-secret	Superset	db42e8d7-63e2-4008-9125-1c9a68e88588	2	10	f	\N	\N
9dec7eb9-8fb6-4c6c-bc3c-924e8ee09f85	\N	client-jwt	Superset	db42e8d7-63e2-4008-9125-1c9a68e88588	2	20	f	\N	\N
6b3d36ae-8833-4abd-a37a-a8a08b8ecedd	\N	client-secret-jwt	Superset	db42e8d7-63e2-4008-9125-1c9a68e88588	2	30	f	\N	\N
e4b6f55f-7f9f-4ae1-a8aa-bfb5b3ca66b3	\N	client-x509	Superset	db42e8d7-63e2-4008-9125-1c9a68e88588	2	40	f	\N	\N
b0e12b87-1aca-4762-9d2e-a1a24652e634	\N	idp-review-profile	Superset	354981ad-6966-4070-9438-d3f4dcf850ed	0	10	f	\N	f1418db8-aab5-4407-8059-860ea8c05a17
48141da1-9cc6-4cf3-996a-6e9d096dd69e	\N	\N	Superset	354981ad-6966-4070-9438-d3f4dcf850ed	0	20	t	bbe7b363-4330-46c4-9411-39b967a04b50	\N
94e940c4-e8c9-4083-a044-5449f0ae62b2	\N	idp-create-user-if-unique	Superset	bbe7b363-4330-46c4-9411-39b967a04b50	2	10	f	\N	27751767-4235-47b4-8d4e-3a71a0eaa914
0f73ad3e-e372-4a33-b749-f059a5c95cef	\N	\N	Superset	bbe7b363-4330-46c4-9411-39b967a04b50	2	20	t	20b78059-94d1-482b-9806-9d71484df1a4	\N
ccdc644d-e080-4f14-8db3-81753a745e2d	\N	idp-confirm-link	Superset	20b78059-94d1-482b-9806-9d71484df1a4	0	10	f	\N	\N
fb815ce8-2b29-4160-b6d3-66c5febe8f1d	\N	\N	Superset	20b78059-94d1-482b-9806-9d71484df1a4	0	20	t	ae806489-1eed-43e8-9c9c-5bdc590a10e6	\N
98840414-37bd-432f-a83e-e1eb1db381a6	\N	idp-email-verification	Superset	ae806489-1eed-43e8-9c9c-5bdc590a10e6	2	10	f	\N	\N
55f31ed0-841d-4f07-92e7-18c8e8502213	\N	\N	Superset	ae806489-1eed-43e8-9c9c-5bdc590a10e6	2	20	t	44051b3e-5666-498a-acc3-e5eb8926f2c4	\N
5d77104f-52b8-41f7-8bf5-730d5fa0132f	\N	idp-username-password-form	Superset	44051b3e-5666-498a-acc3-e5eb8926f2c4	0	10	f	\N	\N
350a71de-df6b-41a4-bd46-19709c3ef8ca	\N	\N	Superset	44051b3e-5666-498a-acc3-e5eb8926f2c4	1	20	t	4b1de691-7a98-4549-b241-d7f97b1e8939	\N
d8bb68e2-7516-4dfa-9a05-50c6742731b1	\N	conditional-user-configured	Superset	4b1de691-7a98-4549-b241-d7f97b1e8939	0	10	f	\N	\N
b1de8aef-9bd5-499e-b23a-34cbc185218b	\N	auth-otp-form	Superset	4b1de691-7a98-4549-b241-d7f97b1e8939	0	20	f	\N	\N
46f88f5e-6cd2-48b6-998c-6a67e7a1fbe7	\N	http-basic-authenticator	Superset	a7029757-9f11-4749-9bcf-5a0e0e41a3fa	0	10	f	\N	\N
e3adbb89-3e53-4517-a06b-a59a2fb1a0b6	\N	docker-http-basic-authenticator	Superset	e5d79c16-9c48-443f-9b22-366010cb3f72	0	10	f	\N	\N
47e2b672-37cf-401b-bdfd-03bc59dfed84	\N	no-cookie-redirect	Superset	7395b65b-503d-4388-851a-76e6cd5e90f9	0	10	f	\N	\N
60083463-d090-4bcd-879d-50b836a61303	\N	\N	Superset	7395b65b-503d-4388-851a-76e6cd5e90f9	0	20	t	785133b7-f765-4e68-9353-5a6f9457c95e	\N
b65086d1-a17a-4f18-97f1-a94ebbc1674a	\N	basic-auth	Superset	785133b7-f765-4e68-9353-5a6f9457c95e	0	10	f	\N	\N
596ba567-eef4-4cee-a368-9cffca96b190	\N	basic-auth-otp	Superset	785133b7-f765-4e68-9353-5a6f9457c95e	3	20	f	\N	\N
3703588f-c666-44f8-80dc-1622f9349a2f	\N	auth-spnego	Superset	785133b7-f765-4e68-9353-5a6f9457c95e	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
725bf9de-3603-4455-a424-d7d208df26fe	browser	browser based authentication	master	basic-flow	t	t
c1d546b2-bccc-4aaf-87c2-e6d8f959e77c	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
db3404e1-a17e-4dea-ab98-193288f0d70f	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
6a23c015-0b05-4146-b98d-d25aa7f46797	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
3c68ad1e-de94-4b64-aaec-077ee3c391e6	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
c6f6141b-5d62-401a-a34d-99f4cce166be	registration	registration flow	master	basic-flow	t	t
01bd0f81-1a17-47fa-924d-6ec8ade6af82	registration form	registration form	master	form-flow	f	t
b4362b81-58f7-4f37-a30a-e41902aace24	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
aacde058-6ccd-4719-b8c3-d0a66b82e599	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
beebf7bd-e1e9-4bce-99f0-26a10b01e5ed	clients	Base authentication for clients	master	client-flow	t	t
fc0a7226-e07d-4027-ade4-2ba23bbf3069	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
9de89393-b683-4b19-89ca-dd3106e40634	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
80a97fa4-37c3-4201-8d56-cdf35ec8a0b9	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
6d04f671-2ce6-4826-9f80-21119f410d2f	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
6d021334-5d3b-43f9-9d6d-4cae51d47c24	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
b9e1e624-2a90-4b16-b113-46444f759b55	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
9b37a9cc-6a19-4ef1-a75f-47e6927ebbaa	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
6755f763-61cf-486d-8d86-008fce3f1c93	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
ecdcbe43-2efb-4777-8c52-68663c697709	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
413e927e-74f9-4418-b6c3-bd68b536637f	Authentication Options	Authentication options.	master	basic-flow	f	t
b77a16aa-603d-4f20-9cc3-8dc74c91cf7f	browser	browser based authentication	Superset	basic-flow	t	t
d0748309-7547-43e9-b718-93c48e0a2157	forms	Username, password, otp and other auth forms.	Superset	basic-flow	f	t
49b76d27-040a-4914-b5ba-6e0909cd4189	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	Superset	basic-flow	f	t
75da2a91-8b58-4368-be0f-f8ba3829ffd5	direct grant	OpenID Connect Resource Owner Grant	Superset	basic-flow	t	t
8df75bb9-feac-437b-bf5b-b4ab9d48a510	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	Superset	basic-flow	f	t
ab05f7ab-76d8-431f-9692-f3b89dfe35fa	registration	registration flow	Superset	basic-flow	t	t
a025dabd-9d56-4176-9eb1-826e98ea76a5	registration form	registration form	Superset	form-flow	f	t
723b3de5-47d8-47bc-be92-d90bc11f0d31	reset credentials	Reset credentials for a user if they forgot their password or something	Superset	basic-flow	t	t
b2b2a0b5-601f-4802-8f32-ad8392a02857	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	Superset	basic-flow	f	t
db42e8d7-63e2-4008-9125-1c9a68e88588	clients	Base authentication for clients	Superset	client-flow	t	t
354981ad-6966-4070-9438-d3f4dcf850ed	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	Superset	basic-flow	t	t
bbe7b363-4330-46c4-9411-39b967a04b50	User creation or linking	Flow for the existing/non-existing user alternatives	Superset	basic-flow	f	t
20b78059-94d1-482b-9806-9d71484df1a4	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	Superset	basic-flow	f	t
ae806489-1eed-43e8-9c9c-5bdc590a10e6	Account verification options	Method with which to verity the existing account	Superset	basic-flow	f	t
44051b3e-5666-498a-acc3-e5eb8926f2c4	Verify Existing Account by Re-authentication	Reauthentication of existing account	Superset	basic-flow	f	t
4b1de691-7a98-4549-b241-d7f97b1e8939	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	Superset	basic-flow	f	t
a7029757-9f11-4749-9bcf-5a0e0e41a3fa	saml ecp	SAML ECP Profile Authentication Flow	Superset	basic-flow	t	t
e5d79c16-9c48-443f-9b22-366010cb3f72	docker auth	Used by Docker clients to authenticate against the IDP	Superset	basic-flow	t	t
7395b65b-503d-4388-851a-76e6cd5e90f9	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	Superset	basic-flow	t	t
785133b7-f765-4e68-9353-5a6f9457c95e	Authentication Options	Authentication options.	Superset	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
cc1c9f17-930f-4898-ad3c-4b12b03e0690	review profile config	master
6cb9ed02-61e4-4e8b-9528-b76887f54fbb	create unique user config	master
f1418db8-aab5-4407-8059-860ea8c05a17	review profile config	Superset
27751767-4235-47b4-8d4e-3a71a0eaa914	create unique user config	Superset
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
6cb9ed02-61e4-4e8b-9528-b76887f54fbb	false	require.password.update.after.registration
cc1c9f17-930f-4898-ad3c-4b12b03e0690	missing	update.profile.on.first.login
27751767-4235-47b4-8d4e-3a71a0eaa914	false	require.password.update.after.registration
f1418db8-aab5-4407-8059-860ea8c05a17	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	f	master-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
65925614-813c-4ad7-8268-e1bc688073fa	t	f	broker	0	f	\N	\N	t	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
4d2375ff-56fc-40ce-a88e-bb813d2c6464	t	f	admin-cli	0	t	\N	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
d2454b11-ede4-4a15-840a-ac868983bcca	t	f	Superset-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	Superset Realm	f	client-secret	\N	\N	\N	t	f	f	f
23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	f	realm-management	0	f	\N	\N	t	\N	f	Superset	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
9f041e11-d6fb-4c86-8a61-22370f383d8c	t	f	account	0	t	\N	/realms/Superset/account/	f	\N	f	Superset	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	t	f	account-console	0	t	\N	/realms/Superset/account/	f	\N	f	Superset	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
993aa4df-b36e-44c3-9280-a7adb429c6b1	t	f	broker	0	f	\N	\N	t	\N	f	Superset	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
0f67de81-9843-4253-8c3a-0352cef40636	t	f	security-admin-console	0	t	\N	/admin/Superset/console/	f	\N	f	Superset	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	t	f	admin-cli	0	t	\N	\N	f	\N	f	Superset	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	t	t	client-superset	0	f	uAaZTIKPfzaxZeFxtAcgQbSrORiQ0hk2	\N	f	\N	f	Superset	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	S256	pkce.code.challenge.method
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	S256	pkce.code.challenge.method
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	S256	pkce.code.challenge.method
0f67de81-9843-4253-8c3a-0352cef40636	S256	pkce.code.challenge.method
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	true	backchannel.logout.session.required
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	backchannel.logout.revoke.offline.tokens
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.artifact.binding
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.server.signature
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.server.signature.keyinfo.ext
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.assertion.signature
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.client.signature
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.encrypt
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.authnstatement
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.onetimeuse.condition
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml_force_name_id_format
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.multivalued.roles
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	saml.force.post.binding
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	exclude.session.state.from.auth.response
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	true	oauth2.device.authorization.grant.enabled
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	oidc.ciba.grant.enabled
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	true	use.refresh.tokens
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	id.token.as.detached.signature
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	tls.client.certificate.bound.access.tokens
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	require.pushed.authorization.requests
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	client_credentials.use_refresh_token
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	token.response.type.bearer.lower-case
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	false	display.on.consent.screen
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	{}	acr.loa.map
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
a59aefae-873f-4e9d-a683-4687f180a9ab	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
7a4a8d9d-c5b0-4798-9367-4264241344ff	role_list	master	SAML role list	saml
f1c68c12-77f4-42e8-a49e-b76c1955263b	profile	master	OpenID Connect built-in scope: profile	openid-connect
bca0d395-8a9c-40dd-aba2-6764366255eb	email	master	OpenID Connect built-in scope: email	openid-connect
75cf9b33-9d70-47b1-8891-69054318a4bc	address	master	OpenID Connect built-in scope: address	openid-connect
bf9593bb-8e81-429b-9d3d-c1cae0278644	phone	master	OpenID Connect built-in scope: phone	openid-connect
bed5c8a1-6967-47e5-922e-a4bfdb922323	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
ffe0cad1-ad9d-48f8-b822-37ec3c16301d	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
c0ac8f4e-90bc-4070-8d4f-55ac8484c581	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
6bd0df37-c646-44df-b09f-388487bec7c4	offline_access	Superset	OpenID Connect built-in scope: offline_access	openid-connect
16b08ee2-2a1f-4dc2-9f9e-48b4c4646af3	role_list	Superset	SAML role list	saml
a5a1018f-62e2-43d3-bdb3-623757a4e845	profile	Superset	OpenID Connect built-in scope: profile	openid-connect
e4af3ead-67e4-4dea-b97d-67889bff6f5c	email	Superset	OpenID Connect built-in scope: email	openid-connect
8df7bc64-1802-4cbc-9c02-146070604915	address	Superset	OpenID Connect built-in scope: address	openid-connect
b34568a9-d1d9-427d-babd-f9457eb7c470	phone	Superset	OpenID Connect built-in scope: phone	openid-connect
4931ca8b-4d50-430d-91b8-ee951628c715	roles	Superset	OpenID Connect scope for add user roles to the access token	openid-connect
486daaf5-0630-459a-a837-1116a367c949	web-origins	Superset	OpenID Connect scope for add allowed web origins to the access token	openid-connect
5c24268c-337d-40d2-883b-d9cfdd97769b	microprofile-jwt	Superset	Microprofile - JWT built-in scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
a59aefae-873f-4e9d-a683-4687f180a9ab	true	display.on.consent.screen
a59aefae-873f-4e9d-a683-4687f180a9ab	${offlineAccessScopeConsentText}	consent.screen.text
7a4a8d9d-c5b0-4798-9367-4264241344ff	true	display.on.consent.screen
7a4a8d9d-c5b0-4798-9367-4264241344ff	${samlRoleListScopeConsentText}	consent.screen.text
f1c68c12-77f4-42e8-a49e-b76c1955263b	true	display.on.consent.screen
f1c68c12-77f4-42e8-a49e-b76c1955263b	${profileScopeConsentText}	consent.screen.text
f1c68c12-77f4-42e8-a49e-b76c1955263b	true	include.in.token.scope
bca0d395-8a9c-40dd-aba2-6764366255eb	true	display.on.consent.screen
bca0d395-8a9c-40dd-aba2-6764366255eb	${emailScopeConsentText}	consent.screen.text
bca0d395-8a9c-40dd-aba2-6764366255eb	true	include.in.token.scope
75cf9b33-9d70-47b1-8891-69054318a4bc	true	display.on.consent.screen
75cf9b33-9d70-47b1-8891-69054318a4bc	${addressScopeConsentText}	consent.screen.text
75cf9b33-9d70-47b1-8891-69054318a4bc	true	include.in.token.scope
bf9593bb-8e81-429b-9d3d-c1cae0278644	true	display.on.consent.screen
bf9593bb-8e81-429b-9d3d-c1cae0278644	${phoneScopeConsentText}	consent.screen.text
bf9593bb-8e81-429b-9d3d-c1cae0278644	true	include.in.token.scope
bed5c8a1-6967-47e5-922e-a4bfdb922323	true	display.on.consent.screen
bed5c8a1-6967-47e5-922e-a4bfdb922323	${rolesScopeConsentText}	consent.screen.text
bed5c8a1-6967-47e5-922e-a4bfdb922323	false	include.in.token.scope
ffe0cad1-ad9d-48f8-b822-37ec3c16301d	false	display.on.consent.screen
ffe0cad1-ad9d-48f8-b822-37ec3c16301d		consent.screen.text
ffe0cad1-ad9d-48f8-b822-37ec3c16301d	false	include.in.token.scope
c0ac8f4e-90bc-4070-8d4f-55ac8484c581	false	display.on.consent.screen
c0ac8f4e-90bc-4070-8d4f-55ac8484c581	true	include.in.token.scope
6bd0df37-c646-44df-b09f-388487bec7c4	true	display.on.consent.screen
6bd0df37-c646-44df-b09f-388487bec7c4	${offlineAccessScopeConsentText}	consent.screen.text
16b08ee2-2a1f-4dc2-9f9e-48b4c4646af3	true	display.on.consent.screen
16b08ee2-2a1f-4dc2-9f9e-48b4c4646af3	${samlRoleListScopeConsentText}	consent.screen.text
a5a1018f-62e2-43d3-bdb3-623757a4e845	true	display.on.consent.screen
a5a1018f-62e2-43d3-bdb3-623757a4e845	${profileScopeConsentText}	consent.screen.text
a5a1018f-62e2-43d3-bdb3-623757a4e845	true	include.in.token.scope
e4af3ead-67e4-4dea-b97d-67889bff6f5c	true	display.on.consent.screen
e4af3ead-67e4-4dea-b97d-67889bff6f5c	${emailScopeConsentText}	consent.screen.text
e4af3ead-67e4-4dea-b97d-67889bff6f5c	true	include.in.token.scope
8df7bc64-1802-4cbc-9c02-146070604915	true	display.on.consent.screen
8df7bc64-1802-4cbc-9c02-146070604915	${addressScopeConsentText}	consent.screen.text
8df7bc64-1802-4cbc-9c02-146070604915	true	include.in.token.scope
b34568a9-d1d9-427d-babd-f9457eb7c470	true	display.on.consent.screen
b34568a9-d1d9-427d-babd-f9457eb7c470	${phoneScopeConsentText}	consent.screen.text
b34568a9-d1d9-427d-babd-f9457eb7c470	true	include.in.token.scope
4931ca8b-4d50-430d-91b8-ee951628c715	true	display.on.consent.screen
4931ca8b-4d50-430d-91b8-ee951628c715	${rolesScopeConsentText}	consent.screen.text
4931ca8b-4d50-430d-91b8-ee951628c715	false	include.in.token.scope
486daaf5-0630-459a-a837-1116a367c949	false	display.on.consent.screen
486daaf5-0630-459a-a837-1116a367c949		consent.screen.text
486daaf5-0630-459a-a837-1116a367c949	false	include.in.token.scope
5c24268c-337d-40d2-883b-d9cfdd97769b	false	display.on.consent.screen
5c24268c-337d-40d2-883b-d9cfdd97769b	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
5bc94255-f104-43f9-a354-a23a6d6ae8b3	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
5bc94255-f104-43f9-a354-a23a6d6ae8b3	bca0d395-8a9c-40dd-aba2-6764366255eb	t
5bc94255-f104-43f9-a354-a23a6d6ae8b3	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
5bc94255-f104-43f9-a354-a23a6d6ae8b3	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
5bc94255-f104-43f9-a354-a23a6d6ae8b3	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
5bc94255-f104-43f9-a354-a23a6d6ae8b3	a59aefae-873f-4e9d-a683-4687f180a9ab	f
5bc94255-f104-43f9-a354-a23a6d6ae8b3	75cf9b33-9d70-47b1-8891-69054318a4bc	f
5bc94255-f104-43f9-a354-a23a6d6ae8b3	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	bca0d395-8a9c-40dd-aba2-6764366255eb	t
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	a59aefae-873f-4e9d-a683-4687f180a9ab	f
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	75cf9b33-9d70-47b1-8891-69054318a4bc	f
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
4d2375ff-56fc-40ce-a88e-bb813d2c6464	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
4d2375ff-56fc-40ce-a88e-bb813d2c6464	bca0d395-8a9c-40dd-aba2-6764366255eb	t
4d2375ff-56fc-40ce-a88e-bb813d2c6464	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
4d2375ff-56fc-40ce-a88e-bb813d2c6464	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
4d2375ff-56fc-40ce-a88e-bb813d2c6464	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
4d2375ff-56fc-40ce-a88e-bb813d2c6464	a59aefae-873f-4e9d-a683-4687f180a9ab	f
4d2375ff-56fc-40ce-a88e-bb813d2c6464	75cf9b33-9d70-47b1-8891-69054318a4bc	f
4d2375ff-56fc-40ce-a88e-bb813d2c6464	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
65925614-813c-4ad7-8268-e1bc688073fa	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
65925614-813c-4ad7-8268-e1bc688073fa	bca0d395-8a9c-40dd-aba2-6764366255eb	t
65925614-813c-4ad7-8268-e1bc688073fa	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
65925614-813c-4ad7-8268-e1bc688073fa	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
65925614-813c-4ad7-8268-e1bc688073fa	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
65925614-813c-4ad7-8268-e1bc688073fa	a59aefae-873f-4e9d-a683-4687f180a9ab	f
65925614-813c-4ad7-8268-e1bc688073fa	75cf9b33-9d70-47b1-8891-69054318a4bc	f
65925614-813c-4ad7-8268-e1bc688073fa	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
43f06207-b1c2-41c4-a2b3-b0e797db25dd	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
43f06207-b1c2-41c4-a2b3-b0e797db25dd	bca0d395-8a9c-40dd-aba2-6764366255eb	t
43f06207-b1c2-41c4-a2b3-b0e797db25dd	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
43f06207-b1c2-41c4-a2b3-b0e797db25dd	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
43f06207-b1c2-41c4-a2b3-b0e797db25dd	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
43f06207-b1c2-41c4-a2b3-b0e797db25dd	a59aefae-873f-4e9d-a683-4687f180a9ab	f
43f06207-b1c2-41c4-a2b3-b0e797db25dd	75cf9b33-9d70-47b1-8891-69054318a4bc	f
43f06207-b1c2-41c4-a2b3-b0e797db25dd	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	bca0d395-8a9c-40dd-aba2-6764366255eb	t
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	a59aefae-873f-4e9d-a683-4687f180a9ab	f
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	75cf9b33-9d70-47b1-8891-69054318a4bc	f
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
9f041e11-d6fb-4c86-8a61-22370f383d8c	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
9f041e11-d6fb-4c86-8a61-22370f383d8c	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
9f041e11-d6fb-4c86-8a61-22370f383d8c	4931ca8b-4d50-430d-91b8-ee951628c715	t
9f041e11-d6fb-4c86-8a61-22370f383d8c	486daaf5-0630-459a-a837-1116a367c949	t
9f041e11-d6fb-4c86-8a61-22370f383d8c	8df7bc64-1802-4cbc-9c02-146070604915	f
9f041e11-d6fb-4c86-8a61-22370f383d8c	b34568a9-d1d9-427d-babd-f9457eb7c470	f
9f041e11-d6fb-4c86-8a61-22370f383d8c	6bd0df37-c646-44df-b09f-388487bec7c4	f
9f041e11-d6fb-4c86-8a61-22370f383d8c	5c24268c-337d-40d2-883b-d9cfdd97769b	f
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	4931ca8b-4d50-430d-91b8-ee951628c715	t
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	486daaf5-0630-459a-a837-1116a367c949	t
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	8df7bc64-1802-4cbc-9c02-146070604915	f
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	b34568a9-d1d9-427d-babd-f9457eb7c470	f
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	6bd0df37-c646-44df-b09f-388487bec7c4	f
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	5c24268c-337d-40d2-883b-d9cfdd97769b	f
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	4931ca8b-4d50-430d-91b8-ee951628c715	t
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	486daaf5-0630-459a-a837-1116a367c949	t
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	8df7bc64-1802-4cbc-9c02-146070604915	f
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	b34568a9-d1d9-427d-babd-f9457eb7c470	f
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	6bd0df37-c646-44df-b09f-388487bec7c4	f
9d360dd7-d38d-4904-bc19-7a8beaa0d16d	5c24268c-337d-40d2-883b-d9cfdd97769b	f
993aa4df-b36e-44c3-9280-a7adb429c6b1	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
993aa4df-b36e-44c3-9280-a7adb429c6b1	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
993aa4df-b36e-44c3-9280-a7adb429c6b1	4931ca8b-4d50-430d-91b8-ee951628c715	t
993aa4df-b36e-44c3-9280-a7adb429c6b1	486daaf5-0630-459a-a837-1116a367c949	t
993aa4df-b36e-44c3-9280-a7adb429c6b1	8df7bc64-1802-4cbc-9c02-146070604915	f
993aa4df-b36e-44c3-9280-a7adb429c6b1	b34568a9-d1d9-427d-babd-f9457eb7c470	f
993aa4df-b36e-44c3-9280-a7adb429c6b1	6bd0df37-c646-44df-b09f-388487bec7c4	f
993aa4df-b36e-44c3-9280-a7adb429c6b1	5c24268c-337d-40d2-883b-d9cfdd97769b	f
23b63da8-ecde-4344-9d67-1a93fa78dfd3	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
23b63da8-ecde-4344-9d67-1a93fa78dfd3	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
23b63da8-ecde-4344-9d67-1a93fa78dfd3	4931ca8b-4d50-430d-91b8-ee951628c715	t
23b63da8-ecde-4344-9d67-1a93fa78dfd3	486daaf5-0630-459a-a837-1116a367c949	t
23b63da8-ecde-4344-9d67-1a93fa78dfd3	8df7bc64-1802-4cbc-9c02-146070604915	f
23b63da8-ecde-4344-9d67-1a93fa78dfd3	b34568a9-d1d9-427d-babd-f9457eb7c470	f
23b63da8-ecde-4344-9d67-1a93fa78dfd3	6bd0df37-c646-44df-b09f-388487bec7c4	f
23b63da8-ecde-4344-9d67-1a93fa78dfd3	5c24268c-337d-40d2-883b-d9cfdd97769b	f
0f67de81-9843-4253-8c3a-0352cef40636	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
0f67de81-9843-4253-8c3a-0352cef40636	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
0f67de81-9843-4253-8c3a-0352cef40636	4931ca8b-4d50-430d-91b8-ee951628c715	t
0f67de81-9843-4253-8c3a-0352cef40636	486daaf5-0630-459a-a837-1116a367c949	t
0f67de81-9843-4253-8c3a-0352cef40636	8df7bc64-1802-4cbc-9c02-146070604915	f
0f67de81-9843-4253-8c3a-0352cef40636	b34568a9-d1d9-427d-babd-f9457eb7c470	f
0f67de81-9843-4253-8c3a-0352cef40636	6bd0df37-c646-44df-b09f-388487bec7c4	f
0f67de81-9843-4253-8c3a-0352cef40636	5c24268c-337d-40d2-883b-d9cfdd97769b	f
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	4931ca8b-4d50-430d-91b8-ee951628c715	t
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	486daaf5-0630-459a-a837-1116a367c949	t
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	8df7bc64-1802-4cbc-9c02-146070604915	f
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	b34568a9-d1d9-427d-babd-f9457eb7c470	f
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	6bd0df37-c646-44df-b09f-388487bec7c4	f
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	5c24268c-337d-40d2-883b-d9cfdd97769b	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
a59aefae-873f-4e9d-a683-4687f180a9ab	1bb248d1-b2ad-4098-8e4b-5c06b8494684
6bd0df37-c646-44df-b09f-388487bec7c4	fdbb7834-630c-49ff-8cd7-ba11fbb55806
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
d1f1e1d0-c742-4159-b16f-f938de28f4b3	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
54326621-5ef4-48d1-95ce-007246002b85	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
928410d1-e6c1-478c-94bb-0ae0744b958d	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
79cf8ae8-c1a8-4ba4-b752-4f8c0e7c90f7	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
8b1b9165-194f-43a4-b3d4-f58b2f190f92	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
3f0a6452-f30b-4b1c-a52b-131e4b3d83f1	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
65e913f5-1f34-452f-bf81-fd4926096ed3	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
f562da10-9552-42d1-9cb0-910775a2f8eb	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
df0e24c6-b79c-410e-b10d-2babd307a49d	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
f5731a1d-666a-4cf5-a6ab-cede0b9c10ad	rsa-enc-generated	master	rsa-enc-generated	org.keycloak.keys.KeyProvider	master	\N
89287929-37ba-494d-99a8-5575fea5b83e	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
f7d241e6-9c88-4d65-af16-812b7f6f87b3	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
cbfef439-2dfc-40cb-812e-b2b36df7a755	rsa-generated	Superset	rsa-generated	org.keycloak.keys.KeyProvider	Superset	\N
191d461a-714c-4d27-a1f9-18cfb400dc29	rsa-enc-generated	Superset	rsa-enc-generated	org.keycloak.keys.KeyProvider	Superset	\N
4a6fb659-c24d-4f9d-b832-701992810463	hmac-generated	Superset	hmac-generated	org.keycloak.keys.KeyProvider	Superset	\N
f3c5b5ed-8a70-4ee2-894e-2ce7ee84c244	aes-generated	Superset	aes-generated	org.keycloak.keys.KeyProvider	Superset	\N
88a40d54-19a8-407c-92ab-d474e8c1782b	Trusted Hosts	Superset	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	anonymous
dd9dec58-2251-4568-89b6-e1d6d74bccd9	Consent Required	Superset	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	anonymous
d568a694-754f-4d2f-b06e-7dbf0c0d819b	Full Scope Disabled	Superset	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	anonymous
f0194a2d-02e9-4ec5-8723-5e177fc5a559	Max Clients Limit	Superset	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	anonymous
5daf6c3c-d59a-46e8-9dec-c54e2fd03076	Allowed Protocol Mapper Types	Superset	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	anonymous
68e7d4e2-42ac-4b12-8675-55e45d93e3a1	Allowed Client Scopes	Superset	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	anonymous
d0c4a52f-e497-45f4-9868-0746191c18dd	Allowed Protocol Mapper Types	Superset	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	authenticated
2305a244-a34d-440d-a4af-d315906c7b8d	Allowed Client Scopes	Superset	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Superset	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
50edb9e7-f73b-418c-970b-105d56f93674	d1f1e1d0-c742-4159-b16f-f938de28f4b3	host-sending-registration-request-must-match	true
9615c9eb-89d8-4eef-ad45-7cc20eedf439	d1f1e1d0-c742-4159-b16f-f938de28f4b3	client-uris-must-match	true
370be2d9-e3b1-4735-80f2-8e9ba51bd838	3f0a6452-f30b-4b1c-a52b-131e4b3d83f1	allow-default-scopes	true
5a026cf7-247f-4ff7-83a1-efcd22c695fd	f562da10-9552-42d1-9cb0-910775a2f8eb	allow-default-scopes	true
52076e41-64a7-4615-a0df-7c44c28cca6c	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
57628322-3700-4761-802e-898d8e5fab83	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	saml-role-list-mapper
2c2db38a-1770-4466-b800-a3a634ada2af	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
af20309f-1353-4e83-b4f4-f41a47f9aaf3	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	oidc-full-name-mapper
20120005-5e00-42b9-a3ed-f45fb3ad0980	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1628b312-a514-41c7-b0d4-fda7643bbe10	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	saml-user-property-mapper
d0eda9fd-9782-45b6-a3a0-74d764c37077	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	oidc-address-mapper
f40c0e8e-f8e2-4b1d-989b-a1de9c74c250	8b1b9165-194f-43a4-b3d4-f58b2f190f92	allowed-protocol-mapper-types	saml-user-attribute-mapper
b9ff493e-50f1-4dc3-896f-4ba0eb2024ed	79cf8ae8-c1a8-4ba4-b752-4f8c0e7c90f7	max-clients	200
aaeb71a7-c5cf-4f95-b339-9f41b005a6a6	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
853d0705-06f1-4205-a679-74ff82431512	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
a57ccb47-2eaf-4586-868b-2112b9ccede4	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	saml-user-property-mapper
722de871-25eb-4a24-9f9d-3baebe480227	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	oidc-full-name-mapper
850db978-c8c8-4b54-992c-64cd56803e02	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	oidc-address-mapper
85e7e31b-3a7c-43ab-b52e-fc30ccc404a8	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	saml-role-list-mapper
6564c1df-72e8-4f58-aa3d-e671a592768b	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	saml-user-attribute-mapper
9abe8f9f-eb9d-488e-9fbd-ee8b487fd384	65e913f5-1f34-452f-bf81-fd4926096ed3	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
45bf9782-fa33-46e3-9c02-a7938b58fcd8	f7d241e6-9c88-4d65-af16-812b7f6f87b3	kid	4869e1b3-4f36-46b5-bc63-7e9d690b455b
4f03033c-828c-44c5-8ed7-220fd94aae14	f7d241e6-9c88-4d65-af16-812b7f6f87b3	secret	p6O5oiMvvOXpar9uo2pyFA
d435c523-b7a1-475e-a2cf-3152f6c4445a	f7d241e6-9c88-4d65-af16-812b7f6f87b3	priority	100
54878bae-2d50-46de-96e7-dcf774ad4175	df0e24c6-b79c-410e-b10d-2babd307a49d	keyUse	SIG
0f75a9be-8942-4612-b318-74b2e0168199	df0e24c6-b79c-410e-b10d-2babd307a49d	certificate	MIICmzCCAYMCBgGCIBFKFTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwNzIxMDkyMTIwWhcNMzIwNzIxMDkyMzAwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCOgAJnuUZuw4Zqqk0DTGrB2kbEhmwtE7NxL+2gffq4Q9KrYf4FQ4BcdzciB3h2BU9q1XW9GAxxCyiOao0Hf2KyAJiN1ogoHlQxKKSLJwWz3mtE1GQt02fjF83IoRHXvrEMgRhZTjZqcSjasEYK/RwU0JKaPyoYKoS+qoWhUR0damic55LQVKbZ2evYA0oYle/8Pe+wbbhe8LlPT7DRk5vYH/4XEae27xW/vtJ8y6cYW9i/6Y0cntOpnxJ3UtPDjZy8bgvYwhqGvKb7Rz+L4JKn3tGfBAEeWXyTtfub5ADHrXqoLYanLFg2B1PCLtm4fZdv3jEc/2dp3eW//wIK01f/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAqiDnyvpDJENt33DAAcIQ9LT7wYiu74m2XZXI/px3zxdCBwo2xNB6Ecan2kwhiWqEWL0tQ3Q0E1Wf5XA68XuZKxYagVBLVHUfcof633df7yKZb8ZsSxHh3D31fI64q1g4otCpq6iItidyumkY1G0P4mR+9ukocPp2asdYpVpLP23MrNKC04vw0sDmiLRgeKP5+x3upk4Iv2tIn479tQdWu1eUJWwMIi2VPzlFQV2p5F+04s4pwzpWsPDHYgB54a1f4tsJKGc8OGeHUl3plAo+ztdfQyQkxk2DV0Eu6NnBB3ZlUyihRGlF+Kr9LQ39EQ3bZEhbukvsxGoDk3NEX/n8Y=
9e4f7aab-249e-4ff6-beef-8fbec66ca2ee	df0e24c6-b79c-410e-b10d-2babd307a49d	privateKey	MIIEowIBAAKCAQEAjoACZ7lGbsOGaqpNA0xqwdpGxIZsLROzcS/toH36uEPSq2H+BUOAXHc3Igd4dgVPatV1vRgMcQsojmqNB39isgCYjdaIKB5UMSikiycFs95rRNRkLdNn4xfNyKER176xDIEYWU42anEo2rBGCv0cFNCSmj8qGCqEvqqFoVEdHWponOeS0FSm2dnr2ANKGJXv/D3vsG24XvC5T0+w0ZOb2B/+FxGntu8Vv77SfMunGFvYv+mNHJ7TqZ8Sd1LTw42cvG4L2MIahrym+0c/i+CSp97RnwQBHll8k7X7m+QAx616qC2GpyxYNgdTwi7ZuH2Xb94xHP9nad3lv/8CCtNX/wIDAQABAoIBAHwPxIhLTJ+oSMFarRvfDt7gy1XT9iA0k7hKUua0Z3C/U410DfTFNN7Lx8svl9egfej0GMJdSo+seE2tREUvyVxRmn96NCZBaWk3CjI/8f4L+XX+N42SDVMv6S/v0xny4i+RwQIXTtbS2A+1AfYVMLqKb+gsb9iEQ/e/fAHbHa76Idh+N37tMe8wEql1/os77F5xvsxfdH6xEVZqhiTLsa24m1zvFe34mfVTpRUGuQSXq4HZe0eIIc5YFsOmcPFmjnIBmQUjezxsTwAlcKRJbhffG9AQ1Y3zBQg+rpfgZug/Egdk4Xxl3Wx2lc56ARYrvamOhCvZJRbDZdAd0VV8uHkCgYEA3ldNhoEabXlRLIQnWfIgQJ1RWdgfrnev4D+GcF1NC8NbtCV+6vAGtljY7Glerpz7pTuB6K3md8vLLoEjslG3F1qwvTqG45hvQ6WwY1ZSQeaZIQ3YFPfe+qFqjS2dZNJR/zfsZ5dth8IQHjCut7UmQggeq6acyijkCgFM7sIvsFsCgYEApBKD83BXSjSDxIw5HmO6gkp1qcUgm0XpfIZigeMs1pRVHtdx4/2oMvl8dDjIfIsTiAbyVyKGQ0uD+gUHoZYzZbLJrCU4vZ5osB0oVti2IjHX+hKUands/l36TGDdbpcPQpt65KW6AVo+Pfw2ykGPP4Wn7BvFAkAylzQAzDQTiC0CgYArD/OW6mhI7ac4HPxWIlv2x8Fayk4Qh2PL5eHO33MtpQ+cy2pSbFyQcpLI7vuEjCj87pKRkyTA7PqULjTQs5znbAwxCiXX7M0X5/5KrwxNcTEVQs4n+X35QswVPdFvFoEFEjq6MYzoL0DZ6Ane0LnxLgtqqWFSkirgeTICSB/eYwKBgAeM8pWZber0T7wT1+0WGdc1JgUSFVYP+ZbJeG8RzVZyrRgmQg+D9OGjqZ6Pnmpc3CE+cJih9hvStdgjsx40k1jyyWUqsVnImHjCXsDgaEFamd3gTQQ5SsLKAGLTcl1Mhl9CWH19Qvoc9RBVMxBLxBPgSsIK5R4dZjafJgo/u0ZhAoGBANZS06s15yn7MDAkVIk2RI6kyBOkHaIzmSaj1Q3OfBEpq2Id0XwTgKM12Dk8/jA92B+futAplWgBGT9ve1JpFCR2ppPDX4tmtVxKZrGsDRi7KexevUOg9QgDJdO3ukdcrZSSnYtxGeG2Kz/tDzHajy+EkFxkSiODOtQpphdivN9b
e01680af-184b-4fd6-baa0-4aba95d40e0c	df0e24c6-b79c-410e-b10d-2babd307a49d	priority	100
8eca3f65-bf2a-4c7d-8488-53a60ae254a3	f5731a1d-666a-4cf5-a6ab-cede0b9c10ad	priority	100
081b320b-5e94-4ff5-8bf8-8dc997aa355b	f5731a1d-666a-4cf5-a6ab-cede0b9c10ad	keyUse	ENC
3ed8e1c9-c652-4a56-a94c-815c571df36f	f5731a1d-666a-4cf5-a6ab-cede0b9c10ad	certificate	MIICmzCCAYMCBgGCIBFKlzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwNzIxMDkyMTIwWhcNMzIwNzIxMDkyMzAwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCBgnwERp9Vz4wgu3PLxjd69mygqelS5hv96NQPNIeCFHNXPLfHxK4KjhPXgrirKXZyeZcgEVyI6hkuInwXV44HoFZoKxMQ5CEaqEOfmED2qSMcmjZBoaR+H2kuVkpbqNL6V7PnjL3O3J20yQR2wpz220SsYiIlSXirIzuezUH2wiWqU54qsEXxqU/ufU1A0HgS+vbwkOFW+D5bFea/aVwEIEAWVUUEuy156OK4FKsXkvXFyjGMkbyRILC2rU/R246AK8UvmOXdXpf7hMbvfWr4eug6lC05IwKRkf6lu/BAQHHH07QScD+oodIg1EDG6qt/Ic0qX6BaBCbrO3Wi9m6VAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG8x51asKog8KYlDKmBz/rxCyN86/CYU6yFkt0n8qq4DVl6bEPnhclYyNbCP3+qzDzrY4ygUg3P8THFJoyh6TFu6fpu/TI5xT09R7gIeVle3LIrxitJLEEhnJdBNkMZ7/SFNTOF6BVM9dKgKj98xzIVymnEYIR12aP6HExW0xBtM48Fpvg9AEiJ+S0PN8f8b7sSPAuLI/aEp9jiiwHCTlM/hE4V26LgMFceMRbA/snhEI6ARHZkcKvIxxrq0TAWNFKEjFYNH1ZhQsOiU73gHF+LoC+PiJEfoO6GiEun0nfZSa+JGFH1fu9ku81ydcTLGQXAJb6FyRdik4Yyb17VGH18=
55a844f7-f71c-4d72-916f-bb71af17bf2b	f5731a1d-666a-4cf5-a6ab-cede0b9c10ad	privateKey	MIIEogIBAAKCAQEAgYJ8BEafVc+MILtzy8Y3evZsoKnpUuYb/ejUDzSHghRzVzy3x8SuCo4T14K4qyl2cnmXIBFciOoZLiJ8F1eOB6BWaCsTEOQhGqhDn5hA9qkjHJo2QaGkfh9pLlZKW6jS+lez54y9ztydtMkEdsKc9ttErGIiJUl4qyM7ns1B9sIlqlOeKrBF8alP7n1NQNB4Evr28JDhVvg+WxXmv2lcBCBAFlVFBLsteejiuBSrF5L1xcoxjJG8kSCwtq1P0duOgCvFL5jl3V6X+4TG731q+HroOpQtOSMCkZH+pbvwQEBxx9O0EnA/qKHSINRAxuqrfyHNKl+gWgQm6zt1ovZulQIDAQABAoIBADT/9Ui6rhIr8aijjevinmnP1vyZDEdErEfotH/Ue3AcdmdJDdzO/HqNUklr0a8aNML8R4B0Gm5dfxiGPEpBJnqwfyv6FL9g3LtQCPyTDmLjLN9TrMiHIg4LRLwVzDBekpios5Ma4cJ6Pn/xk8YWNq4/ZYc2Ucr4mk1PCeMfFNOqYa6MvS4GW+KA2jpmGJQRsE5Nd5v45HIISLYfY8DaPWGKIQWO6QtulHE98A1CuZwJb7NFlzLcPcowoPjiZAtmOC2Z6Eod4XJ1xk7H0F4Wci7PJDchl+RoKJeKMI09bzge8Om+G+ylq+H5h/cHATsizM8idmFJcK+PkbRF6XgWZ7ECgYEA0nYm1lgk2fuKyqNZmuhhmtERLp+WbVYyMXS/MuVLE74nozuHzyFuN4ck28I3uL+vNAd8TY0h4+T+nKej4f9cngwwuIPRGaYK6T086R3gvurBe8cSeWSo77L4XCgRLG69wlRlrOa6xBMg+VTtkkjNwKK6sUmIA9nnUddPb4AXFZ8CgYEAnYhDbJU7L7RTxoNMwBugzP4gP2z1tvtYVOxex2XqhsbfgPKgufD5CpFErtj43gsKoIUFcE6DlFgmtMi26YKGPFuGd2xhU1Vh4N5yVM8kP5Io4bhKY2cgpUGdG7gj+8avTvZcJMXAeUIkUSyVeCQymr1oPWczdGbCJEP+rXZMR0sCgYAw7Y7x3eQTWUtW+MroHIY0e85GzIsoOBXLMZ0RtATUPizw4fIc0WTSO/TxsiFKLiYJLoRTczAhzybyPHb5H2jkxWi+PMbr85ItzzLN70hEmkcJA6rj1ecActcSda4oakZrWzuYCrv4wYm07W2dyJcs5agJd1LLsmj4udmZzmmPeQKBgF1hxh4axE/+BF87vAZxGjwKNJGEhI+opO8KgxCOYJzuTNVCfnZa2zYhcOZ45eWyA+WtlNDDKgqIysEF7i+z2OD0nFw0mejtRy0mj/2oIOOyP5u2RBpyqo5ru7cPy/zXBVq4fVyrAPKge6jG1f+27Wx+9MjZYU4SD+mxiMnIw2TLAoGAPOGyH/Pov1ZCAmoaMtwCTuE6uY/hzE7tJ7NDTRJARvGqKq5FBheHARZsrF4Dv4pB6V1puSysomaXDMF34cXZlggmA9q/DrUz71Tu0rIgRTlAHtMncebqhz/6IsSt9/SuMAg5akOGfbGgqw8/hYkpatovt4dHT1iSp3LL7Hj5icY=
d40857f0-2c93-4451-ad8b-e6c99cb2af35	f5731a1d-666a-4cf5-a6ab-cede0b9c10ad	algorithm	RSA-OAEP
7cde031a-106b-47f3-862d-1225b90159ea	89287929-37ba-494d-99a8-5575fea5b83e	priority	100
e210a82c-c05d-47ac-a18e-2174793f6f46	89287929-37ba-494d-99a8-5575fea5b83e	algorithm	HS256
5569ab88-f264-4468-ad51-062bf983d791	89287929-37ba-494d-99a8-5575fea5b83e	secret	M1Xwybk386pT01tbOMg7NjNRRTCyghTt4-jZyaIGkijLFXaTMW5QyrROLONH3fpEMtQL94bAjA8Q5bkWWz_4PA
ec274ba4-c150-43f5-a6f8-bc72e573865e	89287929-37ba-494d-99a8-5575fea5b83e	kid	35df71cb-229f-4fba-b2ea-d0ee065d74d7
85d911f7-355e-4c69-9adc-6e24d1bcb94b	cbfef439-2dfc-40cb-812e-b2b36df7a755	privateKey	MIIEowIBAAKCAQEA0ppb5o4f2CygjBhXcjyjtHtr1NaYICZfjdM3POfcqPrGfKXlipFBnFEds0V9aLTW+Vle/agvSIuJhuh1vV1Q1EsF/LGYZWr5dCOsYUMIBytMNZxOr2476UAoND7J9XLhslSX1E2BchLHyZ5EfwSdJ7fRLBJIKz2iAUSUcbGdSYdpxELOD+tEV31Y8IozYKkdUa+Mq3L3qt7GZPa89H7ERr8D4TuwuiN04lt7KlSIUvh35vC5Ksr+jjOgYqBFniIbFYxHVPwl7ltt/jLtECEJ29kZI25DWjp34uLOYyHguwQm5M2gaAYpFXvQINochnK4oLZ8RYODS6n1h4BK/qwDKQIDAQABAoIBAAfdCZdnMRsyN2BjvEggqYAgp5sP1ChHJoQ2IbbddWi9zFF1JEfzOn7qrHA4JQGW1vwCcUCJWhKcWys1XMgQRudWUcfonacTwnKqrlIHXbJe1H6f8nQsaoJACgBBY+sNOg4diHm91xp6RwlpJmeTtYZ5H49Es3sh1v2zINPJ7PSEz2/VLmlCzEtpGtJHWDNkRMuJwK0h7SL9I5zObFYL8LfR8SkyH5tGgDDigbKVM/uFYRDmIMEbd5BDSLFeiAb43DZp7WqLGlsm+Q91q/TNCTsxkP17M1nMAEbMrFl+iZ+QSDSJpBqfWqj5t0TNOeD/35ea6rQT+BEG+YT80H5I0YECgYEA/Qymjp9CjY8EfWAlWfMZb6bGL/XsZ4T56g5ptMjS6rnK6R5Y4vKoZ8bgZfcNNZXMaU0tTy88TWATuFL90P38RvdR4QJS3SJGHRbuL25WZDidF7bKdfIt0EqaXEzvE92mWNf6O9Hfp3OK3FiqHPryO4PdTXEsCSe0ewOwvdRzjHkCgYEA1Q8BmNeUx0p4ajkFSHSFgstj869KRma6bXLmC/4HakMg/NN9jeuq0BMkm4U0bs4v3dHReBTaDSrlvlrU1wSyhTUf8vwWhBa+++iNTVPaIIols+XEdfI2foA5417QqAdT/rded7Q7gUjEdtBmiZ3wyVQ+G17+pDJ/GTlkeh03IDECgYEAxC6fnmj4VvkvGOiGbLMc4EPi2OIHMsaUXpJn/2HGq3X5Szxc2y4Xw8UaydJ8KjQFswnDe+V6Ed7PyxKEdxfCE17A2vpLNefRhdH2PU2EqtR9bhon4sMsI5UDEVYP8E3iHnTrKp9ujsr0OBqBYFBpphx4YQbBhiODN+/HgZSJNLkCgYBjqIxHsPdPrP7cOOXGuXJF9ts+/gxRF/Y2AdunWmCfjNzeRhLhko2onHuwH0OiXOG48U74y1AffqROQPBzzyet9WaHYvEpQfZ9oI6P0BwkwlnWZzBZNz3UOChbuVsCbcMVTzJp7a0z0RTMurhrwKwDkFsotGuJ5HDdHKJqGEZT0QKBgBACoPECMQgBjut3YB9/JTvHfJTQhQJ8lbLjdR4t5kquDqfBIriAh6WdgweXnyJDlUHsiB8sBWyqyVDHg6kWIbrUeWgpCLb/hQUlFzv2yQF/agkrV0nJt25GbxysYfZLsyVz/vzKA/4uk3ho2eKsbJfaqmsVspDYpPBIcy4GNnCU
3a28606f-4658-475d-be2c-470c03074a7b	cbfef439-2dfc-40cb-812e-b2b36df7a755	priority	100
96549eb5-4678-4e51-8613-de7cb56b0cbd	cbfef439-2dfc-40cb-812e-b2b36df7a755	keyUse	SIG
737af879-8945-415c-b968-5adf66f25c6c	cbfef439-2dfc-40cb-812e-b2b36df7a755	certificate	MIICnzCCAYcCBgGCIBGXrDANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhTdXBlcnNldDAeFw0yMjA3MjEwOTIxNDBaFw0zMjA3MjEwOTIzMjBaMBMxETAPBgNVBAMMCFN1cGVyc2V0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0ppb5o4f2CygjBhXcjyjtHtr1NaYICZfjdM3POfcqPrGfKXlipFBnFEds0V9aLTW+Vle/agvSIuJhuh1vV1Q1EsF/LGYZWr5dCOsYUMIBytMNZxOr2476UAoND7J9XLhslSX1E2BchLHyZ5EfwSdJ7fRLBJIKz2iAUSUcbGdSYdpxELOD+tEV31Y8IozYKkdUa+Mq3L3qt7GZPa89H7ERr8D4TuwuiN04lt7KlSIUvh35vC5Ksr+jjOgYqBFniIbFYxHVPwl7ltt/jLtECEJ29kZI25DWjp34uLOYyHguwQm5M2gaAYpFXvQINochnK4oLZ8RYODS6n1h4BK/qwDKQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQC7TI+HiUUE5r2P57spTfnwNJyQLZtplaKNY68NhPyv1Am34ZHXOvnbViKVLijA2bKEf2BqL5KOMclBR/DebBFvtHM0+MistYCbkzI9YJ8/pGS6wOv5NFDvVTOQK3CJlK7qzBSGcrdvIBv7+bNzcGohLRnqhvL7h9+qe6UBwNjD41DD6CtqDnTcQshaIlV1OAaCGJZfHhu3wKga5y2046PJTVA/0OlEInyyGRHXWAd0sp8kN6RskVpXHTeNmHPla3iw2CxyYcB1+wJyvcOxts6g7IXpxYfS9cl+wl9ol0jEd6WfGYgI1PO2l3bTa0s4XxPU7DPfKlATitbdZoy29FBl
5042f6a1-cf72-4954-a16b-e0e1f714fc16	191d461a-714c-4d27-a1f9-18cfb400dc29	priority	100
a6e1afe2-8f2d-4f51-86c3-a99ea04fb579	191d461a-714c-4d27-a1f9-18cfb400dc29	certificate	MIICnzCCAYcCBgGCIBGX3jANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhTdXBlcnNldDAeFw0yMjA3MjEwOTIxNDBaFw0zMjA3MjEwOTIzMjBaMBMxETAPBgNVBAMMCFN1cGVyc2V0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk2swq2wcXK6Kd3qS3Lj8p8N+D+5tqZjZucJYHZjwPiWPIZRT3rGvcMJq2hLYuWTSFVr+2ZY38iZ4n+vNhFTkER+IZP6whorU+mXnsrNJMRFvrRdHhRLMqXiFIkSd4Q0Xd2Y6dVUqzE46suroyJPBXG/A+stqwcjRzYaMJHuDk6KhXOpOo39nYP+4Ghh0T6HyeusPtaUG53/muaMdzEGxEzVx1Wf1MdAGMxCEB1cWTmrbWuyVf5ZHhF3Ke2BFhXqET/vYzcsh6WGns0KpsSv+8XUwAIjY2DgloKik+Z9gwwrlntcjZGs/uYsPRZM1ueMf7y3/cnzZq2oNVpOlo+krjwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAaE4ZgojrdUOfJxITg0J2GneTBTT/UGE3e3bpUHuDKY++3+09buW7ZzhsLLjUTLVttepCAI9f/WKRMw8NCTFGiysbnrngMOiBxPKciIAuViolLOYFrG5k0Rckr4Bv0FPuXcowEzlbzDTSc5nzhqzssNtP1ZkMs097V2w4Nz0KhYw44UWhTD0/Vcj3Vc6S7KoRG0DDpPQBEZbqZ3sHU2CeNyM5/DZaTscpx6JUhW5RjnM1L0WUND2c6l6tbmW2OivmMhJvdnNJses2G+wtFreJ2OB9o3XFKNJhoaoT+vsvnHO2aB8sX1boB0Y5PoGHe6iki4jHG1HXakHgs3Td+BGLo
5a520621-7571-4faf-8745-981e9606aadf	191d461a-714c-4d27-a1f9-18cfb400dc29	keyUse	ENC
fe825b20-87ce-466b-a2c5-eca6c1cccf0a	191d461a-714c-4d27-a1f9-18cfb400dc29	privateKey	MIIEpQIBAAKCAQEAk2swq2wcXK6Kd3qS3Lj8p8N+D+5tqZjZucJYHZjwPiWPIZRT3rGvcMJq2hLYuWTSFVr+2ZY38iZ4n+vNhFTkER+IZP6whorU+mXnsrNJMRFvrRdHhRLMqXiFIkSd4Q0Xd2Y6dVUqzE46suroyJPBXG/A+stqwcjRzYaMJHuDk6KhXOpOo39nYP+4Ghh0T6HyeusPtaUG53/muaMdzEGxEzVx1Wf1MdAGMxCEB1cWTmrbWuyVf5ZHhF3Ke2BFhXqET/vYzcsh6WGns0KpsSv+8XUwAIjY2DgloKik+Z9gwwrlntcjZGs/uYsPRZM1ueMf7y3/cnzZq2oNVpOlo+krjwIDAQABAoIBAQCO22AVrrWpZwcOE31AYg+NL5f5Lk+c+196cQfc3rlpMBKNMuU3uC7QcccEPyFAP6CKS10OVFEw2vEn4GWPqIg+w7T0Ug+UwfL0GE640J7L6x6yuQ14uqgUTpONirsIPRyRe0KJM5g+1kxx18zvmqfVwQJcx0VUNxyBM7KZJAx0wrpO00NXfVA0GpSSBzWZXM0zR3GEsFhV1+TFKdGSW4obCBHrPFx5BX6HdgHtHNHX/0vXiJgzpIFC/UMOiB6y/ItjH6FoEa2W1Gowxkf4jSEedeqlcAmASf2fXvHKz7yyEpMCnpkEg62S7qGthqEWSPjlbsfhsdIrjzZwZIxrFGXhAoGBANGIqx7Wp2e8V3/+wLvH0SBQOObZthXHs12ZDGFr1jmWzaQDhORf/B1RJgXrOszyMD1jztHvlIB9Ajlf51kZnLkf/AkmieLHe5InU3282+vIiRTaS5AM58T1AgsVIHWHorayb77R6WerrgNiaM5FHvAvRxzZCZ9XjYyxJ0KJrRlfAoGBALQcN3iKCV3YHuxTtkWN3VCHI3lHkVLVRCiv7A4zHaPKpSBrm/QLnHhdCdXlEbnIk1zPY8YqYWU5c7AMrZtVuDEVIhFd3x143rcukW32H01OvotIw/pa6N80LQkt56Pn1jUBXcOymDcZ1JhcRP5g2Wy7Wi84qi6Whvp4awyze6vRAoGBAKCqNuwyk7KLTFysroRONyCb4sXAckpJElPWoxOgaGdIJu54dFHY96xTKOCo+jFkE3E/MrrvBeNv92CfFPnRFcctq0go8NmfNDVhSjfDtK4a2mHO8NnHy3/Ojn6I+JamJjIIqH6c3mfL0GZv8wUXIx3wYorQMPypWbRjskLm5n/pAoGAaDZrYjN8d/A09Ej7jgMnqxCGVgYy79q2NVSVISIyZDM8mCWrdunA/2PV7Q091GFZ4rmc4WxkLk2vwo2TZe2TRdMUgzftgQAO3a70NsvSEMkfNzhDLPitBXkLFeSZwxzBtKm1tyX/LOKlQAMjaIxhQail5ezDi3FNaF+EkTTIugECgYEAg/c6+mML3fygrVqBBKhiqBG9zw5Nbi8Zj6eqZWKsS9PKN1xxhk27BjpypWh1ipjrleMO/FYC+7nvwPJAi4/+40OyTWYp0w3Tv+xvM5UyL/rG+qDypgcgouS34nDFE3/Crs4UIdEHX1OsSKDDg6eOKyocpa0X9RwUVTXPpGP5ABk=
bc5bd541-38f4-4aa2-88ef-e9803002499a	191d461a-714c-4d27-a1f9-18cfb400dc29	algorithm	RSA-OAEP
afab900a-b7d2-4913-9b1f-b6f59caece01	4a6fb659-c24d-4f9d-b832-701992810463	secret	AqS8RJ9XCftAw-cWaHDhtKPo4uSeDi-k-Zj5ZNteKAgc8jqJJtN7fpynQswXC5ivIneyBKZ8-DqhROyRot77PA
53102e2c-46bd-4458-b636-7ac22e73b5ed	4a6fb659-c24d-4f9d-b832-701992810463	kid	96cf1497-9b4e-4ca2-bcd3-afb088b8ebdb
5ce772b3-c591-4fde-887d-a00aff0b8918	4a6fb659-c24d-4f9d-b832-701992810463	priority	100
62f4ba6c-9ae8-413a-afd9-637dfef6ab5a	4a6fb659-c24d-4f9d-b832-701992810463	algorithm	HS256
91b02c62-624a-49aa-b22d-2c3c3ff9bd15	f3c5b5ed-8a70-4ee2-894e-2ce7ee84c244	priority	100
606263a5-72c5-4a00-8f7a-265ce7e37bca	f3c5b5ed-8a70-4ee2-894e-2ce7ee84c244	kid	aa775a80-f658-43df-8fe1-d6dd99b893ea
91863c24-331e-43b5-b429-8ab6110ea4bc	f3c5b5ed-8a70-4ee2-894e-2ce7ee84c244	secret	melsNefmvD4z0DUlrYKulw
3c741137-b31b-4d7e-95c5-351e0702756c	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
1190182e-680c-448c-b863-961b66ce8b18	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3d7e409a-6e51-4220-b157-6d7abc68c65c	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a9365d0e-bab0-4ae1-a2ae-0707156889eb	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	oidc-address-mapper
962d7249-05a2-4b0d-88c1-b1b0b293f73a	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	saml-user-property-mapper
8c537c5e-70ae-4269-930c-6d9827453923	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	oidc-full-name-mapper
0c46725d-bc37-4367-806f-6f9ac6575343	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	saml-role-list-mapper
8f8abeef-9d65-4622-9d83-a9d4d57de967	5daf6c3c-d59a-46e8-9dec-c54e2fd03076	allowed-protocol-mapper-types	saml-user-attribute-mapper
fcb1412d-0e57-4595-9c46-3bbbbe6a53f9	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
43278e57-0699-4bf9-a0da-f546e6a66688	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	oidc-full-name-mapper
a6dd916a-ddb8-411f-b1b0-1af623514d96	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	saml-role-list-mapper
94c306fd-a9d1-4601-9771-faa95fb67405	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	saml-user-property-mapper
4ab94b14-7166-425c-b418-5ba39a24cf3f	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
acd9a21d-83f6-4d4b-932e-e5d743b59cc1	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	saml-user-attribute-mapper
8dfcdb48-a8e0-4dfe-89b0-f7fa788cb62e	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
bd54d25e-a930-4515-aa55-788976f0d8b1	d0c4a52f-e497-45f4-9868-0746191c18dd	allowed-protocol-mapper-types	oidc-address-mapper
6b1e709c-fef3-428f-b1a6-fdb62a3eea26	88a40d54-19a8-407c-92ab-d474e8c1782b	host-sending-registration-request-must-match	true
ea903201-03be-4069-b483-3d88895d698d	88a40d54-19a8-407c-92ab-d474e8c1782b	client-uris-must-match	true
e61331a1-3319-4348-9ece-d9e7832e0f37	2305a244-a34d-440d-a4af-d315906c7b8d	allow-default-scopes	true
8abc7cfd-55a6-4dcc-ab66-2c158fe25985	f0194a2d-02e9-4ec5-8723-5e177fc5a559	max-clients	200
7b74007e-0c41-4c8c-9228-5d18df59f0fb	68e7d4e2-42ac-4b12-8675-55e45d93e3a1	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
af4c5f38-7436-4e1e-9808-7580aacb067c	9b2a8501-803e-4ad4-a4bd-6a622ee279f9
af4c5f38-7436-4e1e-9808-7580aacb067c	a6fa9692-29c6-42b0-b543-7939044f869a
af4c5f38-7436-4e1e-9808-7580aacb067c	96b1ce26-c6ac-47de-8cb1-93f8fe2f698c
af4c5f38-7436-4e1e-9808-7580aacb067c	dd37027f-80c2-4989-a009-9957e196dc04
af4c5f38-7436-4e1e-9808-7580aacb067c	9453986d-40e9-4397-a48b-159761ec9a36
af4c5f38-7436-4e1e-9808-7580aacb067c	4767a9b2-1563-4ba0-9d6e-006ebffcf015
af4c5f38-7436-4e1e-9808-7580aacb067c	a6ea213a-ff07-4506-a4ae-e890cc824bc3
af4c5f38-7436-4e1e-9808-7580aacb067c	227e89c9-6371-4483-9738-c19106067bca
af4c5f38-7436-4e1e-9808-7580aacb067c	7058c2c6-3e93-42dc-82d2-d8b15db964c2
af4c5f38-7436-4e1e-9808-7580aacb067c	bd1ef64d-d2ff-459c-97bf-28671f36b784
af4c5f38-7436-4e1e-9808-7580aacb067c	87d791f1-4216-4583-b6c2-b440e6aeb8cd
af4c5f38-7436-4e1e-9808-7580aacb067c	c09f614b-4d9c-45e8-a90c-5415d5701ef0
af4c5f38-7436-4e1e-9808-7580aacb067c	c6397646-2212-4412-820c-84c2a6bbfd23
af4c5f38-7436-4e1e-9808-7580aacb067c	8ff63cd9-3097-4f05-8041-342e9db00bed
af4c5f38-7436-4e1e-9808-7580aacb067c	bcb7de80-39aa-4728-be52-e68cd9cff6f8
af4c5f38-7436-4e1e-9808-7580aacb067c	c93ca2bc-7041-4ef4-afc2-bd1cbc7a6c13
af4c5f38-7436-4e1e-9808-7580aacb067c	7b3a3d27-91e5-48c3-aa9c-73aea0658770
af4c5f38-7436-4e1e-9808-7580aacb067c	dfa204e0-ba0f-462b-90d8-c06e35422f97
15049335-3636-4b63-ad25-608926eae9e2	fec204d2-c9c9-4226-9841-f50e2ea2a740
9453986d-40e9-4397-a48b-159761ec9a36	c93ca2bc-7041-4ef4-afc2-bd1cbc7a6c13
dd37027f-80c2-4989-a009-9957e196dc04	dfa204e0-ba0f-462b-90d8-c06e35422f97
dd37027f-80c2-4989-a009-9957e196dc04	bcb7de80-39aa-4728-be52-e68cd9cff6f8
15049335-3636-4b63-ad25-608926eae9e2	2353b21c-e447-46c2-a187-603f40e5a001
2353b21c-e447-46c2-a187-603f40e5a001	86401a0d-fbce-4638-9eaa-f62495917cf7
db70f917-e026-455e-948b-154c76387ea7	625113c3-43cd-4440-93c1-bd49f496472a
af4c5f38-7436-4e1e-9808-7580aacb067c	191f1a4c-f2ac-4148-b749-31a6841ec835
15049335-3636-4b63-ad25-608926eae9e2	1bb248d1-b2ad-4098-8e4b-5c06b8494684
15049335-3636-4b63-ad25-608926eae9e2	494a1de9-383b-4609-92c3-9e0ca47b59a0
af4c5f38-7436-4e1e-9808-7580aacb067c	8728ca5b-7f2a-459c-91d5-353278b4ae24
af4c5f38-7436-4e1e-9808-7580aacb067c	d224dceb-ea87-4e1f-8743-bee78fb3d215
af4c5f38-7436-4e1e-9808-7580aacb067c	2071787c-b93b-49e9-9611-71c758a13703
af4c5f38-7436-4e1e-9808-7580aacb067c	26aeb649-f91a-4dda-8a38-8a25ddb12a72
af4c5f38-7436-4e1e-9808-7580aacb067c	7c0e4228-766b-491b-8d36-af3ab29a6a36
af4c5f38-7436-4e1e-9808-7580aacb067c	bd761ce3-4e52-46fb-8cc3-667dedff65f9
af4c5f38-7436-4e1e-9808-7580aacb067c	7686ea7b-297f-4236-89da-39f9c1c907dc
af4c5f38-7436-4e1e-9808-7580aacb067c	563e6487-a4cf-4e5e-97bf-0e4230d4bf41
af4c5f38-7436-4e1e-9808-7580aacb067c	625bc9c9-6bfb-4032-8d46-477bb93e3216
af4c5f38-7436-4e1e-9808-7580aacb067c	9da5f94b-95d3-45a2-91f8-5aff1281d388
af4c5f38-7436-4e1e-9808-7580aacb067c	5d922f81-3464-40c9-b6d0-5fbeadc3f08e
af4c5f38-7436-4e1e-9808-7580aacb067c	b3779787-c66c-490e-a821-821cfbbbcbed
af4c5f38-7436-4e1e-9808-7580aacb067c	210742cd-5e76-409c-b8e5-3d500b42c5ae
af4c5f38-7436-4e1e-9808-7580aacb067c	b050541a-c8b2-4918-b681-2f7d8202b6f7
af4c5f38-7436-4e1e-9808-7580aacb067c	d6ebc1f0-d5e7-455f-bfdf-ea4c5bf9679e
af4c5f38-7436-4e1e-9808-7580aacb067c	7c35a6c0-b5e9-46b2-a23d-6ed01575d499
af4c5f38-7436-4e1e-9808-7580aacb067c	4f74f6fb-cfba-4586-89b8-48c5bb38e78b
2071787c-b93b-49e9-9611-71c758a13703	4f74f6fb-cfba-4586-89b8-48c5bb38e78b
2071787c-b93b-49e9-9611-71c758a13703	b050541a-c8b2-4918-b681-2f7d8202b6f7
26aeb649-f91a-4dda-8a38-8a25ddb12a72	d6ebc1f0-d5e7-455f-bfdf-ea4c5bf9679e
af67d819-5a20-40cb-9525-5026d9f8e785	8d637ac5-9ebf-4106-9a24-d24acda251fa
af67d819-5a20-40cb-9525-5026d9f8e785	1e14f2a8-e824-4288-8414-de794385f104
af67d819-5a20-40cb-9525-5026d9f8e785	1e2447fa-b538-4327-b87e-d6edf22918cf
af67d819-5a20-40cb-9525-5026d9f8e785	7ff715de-2578-434b-b8c1-0943c429d4f0
af67d819-5a20-40cb-9525-5026d9f8e785	7d41aa36-5d56-417e-bf6b-7526f6f08f78
af67d819-5a20-40cb-9525-5026d9f8e785	ac09e2ac-11b1-47d4-ad67-fafaa6a30fe8
af67d819-5a20-40cb-9525-5026d9f8e785	4bb01414-df70-4e3c-988f-249fe0ba6512
af67d819-5a20-40cb-9525-5026d9f8e785	8782e814-17db-4544-99fe-3c95b2ca5ea6
af67d819-5a20-40cb-9525-5026d9f8e785	457951fd-9852-4403-8700-5b8c84dea63e
af67d819-5a20-40cb-9525-5026d9f8e785	7f877f8b-bef9-42d0-a34d-99e490343f01
af67d819-5a20-40cb-9525-5026d9f8e785	e7811fc2-add6-43fc-8883-0a2d9d960a3c
af67d819-5a20-40cb-9525-5026d9f8e785	e0fb236d-2805-4b15-b304-8e4c6f14141b
af67d819-5a20-40cb-9525-5026d9f8e785	10ffa4c5-9d51-40ef-a39d-eda926de0b08
af67d819-5a20-40cb-9525-5026d9f8e785	295aee9e-6db9-4251-a4a9-6f6074d1316c
af67d819-5a20-40cb-9525-5026d9f8e785	963dfc87-2640-443f-9371-86aeb115f706
af67d819-5a20-40cb-9525-5026d9f8e785	d82fe1d0-9327-4683-97e1-97b47889c398
af67d819-5a20-40cb-9525-5026d9f8e785	c9c4dee5-2182-4aa4-bff6-5ff75456b416
18bb1321-2776-4d1d-97b7-e5e25628d249	154efff4-ee6b-4b3a-803d-b57075ad1b6c
1e2447fa-b538-4327-b87e-d6edf22918cf	c9c4dee5-2182-4aa4-bff6-5ff75456b416
1e2447fa-b538-4327-b87e-d6edf22918cf	295aee9e-6db9-4251-a4a9-6f6074d1316c
7ff715de-2578-434b-b8c1-0943c429d4f0	963dfc87-2640-443f-9371-86aeb115f706
18bb1321-2776-4d1d-97b7-e5e25628d249	dcde1fd7-7141-43b0-ad0f-6f0e78852cfd
dcde1fd7-7141-43b0-ad0f-6f0e78852cfd	26bce685-5dc3-42ca-a0da-73a859583c63
54263c8b-1f23-4cd0-80bd-6e0536f28a21	864dedd7-a0fe-4d59-906e-4be246d7cff3
af4c5f38-7436-4e1e-9808-7580aacb067c	a6b0dbb9-43c8-41dc-b7f1-6159b5c6e393
af67d819-5a20-40cb-9525-5026d9f8e785	ea56e087-2665-446d-8e48-8c3b7a523f76
18bb1321-2776-4d1d-97b7-e5e25628d249	fdbb7834-630c-49ff-8cd7-ba11fbb55806
18bb1321-2776-4d1d-97b7-e5e25628d249	429e250f-3e3f-4bbe-8ca2-f35fbfce1ec8
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
bc63e65e-2a5b-4ca1-bc09-ac5c34c12d0c	\N	password	5035e40d-7ef5-4b1a-97e0-28bfa3396f44	1658395380806	\N	{"value":"OfRB/i9HUmqQA4Zi7f7USP+H6bF4pkpQ1r6zrsV/6wMkCdbBkVjoQPxtsQ3UXYDP9+9zwT72QFtfs2RIXI+6fA==","salt":"zUDhlc9Mef2gBf/WXHw3hQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
50f24c73-5435-4bf8-9f90-fca43b96fed0	\N	password	0cd1e99f-227a-4e01-a786-088b7c7f2232	1658396282020	\N	{"value":"DLo4L9ypEwKeP7RcKX/jdNEobUtxbTrEqYA4hLiUh8s8wxAeXMBmG6aaBtWk54IexhMBgK5xxnwQw3JmHh08dg==","salt":"j3j82TTdGXLdqXcdr3o6/A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-07-21 09:22:57.004225	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	8395376539
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-07-21 09:22:57.021213	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	8395376539
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-07-21 09:22:57.07528	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	8395376539
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-07-21 09:22:57.078569	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	8395376539
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-07-21 09:22:57.197952	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	8395376539
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-07-21 09:22:57.199815	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	8395376539
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-07-21 09:22:57.288787	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	8395376539
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-07-21 09:22:57.29477	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	8395376539
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-07-21 09:22:57.299636	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	8395376539
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-07-21 09:22:57.405364	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	8395376539
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-07-21 09:22:57.448759	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	8395376539
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-07-21 09:22:57.452368	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	8395376539
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-07-21 09:22:57.479173	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	8395376539
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-07-21 09:22:57.515496	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	8395376539
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-07-21 09:22:57.517132	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	8395376539
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-07-21 09:22:57.518888	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	8395376539
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-07-21 09:22:57.520738	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	8395376539
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-07-21 09:22:57.56705	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	8395376539
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-07-21 09:22:57.623234	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	8395376539
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-07-21 09:22:57.630207	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	8395376539
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-07-21 09:22:58.012145	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	8395376539
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-07-21 09:22:57.634525	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	8395376539
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-07-21 09:22:57.63717	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	8395376539
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-07-21 09:22:57.666749	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	8395376539
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-07-21 09:22:57.671315	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	8395376539
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-07-21 09:22:57.673006	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	8395376539
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-07-21 09:22:57.692667	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	8395376539
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-07-21 09:22:57.749863	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	8395376539
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-07-21 09:22:57.752397	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	8395376539
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-07-21 09:22:57.843753	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	8395376539
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-07-21 09:22:57.854798	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	8395376539
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-07-21 09:22:57.869318	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	8395376539
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-07-21 09:22:57.872681	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	8395376539
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-07-21 09:22:57.876394	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	8395376539
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-07-21 09:22:57.877408	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	8395376539
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-07-21 09:22:57.901346	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	8395376539
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-07-21 09:22:57.913063	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	8395376539
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-07-21 09:22:57.917472	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	8395376539
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-07-21 09:22:57.919397	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	8395376539
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-07-21 09:22:57.921682	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	8395376539
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-07-21 09:22:57.923061	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	8395376539
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-07-21 09:22:57.92423	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	8395376539
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-07-21 09:22:57.927026	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	8395376539
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-07-21 09:22:58.00807	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	8395376539
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-07-21 09:22:58.010066	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	8395376539
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-07-21 09:22:58.015337	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	8395376539
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-07-21 09:22:58.016389	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	8395376539
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-07-21 09:22:58.084848	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	8395376539
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-07-21 09:22:58.088976	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	8395376539
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-07-21 09:22:58.136865	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	8395376539
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-07-21 09:22:58.171219	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	8395376539
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-07-21 09:22:58.177988	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	8395376539
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-07-21 09:22:58.184851	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	8395376539
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-07-21 09:22:58.191101	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	8395376539
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-07-21 09:22:58.204036	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	8395376539
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-07-21 09:22:58.220021	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	8395376539
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-07-21 09:22:58.255833	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	8395376539
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-07-21 09:22:58.356365	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	8395376539
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-07-21 09:22:58.377234	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	8395376539
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-07-21 09:22:58.382333	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	8395376539
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-07-21 09:22:58.388471	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	8395376539
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-07-21 09:22:58.392002	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	8395376539
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-07-21 09:22:58.39387	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	8395376539
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-07-21 09:22:58.39569	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	8395376539
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-07-21 09:22:58.397912	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	8395376539
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-07-21 09:22:58.406225	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	8395376539
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-07-21 09:22:58.408989	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	8395376539
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-07-21 09:22:58.411385	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	8395376539
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-07-21 09:22:58.417194	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	8395376539
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-07-21 09:22:58.419568	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	8395376539
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-07-21 09:22:58.42363	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	8395376539
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-07-21 09:22:58.428209	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	8395376539
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-07-21 09:22:58.432215	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	8395376539
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-07-21 09:22:58.433009	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	8395376539
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-07-21 09:22:58.447567	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	8395376539
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-07-21 09:22:58.452189	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	8395376539
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-07-21 09:22:58.453777	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	8395376539
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-07-21 09:22:58.454533	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	8395376539
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-07-21 09:22:58.468977	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	8395376539
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-07-21 09:22:58.470147	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	8395376539
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-07-21 09:22:58.473984	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	8395376539
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-07-21 09:22:58.475366	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	8395376539
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-07-21 09:22:58.479951	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	8395376539
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-07-21 09:22:58.481312	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	8395376539
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-07-21 09:22:58.485112	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	8395376539
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-07-21 09:22:58.489629	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	8395376539
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-07-21 09:22:58.49897	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	8395376539
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-07-21 09:22:58.505404	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	8395376539
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.509998	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	8395376539
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.515683	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	8395376539
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.519164	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	8395376539
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.532357	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	8395376539
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.533499	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	8395376539
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.540596	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	8395376539
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.541683	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	8395376539
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-07-21 09:22:58.546225	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	8395376539
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.554514	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	8395376539
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.555728	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	8395376539
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.573594	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	8395376539
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.577425	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	8395376539
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.57861	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	8395376539
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.582834	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	8395376539
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-07-21 09:22:58.586178	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	8395376539
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-07-21 09:22:58.590593	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	8395376539
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2022-07-21 09:22:58.595001	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	8395376539
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	a59aefae-873f-4e9d-a683-4687f180a9ab	f
master	7a4a8d9d-c5b0-4798-9367-4264241344ff	t
master	f1c68c12-77f4-42e8-a49e-b76c1955263b	t
master	bca0d395-8a9c-40dd-aba2-6764366255eb	t
master	75cf9b33-9d70-47b1-8891-69054318a4bc	f
master	bf9593bb-8e81-429b-9d3d-c1cae0278644	f
master	bed5c8a1-6967-47e5-922e-a4bfdb922323	t
master	ffe0cad1-ad9d-48f8-b822-37ec3c16301d	t
master	c0ac8f4e-90bc-4070-8d4f-55ac8484c581	f
Superset	6bd0df37-c646-44df-b09f-388487bec7c4	f
Superset	16b08ee2-2a1f-4dc2-9f9e-48b4c4646af3	t
Superset	a5a1018f-62e2-43d3-bdb3-623757a4e845	t
Superset	e4af3ead-67e4-4dea-b97d-67889bff6f5c	t
Superset	8df7bc64-1802-4cbc-9c02-146070604915	f
Superset	b34568a9-d1d9-427d-babd-f9457eb7c470	f
Superset	4931ca8b-4d50-430d-91b8-ee951628c715	t
Superset	486daaf5-0630-459a-a837-1116a367c949	t
Superset	5c24268c-337d-40d2-883b-d9cfdd97769b	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
15049335-3636-4b63-ad25-608926eae9e2	master	f	${role_default-roles}	default-roles-master	master	\N	\N
9b2a8501-803e-4ad4-a4bd-6a622ee279f9	master	f	${role_create-realm}	create-realm	master	\N	\N
af4c5f38-7436-4e1e-9808-7580aacb067c	master	f	${role_admin}	admin	master	\N	\N
a6fa9692-29c6-42b0-b543-7939044f869a	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_create-client}	create-client	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
96b1ce26-c6ac-47de-8cb1-93f8fe2f698c	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_view-realm}	view-realm	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
dd37027f-80c2-4989-a009-9957e196dc04	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_view-users}	view-users	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
9453986d-40e9-4397-a48b-159761ec9a36	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_view-clients}	view-clients	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
4767a9b2-1563-4ba0-9d6e-006ebffcf015	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_view-events}	view-events	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
a6ea213a-ff07-4506-a4ae-e890cc824bc3	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_view-identity-providers}	view-identity-providers	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
227e89c9-6371-4483-9738-c19106067bca	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_view-authorization}	view-authorization	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
7058c2c6-3e93-42dc-82d2-d8b15db964c2	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_manage-realm}	manage-realm	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
bd1ef64d-d2ff-459c-97bf-28671f36b784	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_manage-users}	manage-users	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
87d791f1-4216-4583-b6c2-b440e6aeb8cd	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_manage-clients}	manage-clients	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
c09f614b-4d9c-45e8-a90c-5415d5701ef0	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_manage-events}	manage-events	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
c6397646-2212-4412-820c-84c2a6bbfd23	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_manage-identity-providers}	manage-identity-providers	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
8ff63cd9-3097-4f05-8041-342e9db00bed	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_manage-authorization}	manage-authorization	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
bcb7de80-39aa-4728-be52-e68cd9cff6f8	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_query-users}	query-users	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
c93ca2bc-7041-4ef4-afc2-bd1cbc7a6c13	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_query-clients}	query-clients	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
7b3a3d27-91e5-48c3-aa9c-73aea0658770	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_query-realms}	query-realms	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
dfa204e0-ba0f-462b-90d8-c06e35422f97	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_query-groups}	query-groups	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
fec204d2-c9c9-4226-9841-f50e2ea2a740	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_view-profile}	view-profile	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
2353b21c-e447-46c2-a187-603f40e5a001	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_manage-account}	manage-account	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
86401a0d-fbce-4638-9eaa-f62495917cf7	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_manage-account-links}	manage-account-links	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
cf094f62-efea-4353-b616-f69877d7aadd	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_view-applications}	view-applications	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
625113c3-43cd-4440-93c1-bd49f496472a	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_view-consent}	view-consent	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
db70f917-e026-455e-948b-154c76387ea7	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_manage-consent}	manage-consent	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
6c9ad01d-b16d-4cdc-ae72-fa6ab4471c69	5bc94255-f104-43f9-a354-a23a6d6ae8b3	t	${role_delete-account}	delete-account	master	5bc94255-f104-43f9-a354-a23a6d6ae8b3	\N
04efcd67-01a2-483a-bda1-31832383d285	65925614-813c-4ad7-8268-e1bc688073fa	t	${role_read-token}	read-token	master	65925614-813c-4ad7-8268-e1bc688073fa	\N
191f1a4c-f2ac-4148-b749-31a6841ec835	43f06207-b1c2-41c4-a2b3-b0e797db25dd	t	${role_impersonation}	impersonation	master	43f06207-b1c2-41c4-a2b3-b0e797db25dd	\N
1bb248d1-b2ad-4098-8e4b-5c06b8494684	master	f	${role_offline-access}	offline_access	master	\N	\N
494a1de9-383b-4609-92c3-9e0ca47b59a0	master	f	${role_uma_authorization}	uma_authorization	master	\N	\N
18bb1321-2776-4d1d-97b7-e5e25628d249	Superset	f	${role_default-roles}	default-roles-superset	Superset	\N	\N
8728ca5b-7f2a-459c-91d5-353278b4ae24	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_create-client}	create-client	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
d224dceb-ea87-4e1f-8743-bee78fb3d215	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_view-realm}	view-realm	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
2071787c-b93b-49e9-9611-71c758a13703	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_view-users}	view-users	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
26aeb649-f91a-4dda-8a38-8a25ddb12a72	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_view-clients}	view-clients	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
7c0e4228-766b-491b-8d36-af3ab29a6a36	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_view-events}	view-events	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
bd761ce3-4e52-46fb-8cc3-667dedff65f9	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_view-identity-providers}	view-identity-providers	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
7686ea7b-297f-4236-89da-39f9c1c907dc	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_view-authorization}	view-authorization	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
563e6487-a4cf-4e5e-97bf-0e4230d4bf41	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_manage-realm}	manage-realm	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
625bc9c9-6bfb-4032-8d46-477bb93e3216	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_manage-users}	manage-users	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
9da5f94b-95d3-45a2-91f8-5aff1281d388	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_manage-clients}	manage-clients	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
5d922f81-3464-40c9-b6d0-5fbeadc3f08e	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_manage-events}	manage-events	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
b3779787-c66c-490e-a821-821cfbbbcbed	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_manage-identity-providers}	manage-identity-providers	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
210742cd-5e76-409c-b8e5-3d500b42c5ae	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_manage-authorization}	manage-authorization	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
b050541a-c8b2-4918-b681-2f7d8202b6f7	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_query-users}	query-users	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
d6ebc1f0-d5e7-455f-bfdf-ea4c5bf9679e	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_query-clients}	query-clients	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
7c35a6c0-b5e9-46b2-a23d-6ed01575d499	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_query-realms}	query-realms	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
4f74f6fb-cfba-4586-89b8-48c5bb38e78b	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_query-groups}	query-groups	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
af67d819-5a20-40cb-9525-5026d9f8e785	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_realm-admin}	realm-admin	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
8d637ac5-9ebf-4106-9a24-d24acda251fa	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_create-client}	create-client	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
1e14f2a8-e824-4288-8414-de794385f104	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_view-realm}	view-realm	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
1e2447fa-b538-4327-b87e-d6edf22918cf	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_view-users}	view-users	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
7ff715de-2578-434b-b8c1-0943c429d4f0	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_view-clients}	view-clients	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
7d41aa36-5d56-417e-bf6b-7526f6f08f78	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_view-events}	view-events	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
ac09e2ac-11b1-47d4-ad67-fafaa6a30fe8	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_view-identity-providers}	view-identity-providers	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
4bb01414-df70-4e3c-988f-249fe0ba6512	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_view-authorization}	view-authorization	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
8782e814-17db-4544-99fe-3c95b2ca5ea6	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_manage-realm}	manage-realm	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
457951fd-9852-4403-8700-5b8c84dea63e	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_manage-users}	manage-users	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
7f877f8b-bef9-42d0-a34d-99e490343f01	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_manage-clients}	manage-clients	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
e7811fc2-add6-43fc-8883-0a2d9d960a3c	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_manage-events}	manage-events	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
e0fb236d-2805-4b15-b304-8e4c6f14141b	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_manage-identity-providers}	manage-identity-providers	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
10ffa4c5-9d51-40ef-a39d-eda926de0b08	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_manage-authorization}	manage-authorization	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
295aee9e-6db9-4251-a4a9-6f6074d1316c	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_query-users}	query-users	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
963dfc87-2640-443f-9371-86aeb115f706	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_query-clients}	query-clients	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
d82fe1d0-9327-4683-97e1-97b47889c398	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_query-realms}	query-realms	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
c9c4dee5-2182-4aa4-bff6-5ff75456b416	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_query-groups}	query-groups	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
154efff4-ee6b-4b3a-803d-b57075ad1b6c	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_view-profile}	view-profile	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
dcde1fd7-7141-43b0-ad0f-6f0e78852cfd	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_manage-account}	manage-account	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
26bce685-5dc3-42ca-a0da-73a859583c63	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_manage-account-links}	manage-account-links	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
9ce72c81-709f-45c3-9e5c-0e715361d180	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_view-applications}	view-applications	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
864dedd7-a0fe-4d59-906e-4be246d7cff3	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_view-consent}	view-consent	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
54263c8b-1f23-4cd0-80bd-6e0536f28a21	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_manage-consent}	manage-consent	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
df165fe4-b29c-44b1-a8fa-6c99f7aad8e0	9f041e11-d6fb-4c86-8a61-22370f383d8c	t	${role_delete-account}	delete-account	Superset	9f041e11-d6fb-4c86-8a61-22370f383d8c	\N
a6b0dbb9-43c8-41dc-b7f1-6159b5c6e393	d2454b11-ede4-4a15-840a-ac868983bcca	t	${role_impersonation}	impersonation	master	d2454b11-ede4-4a15-840a-ac868983bcca	\N
ea56e087-2665-446d-8e48-8c3b7a523f76	23b63da8-ecde-4344-9d67-1a93fa78dfd3	t	${role_impersonation}	impersonation	Superset	23b63da8-ecde-4344-9d67-1a93fa78dfd3	\N
99a3f79f-24d7-4fdd-9807-6d9d043105e2	993aa4df-b36e-44c3-9280-a7adb429c6b1	t	${role_read-token}	read-token	Superset	993aa4df-b36e-44c3-9280-a7adb429c6b1	\N
fdbb7834-630c-49ff-8cd7-ba11fbb55806	Superset	f	${role_offline-access}	offline_access	Superset	\N	\N
429e250f-3e3f-4bbe-8ca2-f35fbfce1ec8	Superset	f	${role_uma_authorization}	uma_authorization	Superset	\N	\N
504fe6c2-0752-4120-89fa-5f19262213c2	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	t	\N	uma_protection	Superset	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
2bimo	17.0.1	1658395378
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
8131cb22-1055-4732-a4d7-660e77ada763	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
8dfc60b3-8991-4d85-8ad8-e47b39907868	defaultResourceType	urn:client-superset:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
7dd29afe-d7b6-489f-bb9b-c6b160300ab6	audience resolve	openid-connect	oidc-audience-resolve-mapper	8f1a0370-b347-46d3-adbd-bda5b32fbdb8	\N
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	locale	openid-connect	oidc-usermodel-attribute-mapper	c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	\N
5aa02a50-d8d6-4fde-a635-d3b49b59bc7f	role list	saml	saml-role-list-mapper	\N	7a4a8d9d-c5b0-4798-9367-4264241344ff
e9f78376-188e-4c8e-845f-889c701eb1a0	full name	openid-connect	oidc-full-name-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
60a1afa0-bddc-450a-a769-1309b02dcfcd	family name	openid-connect	oidc-usermodel-property-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
6f7ac690-969a-4599-a4c9-ac632a4882f6	given name	openid-connect	oidc-usermodel-property-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
618466a6-ed31-434b-bed3-f45c0a294a6d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	username	openid-connect	oidc-usermodel-property-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
b6091983-cfc8-4d90-a78d-cb3e9b89c496	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
852c848d-6b2c-409c-abe7-6c021aa1390c	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
2178d74f-953e-43c3-bc86-fb25cf22f1e8	website	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
91219a96-f448-4675-a2bf-405cd41f3af4	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
812bf9f8-2a09-435a-8844-a4fa99e67fb9	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	f1c68c12-77f4-42e8-a49e-b76c1955263b
fb2b8b19-bbee-4fb5-8b8d-50957948639f	email	openid-connect	oidc-usermodel-property-mapper	\N	bca0d395-8a9c-40dd-aba2-6764366255eb
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	email verified	openid-connect	oidc-usermodel-property-mapper	\N	bca0d395-8a9c-40dd-aba2-6764366255eb
839173a0-1840-4fcd-926a-7ec3a9ef28b4	address	openid-connect	oidc-address-mapper	\N	75cf9b33-9d70-47b1-8891-69054318a4bc
53530ad9-763b-4290-9801-9185dc508570	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	bf9593bb-8e81-429b-9d3d-c1cae0278644
27dcf860-2395-41f4-afa8-0cff14dd9220	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	bf9593bb-8e81-429b-9d3d-c1cae0278644
9c499b32-0d0a-4875-ac5c-8246b51ede9d	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	bed5c8a1-6967-47e5-922e-a4bfdb922323
052e07c4-07b1-442f-8f7c-dfa978d515e0	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	bed5c8a1-6967-47e5-922e-a4bfdb922323
b97e6b76-de41-43ed-b6c2-91b4daad46a9	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	bed5c8a1-6967-47e5-922e-a4bfdb922323
b759e408-be53-44d1-a5bf-ee6bb656da99	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ffe0cad1-ad9d-48f8-b822-37ec3c16301d
b01097b3-b873-4ce6-987d-19e547829abf	upn	openid-connect	oidc-usermodel-property-mapper	\N	c0ac8f4e-90bc-4070-8d4f-55ac8484c581
5016184e-2bee-4459-a76c-33b9645541b1	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	c0ac8f4e-90bc-4070-8d4f-55ac8484c581
55d58aeb-2dfe-4284-a4cf-0c61749468b5	audience resolve	openid-connect	oidc-audience-resolve-mapper	e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	\N
2a1cd49a-fe64-4d72-8519-33e81675b82f	role list	saml	saml-role-list-mapper	\N	16b08ee2-2a1f-4dc2-9f9e-48b4c4646af3
4f75dd40-e316-4d2f-bdeb-085e784aada8	full name	openid-connect	oidc-full-name-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
3ea49c31-a20e-4bec-9f25-43a0c86782e3	family name	openid-connect	oidc-usermodel-property-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
67ae74e9-7f07-4e0e-a263-ccb960200b8d	given name	openid-connect	oidc-usermodel-property-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
f7df5564-210d-4089-8288-95bf13271437	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	username	openid-connect	oidc-usermodel-property-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
b02fe39e-c896-40e2-a90b-816f64cba571	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
cf3cccd5-4e2d-4727-8498-5e416901ede8	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
f0942fa6-92e5-420d-b24b-0fc6ecb53022	website	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
c746b8ec-096a-4d05-9f3a-283da12171fa	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
2483475d-ae74-48d7-b9a6-698724724005	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	a5a1018f-62e2-43d3-bdb3-623757a4e845
27415ad7-e325-4035-ab98-ec1e3e527a2c	email	openid-connect	oidc-usermodel-property-mapper	\N	e4af3ead-67e4-4dea-b97d-67889bff6f5c
0f76fb7a-a141-49e3-877a-6cb9275d22f2	email verified	openid-connect	oidc-usermodel-property-mapper	\N	e4af3ead-67e4-4dea-b97d-67889bff6f5c
d34e7069-def9-4c84-9f2e-07869e2a592e	address	openid-connect	oidc-address-mapper	\N	8df7bc64-1802-4cbc-9c02-146070604915
2e5368da-6d1d-4a4d-8634-e7b743b3a600	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	b34568a9-d1d9-427d-babd-f9457eb7c470
02c0971b-1798-4b62-9078-63a041391f4b	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	b34568a9-d1d9-427d-babd-f9457eb7c470
15455699-a7da-4b4b-a2d8-2288b99d3d48	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	4931ca8b-4d50-430d-91b8-ee951628c715
e39c382c-7629-43a1-aa29-63926dd7d3b8	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	4931ca8b-4d50-430d-91b8-ee951628c715
31261b56-095a-4cca-ada0-2bf69ca688d4	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	4931ca8b-4d50-430d-91b8-ee951628c715
05bd98e4-2660-41f4-a47d-b6ade76831d5	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	486daaf5-0630-459a-a837-1116a367c949
59aee225-262b-4fba-a5ac-add72db0b4f3	upn	openid-connect	oidc-usermodel-property-mapper	\N	5c24268c-337d-40d2-883b-d9cfdd97769b
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	5c24268c-337d-40d2-883b-d9cfdd97769b
9e4110e7-1915-4d55-b975-90ee36c892d7	locale	openid-connect	oidc-usermodel-attribute-mapper	0f67de81-9843-4253-8c3a-0352cef40636	\N
b6ada83a-9a11-4e86-8ac9-cc96e335edff	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	\N
9e2239dc-7de8-43cb-b2db-0ea825769906	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	\N
4533d8af-9736-4e0a-93ec-823d60652c9a	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	true	userinfo.token.claim
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	locale	user.attribute
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	true	id.token.claim
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	true	access.token.claim
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	locale	claim.name
fddb81d7-2cbd-49c6-80b9-88dea3ae262b	String	jsonType.label
5aa02a50-d8d6-4fde-a635-d3b49b59bc7f	false	single
5aa02a50-d8d6-4fde-a635-d3b49b59bc7f	Basic	attribute.nameformat
5aa02a50-d8d6-4fde-a635-d3b49b59bc7f	Role	attribute.name
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	true	userinfo.token.claim
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	updatedAt	user.attribute
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	true	id.token.claim
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	true	access.token.claim
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	updated_at	claim.name
0620a57d-3cab-43c3-bfbe-c1f0a2d72f7a	String	jsonType.label
2178d74f-953e-43c3-bc86-fb25cf22f1e8	true	userinfo.token.claim
2178d74f-953e-43c3-bc86-fb25cf22f1e8	website	user.attribute
2178d74f-953e-43c3-bc86-fb25cf22f1e8	true	id.token.claim
2178d74f-953e-43c3-bc86-fb25cf22f1e8	true	access.token.claim
2178d74f-953e-43c3-bc86-fb25cf22f1e8	website	claim.name
2178d74f-953e-43c3-bc86-fb25cf22f1e8	String	jsonType.label
60a1afa0-bddc-450a-a769-1309b02dcfcd	true	userinfo.token.claim
60a1afa0-bddc-450a-a769-1309b02dcfcd	lastName	user.attribute
60a1afa0-bddc-450a-a769-1309b02dcfcd	true	id.token.claim
60a1afa0-bddc-450a-a769-1309b02dcfcd	true	access.token.claim
60a1afa0-bddc-450a-a769-1309b02dcfcd	family_name	claim.name
60a1afa0-bddc-450a-a769-1309b02dcfcd	String	jsonType.label
618466a6-ed31-434b-bed3-f45c0a294a6d	true	userinfo.token.claim
618466a6-ed31-434b-bed3-f45c0a294a6d	middleName	user.attribute
618466a6-ed31-434b-bed3-f45c0a294a6d	true	id.token.claim
618466a6-ed31-434b-bed3-f45c0a294a6d	true	access.token.claim
618466a6-ed31-434b-bed3-f45c0a294a6d	middle_name	claim.name
618466a6-ed31-434b-bed3-f45c0a294a6d	String	jsonType.label
6f7ac690-969a-4599-a4c9-ac632a4882f6	true	userinfo.token.claim
6f7ac690-969a-4599-a4c9-ac632a4882f6	firstName	user.attribute
6f7ac690-969a-4599-a4c9-ac632a4882f6	true	id.token.claim
6f7ac690-969a-4599-a4c9-ac632a4882f6	true	access.token.claim
6f7ac690-969a-4599-a4c9-ac632a4882f6	given_name	claim.name
6f7ac690-969a-4599-a4c9-ac632a4882f6	String	jsonType.label
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	true	userinfo.token.claim
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	username	user.attribute
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	true	id.token.claim
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	true	access.token.claim
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	preferred_username	claim.name
7833d1ec-2833-4802-95fa-0f97f3cd1dfb	String	jsonType.label
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	true	userinfo.token.claim
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	nickname	user.attribute
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	true	id.token.claim
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	true	access.token.claim
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	nickname	claim.name
7e63fd47-4436-4e9b-92b1-4e789dfc2beb	String	jsonType.label
812bf9f8-2a09-435a-8844-a4fa99e67fb9	true	userinfo.token.claim
812bf9f8-2a09-435a-8844-a4fa99e67fb9	zoneinfo	user.attribute
812bf9f8-2a09-435a-8844-a4fa99e67fb9	true	id.token.claim
812bf9f8-2a09-435a-8844-a4fa99e67fb9	true	access.token.claim
812bf9f8-2a09-435a-8844-a4fa99e67fb9	zoneinfo	claim.name
812bf9f8-2a09-435a-8844-a4fa99e67fb9	String	jsonType.label
852c848d-6b2c-409c-abe7-6c021aa1390c	true	userinfo.token.claim
852c848d-6b2c-409c-abe7-6c021aa1390c	picture	user.attribute
852c848d-6b2c-409c-abe7-6c021aa1390c	true	id.token.claim
852c848d-6b2c-409c-abe7-6c021aa1390c	true	access.token.claim
852c848d-6b2c-409c-abe7-6c021aa1390c	picture	claim.name
852c848d-6b2c-409c-abe7-6c021aa1390c	String	jsonType.label
91219a96-f448-4675-a2bf-405cd41f3af4	true	userinfo.token.claim
91219a96-f448-4675-a2bf-405cd41f3af4	gender	user.attribute
91219a96-f448-4675-a2bf-405cd41f3af4	true	id.token.claim
91219a96-f448-4675-a2bf-405cd41f3af4	true	access.token.claim
91219a96-f448-4675-a2bf-405cd41f3af4	gender	claim.name
91219a96-f448-4675-a2bf-405cd41f3af4	String	jsonType.label
b6091983-cfc8-4d90-a78d-cb3e9b89c496	true	userinfo.token.claim
b6091983-cfc8-4d90-a78d-cb3e9b89c496	profile	user.attribute
b6091983-cfc8-4d90-a78d-cb3e9b89c496	true	id.token.claim
b6091983-cfc8-4d90-a78d-cb3e9b89c496	true	access.token.claim
b6091983-cfc8-4d90-a78d-cb3e9b89c496	profile	claim.name
b6091983-cfc8-4d90-a78d-cb3e9b89c496	String	jsonType.label
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	true	userinfo.token.claim
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	locale	user.attribute
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	true	id.token.claim
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	true	access.token.claim
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	locale	claim.name
d68a56bf-af0a-4e54-bff9-385f8bd0bb56	String	jsonType.label
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	true	userinfo.token.claim
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	birthdate	user.attribute
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	true	id.token.claim
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	true	access.token.claim
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	birthdate	claim.name
e0ab9753-b7dc-41b9-9c7c-29b33d87c8b8	String	jsonType.label
e9f78376-188e-4c8e-845f-889c701eb1a0	true	userinfo.token.claim
e9f78376-188e-4c8e-845f-889c701eb1a0	true	id.token.claim
e9f78376-188e-4c8e-845f-889c701eb1a0	true	access.token.claim
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	true	userinfo.token.claim
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	emailVerified	user.attribute
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	true	id.token.claim
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	true	access.token.claim
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	email_verified	claim.name
b1d755b0-2e9c-4c4f-af55-a38789c3e3cb	boolean	jsonType.label
fb2b8b19-bbee-4fb5-8b8d-50957948639f	true	userinfo.token.claim
fb2b8b19-bbee-4fb5-8b8d-50957948639f	email	user.attribute
fb2b8b19-bbee-4fb5-8b8d-50957948639f	true	id.token.claim
fb2b8b19-bbee-4fb5-8b8d-50957948639f	true	access.token.claim
fb2b8b19-bbee-4fb5-8b8d-50957948639f	email	claim.name
fb2b8b19-bbee-4fb5-8b8d-50957948639f	String	jsonType.label
839173a0-1840-4fcd-926a-7ec3a9ef28b4	formatted	user.attribute.formatted
839173a0-1840-4fcd-926a-7ec3a9ef28b4	country	user.attribute.country
839173a0-1840-4fcd-926a-7ec3a9ef28b4	postal_code	user.attribute.postal_code
839173a0-1840-4fcd-926a-7ec3a9ef28b4	true	userinfo.token.claim
839173a0-1840-4fcd-926a-7ec3a9ef28b4	street	user.attribute.street
839173a0-1840-4fcd-926a-7ec3a9ef28b4	true	id.token.claim
839173a0-1840-4fcd-926a-7ec3a9ef28b4	region	user.attribute.region
839173a0-1840-4fcd-926a-7ec3a9ef28b4	true	access.token.claim
839173a0-1840-4fcd-926a-7ec3a9ef28b4	locality	user.attribute.locality
27dcf860-2395-41f4-afa8-0cff14dd9220	true	userinfo.token.claim
27dcf860-2395-41f4-afa8-0cff14dd9220	phoneNumberVerified	user.attribute
27dcf860-2395-41f4-afa8-0cff14dd9220	true	id.token.claim
27dcf860-2395-41f4-afa8-0cff14dd9220	true	access.token.claim
27dcf860-2395-41f4-afa8-0cff14dd9220	phone_number_verified	claim.name
27dcf860-2395-41f4-afa8-0cff14dd9220	boolean	jsonType.label
53530ad9-763b-4290-9801-9185dc508570	true	userinfo.token.claim
53530ad9-763b-4290-9801-9185dc508570	phoneNumber	user.attribute
53530ad9-763b-4290-9801-9185dc508570	true	id.token.claim
53530ad9-763b-4290-9801-9185dc508570	true	access.token.claim
53530ad9-763b-4290-9801-9185dc508570	phone_number	claim.name
53530ad9-763b-4290-9801-9185dc508570	String	jsonType.label
052e07c4-07b1-442f-8f7c-dfa978d515e0	true	multivalued
052e07c4-07b1-442f-8f7c-dfa978d515e0	foo	user.attribute
052e07c4-07b1-442f-8f7c-dfa978d515e0	true	access.token.claim
052e07c4-07b1-442f-8f7c-dfa978d515e0	resource_access.${client_id}.roles	claim.name
052e07c4-07b1-442f-8f7c-dfa978d515e0	String	jsonType.label
9c499b32-0d0a-4875-ac5c-8246b51ede9d	true	multivalued
9c499b32-0d0a-4875-ac5c-8246b51ede9d	foo	user.attribute
9c499b32-0d0a-4875-ac5c-8246b51ede9d	true	access.token.claim
9c499b32-0d0a-4875-ac5c-8246b51ede9d	realm_access.roles	claim.name
9c499b32-0d0a-4875-ac5c-8246b51ede9d	String	jsonType.label
5016184e-2bee-4459-a76c-33b9645541b1	true	multivalued
5016184e-2bee-4459-a76c-33b9645541b1	foo	user.attribute
5016184e-2bee-4459-a76c-33b9645541b1	true	id.token.claim
5016184e-2bee-4459-a76c-33b9645541b1	true	access.token.claim
5016184e-2bee-4459-a76c-33b9645541b1	groups	claim.name
5016184e-2bee-4459-a76c-33b9645541b1	String	jsonType.label
b01097b3-b873-4ce6-987d-19e547829abf	true	userinfo.token.claim
b01097b3-b873-4ce6-987d-19e547829abf	username	user.attribute
b01097b3-b873-4ce6-987d-19e547829abf	true	id.token.claim
b01097b3-b873-4ce6-987d-19e547829abf	true	access.token.claim
b01097b3-b873-4ce6-987d-19e547829abf	upn	claim.name
b01097b3-b873-4ce6-987d-19e547829abf	String	jsonType.label
2a1cd49a-fe64-4d72-8519-33e81675b82f	false	single
2a1cd49a-fe64-4d72-8519-33e81675b82f	Basic	attribute.nameformat
2a1cd49a-fe64-4d72-8519-33e81675b82f	Role	attribute.name
2483475d-ae74-48d7-b9a6-698724724005	true	userinfo.token.claim
2483475d-ae74-48d7-b9a6-698724724005	locale	user.attribute
2483475d-ae74-48d7-b9a6-698724724005	true	id.token.claim
2483475d-ae74-48d7-b9a6-698724724005	true	access.token.claim
2483475d-ae74-48d7-b9a6-698724724005	locale	claim.name
2483475d-ae74-48d7-b9a6-698724724005	String	jsonType.label
3ea49c31-a20e-4bec-9f25-43a0c86782e3	true	userinfo.token.claim
3ea49c31-a20e-4bec-9f25-43a0c86782e3	lastName	user.attribute
3ea49c31-a20e-4bec-9f25-43a0c86782e3	true	id.token.claim
3ea49c31-a20e-4bec-9f25-43a0c86782e3	true	access.token.claim
3ea49c31-a20e-4bec-9f25-43a0c86782e3	family_name	claim.name
3ea49c31-a20e-4bec-9f25-43a0c86782e3	String	jsonType.label
4f75dd40-e316-4d2f-bdeb-085e784aada8	true	userinfo.token.claim
4f75dd40-e316-4d2f-bdeb-085e784aada8	true	id.token.claim
4f75dd40-e316-4d2f-bdeb-085e784aada8	true	access.token.claim
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	true	userinfo.token.claim
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	middleName	user.attribute
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	true	id.token.claim
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	true	access.token.claim
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	middle_name	claim.name
5e0c8ae1-c0b2-463d-a6a5-acea60b1cafe	String	jsonType.label
67ae74e9-7f07-4e0e-a263-ccb960200b8d	true	userinfo.token.claim
67ae74e9-7f07-4e0e-a263-ccb960200b8d	firstName	user.attribute
67ae74e9-7f07-4e0e-a263-ccb960200b8d	true	id.token.claim
67ae74e9-7f07-4e0e-a263-ccb960200b8d	true	access.token.claim
67ae74e9-7f07-4e0e-a263-ccb960200b8d	given_name	claim.name
67ae74e9-7f07-4e0e-a263-ccb960200b8d	String	jsonType.label
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	true	userinfo.token.claim
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	username	user.attribute
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	true	id.token.claim
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	true	access.token.claim
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	preferred_username	claim.name
ac7757f2-1f4a-46e9-8ab0-a3fe5b69511f	String	jsonType.label
b02fe39e-c896-40e2-a90b-816f64cba571	true	userinfo.token.claim
b02fe39e-c896-40e2-a90b-816f64cba571	profile	user.attribute
b02fe39e-c896-40e2-a90b-816f64cba571	true	id.token.claim
b02fe39e-c896-40e2-a90b-816f64cba571	true	access.token.claim
b02fe39e-c896-40e2-a90b-816f64cba571	profile	claim.name
b02fe39e-c896-40e2-a90b-816f64cba571	String	jsonType.label
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	true	userinfo.token.claim
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	zoneinfo	user.attribute
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	true	id.token.claim
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	true	access.token.claim
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	zoneinfo	claim.name
b3b18489-d3ea-46b4-a8b5-fad02a8e13a1	String	jsonType.label
c746b8ec-096a-4d05-9f3a-283da12171fa	true	userinfo.token.claim
c746b8ec-096a-4d05-9f3a-283da12171fa	birthdate	user.attribute
c746b8ec-096a-4d05-9f3a-283da12171fa	true	id.token.claim
c746b8ec-096a-4d05-9f3a-283da12171fa	true	access.token.claim
c746b8ec-096a-4d05-9f3a-283da12171fa	birthdate	claim.name
c746b8ec-096a-4d05-9f3a-283da12171fa	String	jsonType.label
cf3cccd5-4e2d-4727-8498-5e416901ede8	true	userinfo.token.claim
cf3cccd5-4e2d-4727-8498-5e416901ede8	picture	user.attribute
cf3cccd5-4e2d-4727-8498-5e416901ede8	true	id.token.claim
cf3cccd5-4e2d-4727-8498-5e416901ede8	true	access.token.claim
cf3cccd5-4e2d-4727-8498-5e416901ede8	picture	claim.name
cf3cccd5-4e2d-4727-8498-5e416901ede8	String	jsonType.label
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	true	userinfo.token.claim
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	gender	user.attribute
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	true	id.token.claim
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	true	access.token.claim
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	gender	claim.name
ef49bc5a-5af9-4e38-9f6d-85eafc5217cc	String	jsonType.label
f0942fa6-92e5-420d-b24b-0fc6ecb53022	true	userinfo.token.claim
f0942fa6-92e5-420d-b24b-0fc6ecb53022	website	user.attribute
f0942fa6-92e5-420d-b24b-0fc6ecb53022	true	id.token.claim
f0942fa6-92e5-420d-b24b-0fc6ecb53022	true	access.token.claim
f0942fa6-92e5-420d-b24b-0fc6ecb53022	website	claim.name
f0942fa6-92e5-420d-b24b-0fc6ecb53022	String	jsonType.label
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	true	userinfo.token.claim
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	updatedAt	user.attribute
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	true	id.token.claim
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	true	access.token.claim
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	updated_at	claim.name
f0d6e048-f5c6-4e8c-8d32-13bfe2c7a9bd	String	jsonType.label
f7df5564-210d-4089-8288-95bf13271437	true	userinfo.token.claim
f7df5564-210d-4089-8288-95bf13271437	nickname	user.attribute
f7df5564-210d-4089-8288-95bf13271437	true	id.token.claim
f7df5564-210d-4089-8288-95bf13271437	true	access.token.claim
f7df5564-210d-4089-8288-95bf13271437	nickname	claim.name
f7df5564-210d-4089-8288-95bf13271437	String	jsonType.label
0f76fb7a-a141-49e3-877a-6cb9275d22f2	true	userinfo.token.claim
0f76fb7a-a141-49e3-877a-6cb9275d22f2	emailVerified	user.attribute
0f76fb7a-a141-49e3-877a-6cb9275d22f2	true	id.token.claim
0f76fb7a-a141-49e3-877a-6cb9275d22f2	true	access.token.claim
0f76fb7a-a141-49e3-877a-6cb9275d22f2	email_verified	claim.name
0f76fb7a-a141-49e3-877a-6cb9275d22f2	boolean	jsonType.label
27415ad7-e325-4035-ab98-ec1e3e527a2c	true	userinfo.token.claim
27415ad7-e325-4035-ab98-ec1e3e527a2c	email	user.attribute
27415ad7-e325-4035-ab98-ec1e3e527a2c	true	id.token.claim
27415ad7-e325-4035-ab98-ec1e3e527a2c	true	access.token.claim
27415ad7-e325-4035-ab98-ec1e3e527a2c	email	claim.name
27415ad7-e325-4035-ab98-ec1e3e527a2c	String	jsonType.label
d34e7069-def9-4c84-9f2e-07869e2a592e	formatted	user.attribute.formatted
d34e7069-def9-4c84-9f2e-07869e2a592e	country	user.attribute.country
d34e7069-def9-4c84-9f2e-07869e2a592e	postal_code	user.attribute.postal_code
d34e7069-def9-4c84-9f2e-07869e2a592e	true	userinfo.token.claim
d34e7069-def9-4c84-9f2e-07869e2a592e	street	user.attribute.street
d34e7069-def9-4c84-9f2e-07869e2a592e	true	id.token.claim
d34e7069-def9-4c84-9f2e-07869e2a592e	region	user.attribute.region
d34e7069-def9-4c84-9f2e-07869e2a592e	true	access.token.claim
d34e7069-def9-4c84-9f2e-07869e2a592e	locality	user.attribute.locality
02c0971b-1798-4b62-9078-63a041391f4b	true	userinfo.token.claim
02c0971b-1798-4b62-9078-63a041391f4b	phoneNumberVerified	user.attribute
02c0971b-1798-4b62-9078-63a041391f4b	true	id.token.claim
02c0971b-1798-4b62-9078-63a041391f4b	true	access.token.claim
02c0971b-1798-4b62-9078-63a041391f4b	phone_number_verified	claim.name
02c0971b-1798-4b62-9078-63a041391f4b	boolean	jsonType.label
2e5368da-6d1d-4a4d-8634-e7b743b3a600	true	userinfo.token.claim
2e5368da-6d1d-4a4d-8634-e7b743b3a600	phoneNumber	user.attribute
2e5368da-6d1d-4a4d-8634-e7b743b3a600	true	id.token.claim
2e5368da-6d1d-4a4d-8634-e7b743b3a600	true	access.token.claim
2e5368da-6d1d-4a4d-8634-e7b743b3a600	phone_number	claim.name
2e5368da-6d1d-4a4d-8634-e7b743b3a600	String	jsonType.label
15455699-a7da-4b4b-a2d8-2288b99d3d48	true	multivalued
15455699-a7da-4b4b-a2d8-2288b99d3d48	foo	user.attribute
15455699-a7da-4b4b-a2d8-2288b99d3d48	true	access.token.claim
15455699-a7da-4b4b-a2d8-2288b99d3d48	realm_access.roles	claim.name
15455699-a7da-4b4b-a2d8-2288b99d3d48	String	jsonType.label
e39c382c-7629-43a1-aa29-63926dd7d3b8	true	multivalued
e39c382c-7629-43a1-aa29-63926dd7d3b8	foo	user.attribute
e39c382c-7629-43a1-aa29-63926dd7d3b8	true	access.token.claim
e39c382c-7629-43a1-aa29-63926dd7d3b8	resource_access.${client_id}.roles	claim.name
e39c382c-7629-43a1-aa29-63926dd7d3b8	String	jsonType.label
59aee225-262b-4fba-a5ac-add72db0b4f3	true	userinfo.token.claim
59aee225-262b-4fba-a5ac-add72db0b4f3	username	user.attribute
59aee225-262b-4fba-a5ac-add72db0b4f3	true	id.token.claim
59aee225-262b-4fba-a5ac-add72db0b4f3	true	access.token.claim
59aee225-262b-4fba-a5ac-add72db0b4f3	upn	claim.name
59aee225-262b-4fba-a5ac-add72db0b4f3	String	jsonType.label
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	true	multivalued
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	foo	user.attribute
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	true	id.token.claim
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	true	access.token.claim
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	groups	claim.name
a0f3461a-dd3d-47a7-bb0e-8c7184e16936	String	jsonType.label
9e4110e7-1915-4d55-b975-90ee36c892d7	true	userinfo.token.claim
9e4110e7-1915-4d55-b975-90ee36c892d7	locale	user.attribute
9e4110e7-1915-4d55-b975-90ee36c892d7	true	id.token.claim
9e4110e7-1915-4d55-b975-90ee36c892d7	true	access.token.claim
9e4110e7-1915-4d55-b975-90ee36c892d7	locale	claim.name
9e4110e7-1915-4d55-b975-90ee36c892d7	String	jsonType.label
4533d8af-9736-4e0a-93ec-823d60652c9a	clientAddress	user.session.note
4533d8af-9736-4e0a-93ec-823d60652c9a	true	id.token.claim
4533d8af-9736-4e0a-93ec-823d60652c9a	true	access.token.claim
4533d8af-9736-4e0a-93ec-823d60652c9a	clientAddress	claim.name
4533d8af-9736-4e0a-93ec-823d60652c9a	String	jsonType.label
9e2239dc-7de8-43cb-b2db-0ea825769906	clientHost	user.session.note
9e2239dc-7de8-43cb-b2db-0ea825769906	true	id.token.claim
9e2239dc-7de8-43cb-b2db-0ea825769906	true	access.token.claim
9e2239dc-7de8-43cb-b2db-0ea825769906	clientHost	claim.name
9e2239dc-7de8-43cb-b2db-0ea825769906	String	jsonType.label
b6ada83a-9a11-4e86-8ac9-cc96e335edff	clientId	user.session.note
b6ada83a-9a11-4e86-8ac9-cc96e335edff	true	id.token.claim
b6ada83a-9a11-4e86-8ac9-cc96e335edff	true	access.token.claim
b6ada83a-9a11-4e86-8ac9-cc96e335edff	clientId	claim.name
b6ada83a-9a11-4e86-8ac9-cc96e335edff	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	43f06207-b1c2-41c4-a2b3-b0e797db25dd	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	725bf9de-3603-4455-a424-d7d208df26fe	c6f6141b-5d62-401a-a34d-99f4cce166be	6a23c015-0b05-4146-b98d-d25aa7f46797	b4362b81-58f7-4f37-a30a-e41902aace24	beebf7bd-e1e9-4bce-99f0-26a10b01e5ed	2592000	f	900	t	f	6755f763-61cf-486d-8d86-008fce3f1c93	0	f	0	0	15049335-3636-4b63-ad25-608926eae9e2
Superset	60	300	300	\N	\N	\N	t	f	0	\N	Superset	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	d2454b11-ede4-4a15-840a-ac868983bcca	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	b77a16aa-603d-4f20-9cc3-8dc74c91cf7f	ab05f7ab-76d8-431f-9692-f3b89dfe35fa	75da2a91-8b58-4368-be0f-f8ba3829ffd5	723b3de5-47d8-47bc-be92-d90bc11f0d31	db42e8d7-63e2-4008-9125-1c9a68e88588	2592000	f	900	t	f	e5d79c16-9c48-443f-9b22-366010cb3f72	0	f	0	0	18bb1321-2776-4d1d-97b7-e5e25628d249
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	master
_browser_header.xContentTypeOptions	master	nosniff
_browser_header.xRobotsTag	master	none
_browser_header.xFrameOptions	master	SAMEORIGIN
_browser_header.contentSecurityPolicy	master	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	master	1; mode=block
_browser_header.strictTransportSecurity	master	max-age=31536000; includeSubDomains
bruteForceProtected	master	false
permanentLockout	master	false
maxFailureWaitSeconds	master	900
minimumQuickLoginWaitSeconds	master	60
waitIncrementSeconds	master	60
quickLoginCheckMilliSeconds	master	1000
maxDeltaTimeSeconds	master	43200
failureFactor	master	30
displayName	master	Keycloak
displayNameHtml	master	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	master	RS256
offlineSessionMaxLifespanEnabled	master	false
offlineSessionMaxLifespan	master	5184000
_browser_header.contentSecurityPolicyReportOnly	Superset
_browser_header.xContentTypeOptions	Superset	nosniff
_browser_header.xRobotsTag	Superset	none
_browser_header.xFrameOptions	Superset	SAMEORIGIN
_browser_header.contentSecurityPolicy	Superset	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	Superset	1; mode=block
_browser_header.strictTransportSecurity	Superset	max-age=31536000; includeSubDomains
bruteForceProtected	Superset	false
permanentLockout	Superset	false
maxFailureWaitSeconds	Superset	900
minimumQuickLoginWaitSeconds	Superset	60
waitIncrementSeconds	Superset	60
quickLoginCheckMilliSeconds	Superset	1000
maxDeltaTimeSeconds	Superset	43200
failureFactor	Superset	30
defaultSignatureAlgorithm	Superset	RS256
offlineSessionMaxLifespanEnabled	Superset	false
offlineSessionMaxLifespan	Superset	5184000
actionTokenGeneratedByAdminLifespan	Superset	43200
actionTokenGeneratedByUserLifespan	Superset	300
oauth2DeviceCodeLifespan	Superset	600
oauth2DevicePollingInterval	Superset	5
webAuthnPolicyRpEntityName	Superset	keycloak
webAuthnPolicySignatureAlgorithms	Superset	ES256
webAuthnPolicyRpId	Superset
webAuthnPolicyAttestationConveyancePreference	Superset	not specified
webAuthnPolicyAuthenticatorAttachment	Superset	not specified
webAuthnPolicyRequireResidentKey	Superset	not specified
webAuthnPolicyUserVerificationRequirement	Superset	not specified
webAuthnPolicyCreateTimeout	Superset	0
webAuthnPolicyAvoidSameAuthenticatorRegister	Superset	false
webAuthnPolicyRpEntityNamePasswordless	Superset	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	Superset	ES256
webAuthnPolicyRpIdPasswordless	Superset
webAuthnPolicyAttestationConveyancePreferencePasswordless	Superset	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	Superset	not specified
webAuthnPolicyRequireResidentKeyPasswordless	Superset	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	Superset	not specified
webAuthnPolicyCreateTimeoutPasswordless	Superset	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	Superset	false
cibaBackchannelTokenDeliveryMode	Superset	poll
cibaExpiresIn	Superset	120
cibaInterval	Superset	5
cibaAuthRequestedUserHint	Superset	login_hint
parRequestUriLifespan	Superset	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
Superset	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	Superset
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirect_uris (client_id, value) FROM stdin;
5bc94255-f104-43f9-a354-a23a6d6ae8b3	/realms/master/account/*
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	/realms/master/account/*
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	/admin/master/console/*
9f041e11-d6fb-4c86-8a61-22370f383d8c	/realms/Superset/account/*
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	/realms/Superset/account/*
0f67de81-9843-4253-8c3a-0352cef40636	/admin/Superset/console/*
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
208ab3be-e9a9-487c-a932-495d736bcc6b	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
42183271-e93c-479f-8c90-2f6836932a6f	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
9074b3ad-1cb9-4fef-b69c-0732c1eed26d	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
653c6e8d-bddd-4e71-b074-e9eef54160ae	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
23d7a55d-3d01-4061-b303-db54c341fd2b	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
34a26481-5a25-4928-ad87-6e994f64b8d0	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
b0c0d842-a167-4904-b9fd-f4ab6fa134c8	delete_account	Delete Account	master	f	f	delete_account	60
d29dbdbc-beed-4e21-9f1a-bc7fa07a5794	VERIFY_EMAIL	Verify Email	Superset	t	f	VERIFY_EMAIL	50
0d2f6a1d-4915-40c0-8ed1-a4c40f2cb87e	UPDATE_PROFILE	Update Profile	Superset	t	f	UPDATE_PROFILE	40
d8f16915-b589-4509-ad82-c786ddb0ed94	CONFIGURE_TOTP	Configure OTP	Superset	t	f	CONFIGURE_TOTP	10
5de7bc14-cc35-477b-8a04-8319629c104b	UPDATE_PASSWORD	Update Password	Superset	t	f	UPDATE_PASSWORD	30
56d6ceb9-e72b-46d3-8e93-892a2fca4c88	terms_and_conditions	Terms and Conditions	Superset	f	f	terms_and_conditions	20
82143611-c2a0-4b1a-abfb-e1ddcbef4a3b	update_user_locale	Update User Locale	Superset	t	f	update_user_locale	1000
914d6341-0f6c-4633-95f1-2194cf18cbca	delete_account	Delete Account	Superset	f	f	delete_account	60
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
2c656d86-fa81-4b7c-8277-7ed7c57e67f5	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
8131cb22-1055-4732-a4d7-660e77ada763	Default Policy	A policy that grants access only for users within this realm	js	0	0	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	\N
8dfc60b3-8991-4d85-8ad8-e47b39907868	Default Permission	A permission that applies to the default resource type	resource	1	0	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
77ce50b2-8c05-4d7c-b04a-48b8fa6e68d9	Default Resource	urn:client-superset:resources:default	\N	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_uris (resource_id, value) FROM stdin;
77ce50b2-8c05-4d7c-b04a-48b8fa6e68d9	/*
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
8f1a0370-b347-46d3-adbd-bda5b32fbdb8	2353b21c-e447-46c2-a187-603f40e5a001
e4a35d6f-108d-4b53-9b3b-36230fbcc8e8	dcde1fd7-7141-43b0-ad0f-6f0e78852cfd
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
5035e40d-7ef5-4b1a-97e0-28bfa3396f44	\N	19549a87-0376-460d-9d21-f9f91ca53ac8	f	t	\N	\N	\N	master	admin	1658395380701	\N	0
38d778c6-6361-4eae-a04e-2c28f5acab7c	\N	ba81135c-15fe-4fd1-a6d1-62a1b54319e7	f	t	\N	\N	\N	Superset	service-account-client-superset	1658395547050	2c656d86-fa81-4b7c-8277-7ed7c57e67f5	0
0cd1e99f-227a-4e01-a786-088b7c7f2232	hung@hung.com	hung@hung.com	f	t	\N	Hưng	Khoai To	Superset	hung	1658396274155	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
15049335-3636-4b63-ad25-608926eae9e2	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
af4c5f38-7436-4e1e-9808-7580aacb067c	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
8728ca5b-7f2a-459c-91d5-353278b4ae24	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
d224dceb-ea87-4e1f-8743-bee78fb3d215	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
2071787c-b93b-49e9-9611-71c758a13703	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
26aeb649-f91a-4dda-8a38-8a25ddb12a72	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
7c0e4228-766b-491b-8d36-af3ab29a6a36	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
bd761ce3-4e52-46fb-8cc3-667dedff65f9	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
7686ea7b-297f-4236-89da-39f9c1c907dc	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
563e6487-a4cf-4e5e-97bf-0e4230d4bf41	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
625bc9c9-6bfb-4032-8d46-477bb93e3216	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
9da5f94b-95d3-45a2-91f8-5aff1281d388	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
5d922f81-3464-40c9-b6d0-5fbeadc3f08e	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
b3779787-c66c-490e-a821-821cfbbbcbed	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
210742cd-5e76-409c-b8e5-3d500b42c5ae	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
b050541a-c8b2-4918-b681-2f7d8202b6f7	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
d6ebc1f0-d5e7-455f-bfdf-ea4c5bf9679e	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
7c35a6c0-b5e9-46b2-a23d-6ed01575d499	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
4f74f6fb-cfba-4586-89b8-48c5bb38e78b	5035e40d-7ef5-4b1a-97e0-28bfa3396f44
18bb1321-2776-4d1d-97b7-e5e25628d249	38d778c6-6361-4eae-a04e-2c28f5acab7c
504fe6c2-0752-4120-89fa-5f19262213c2	38d778c6-6361-4eae-a04e-2c28f5acab7c
18bb1321-2776-4d1d-97b7-e5e25628d249	0cd1e99f-227a-4e01-a786-088b7c7f2232
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
c15bdbca-51b7-4ff3-bbf4-1ece5fb98680	+
0f67de81-9843-4253-8c3a-0352cef40636	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "kong" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: kong; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE kong WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE kong OWNER TO postgres;

\connect kong

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sync_tags(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sync_tags() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          IF (TG_OP = 'TRUNCATE') THEN
            DELETE FROM tags WHERE entity_name = TG_TABLE_NAME;
            RETURN NULL;
          ELSIF (TG_OP = 'DELETE') THEN
            DELETE FROM tags WHERE entity_id = OLD.id;
            RETURN OLD;
          ELSE

          -- Triggered by INSERT/UPDATE
          -- Do an upsert on the tags table
          -- So we don't need to migrate pre 1.1 entities
          INSERT INTO tags VALUES (NEW.id, TG_TABLE_NAME, NEW.tags)
          ON CONFLICT (entity_id) DO UPDATE
                  SET tags=EXCLUDED.tags;
          END IF;
          RETURN NEW;
        END;
      $$;


ALTER FUNCTION public.sync_tags() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acls (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    consumer_id uuid,
    "group" text,
    cache_key text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.acls OWNER TO postgres;

--
-- Name: acme_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acme_storage (
    id uuid NOT NULL,
    key text,
    value text,
    created_at timestamp with time zone,
    ttl timestamp with time zone
);


ALTER TABLE public.acme_storage OWNER TO postgres;

--
-- Name: basicauth_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basicauth_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    consumer_id uuid,
    username text,
    password text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.basicauth_credentials OWNER TO postgres;

--
-- Name: ca_certificates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ca_certificates (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    cert text NOT NULL,
    tags text[],
    cert_digest text NOT NULL
);


ALTER TABLE public.ca_certificates OWNER TO postgres;

--
-- Name: certificates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificates (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    cert text,
    key text,
    tags text[],
    ws_id uuid,
    cert_alt text,
    key_alt text
);


ALTER TABLE public.certificates OWNER TO postgres;

--
-- Name: cluster_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cluster_events (
    id uuid NOT NULL,
    node_id uuid NOT NULL,
    at timestamp with time zone NOT NULL,
    nbf timestamp with time zone,
    expire_at timestamp with time zone NOT NULL,
    channel text,
    data text
);


ALTER TABLE public.cluster_events OWNER TO postgres;

--
-- Name: clustering_data_planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clustering_data_planes (
    id uuid NOT NULL,
    hostname text NOT NULL,
    ip text NOT NULL,
    last_seen timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    config_hash text NOT NULL,
    ttl timestamp with time zone,
    version text,
    sync_status text DEFAULT 'unknown'::text NOT NULL
);


ALTER TABLE public.clustering_data_planes OWNER TO postgres;

--
-- Name: consumers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumers (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    username text,
    custom_id text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.consumers OWNER TO postgres;

--
-- Name: hmacauth_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hmacauth_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    consumer_id uuid,
    username text,
    secret text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.hmacauth_credentials OWNER TO postgres;

--
-- Name: jwt_secrets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jwt_secrets (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    consumer_id uuid,
    key text,
    secret text,
    algorithm text,
    rsa_public_key text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.jwt_secrets OWNER TO postgres;

--
-- Name: keyauth_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keyauth_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    consumer_id uuid,
    key text,
    tags text[],
    ttl timestamp with time zone,
    ws_id uuid
);


ALTER TABLE public.keyauth_credentials OWNER TO postgres;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locks (
    key text NOT NULL,
    owner text,
    ttl timestamp with time zone
);


ALTER TABLE public.locks OWNER TO postgres;

--
-- Name: oauth2_authorization_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_authorization_codes (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    credential_id uuid,
    service_id uuid,
    code text,
    authenticated_userid text,
    scope text,
    ttl timestamp with time zone,
    challenge text,
    challenge_method text,
    ws_id uuid
);


ALTER TABLE public.oauth2_authorization_codes OWNER TO postgres;

--
-- Name: oauth2_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    name text,
    consumer_id uuid,
    client_id text,
    client_secret text,
    redirect_uris text[],
    tags text[],
    client_type text,
    hash_secret boolean,
    ws_id uuid
);


ALTER TABLE public.oauth2_credentials OWNER TO postgres;

--
-- Name: oauth2_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_tokens (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    credential_id uuid,
    service_id uuid,
    access_token text,
    refresh_token text,
    token_type text,
    expires_in integer,
    authenticated_userid text,
    scope text,
    ttl timestamp with time zone,
    ws_id uuid
);


ALTER TABLE public.oauth2_tokens OWNER TO postgres;

--
-- Name: parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parameters (
    key text NOT NULL,
    value text NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.parameters OWNER TO postgres;

--
-- Name: plugins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plugins (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    name text NOT NULL,
    consumer_id uuid,
    service_id uuid,
    route_id uuid,
    config jsonb NOT NULL,
    enabled boolean NOT NULL,
    cache_key text,
    protocols text[],
    tags text[],
    ws_id uuid
);


ALTER TABLE public.plugins OWNER TO postgres;

--
-- Name: ratelimiting_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratelimiting_metrics (
    identifier text NOT NULL,
    period text NOT NULL,
    period_date timestamp with time zone NOT NULL,
    service_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    route_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    value integer,
    ttl timestamp with time zone
);


ALTER TABLE public.ratelimiting_metrics OWNER TO postgres;

--
-- Name: response_ratelimiting_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.response_ratelimiting_metrics (
    identifier text NOT NULL,
    period text NOT NULL,
    period_date timestamp with time zone NOT NULL,
    service_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    route_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    value integer
);


ALTER TABLE public.response_ratelimiting_metrics OWNER TO postgres;

--
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name text,
    service_id uuid,
    protocols text[],
    methods text[],
    hosts text[],
    paths text[],
    snis text[],
    sources jsonb[],
    destinations jsonb[],
    regex_priority bigint,
    strip_path boolean,
    preserve_host boolean,
    tags text[],
    https_redirect_status_code integer,
    headers jsonb,
    path_handling text DEFAULT 'v0'::text,
    ws_id uuid,
    request_buffering boolean,
    response_buffering boolean
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- Name: schema_meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_meta (
    key text NOT NULL,
    subsystem text NOT NULL,
    last_executed text,
    executed text[],
    pending text[]
);


ALTER TABLE public.schema_meta OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name text,
    retries bigint,
    protocol text,
    host text,
    port bigint,
    path text,
    connect_timeout bigint,
    write_timeout bigint,
    read_timeout bigint,
    tags text[],
    client_certificate_id uuid,
    tls_verify boolean,
    tls_verify_depth smallint,
    ca_certificates uuid[],
    ws_id uuid,
    enabled boolean DEFAULT true
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id uuid NOT NULL,
    session_id text,
    expires integer,
    data text,
    created_at timestamp with time zone,
    ttl timestamp with time zone
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: snis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.snis (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    name text NOT NULL,
    certificate_id uuid,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.snis OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    entity_id uuid NOT NULL,
    entity_name text,
    tags text[]
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: targets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targets (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(3) AT TIME ZONE 'UTC'::text),
    upstream_id uuid,
    target text NOT NULL,
    weight integer NOT NULL,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.targets OWNER TO postgres;

--
-- Name: ttls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ttls (
    primary_key_value text NOT NULL,
    primary_uuid_value uuid,
    table_name text NOT NULL,
    primary_key_name text NOT NULL,
    expire_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ttls OWNER TO postgres;

--
-- Name: upstreams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upstreams (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(3) AT TIME ZONE 'UTC'::text),
    name text,
    hash_on text,
    hash_fallback text,
    hash_on_header text,
    hash_fallback_header text,
    hash_on_cookie text,
    hash_on_cookie_path text,
    slots integer NOT NULL,
    healthchecks jsonb,
    tags text[],
    algorithm text,
    host_header text,
    client_certificate_id uuid,
    ws_id uuid
);


ALTER TABLE public.upstreams OWNER TO postgres;

--
-- Name: vaults_beta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaults_beta (
    id uuid NOT NULL,
    ws_id uuid,
    prefix text,
    name text NOT NULL,
    description text,
    config jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    updated_at timestamp with time zone,
    tags text[]
);


ALTER TABLE public.vaults_beta OWNER TO postgres;

--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workspaces (
    id uuid NOT NULL,
    name text,
    comment text,
    created_at timestamp with time zone DEFAULT (CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'::text),
    meta jsonb,
    config jsonb
);


ALTER TABLE public.workspaces OWNER TO postgres;

--
-- Data for Name: acls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acls (id, created_at, consumer_id, "group", cache_key, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: acme_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acme_storage (id, key, value, created_at, ttl) FROM stdin;
\.


--
-- Data for Name: basicauth_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basicauth_credentials (id, created_at, consumer_id, username, password, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: ca_certificates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ca_certificates (id, created_at, cert, tags, cert_digest) FROM stdin;
\.


--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificates (id, created_at, cert, key, tags, ws_id, cert_alt, key_alt) FROM stdin;
\.


--
-- Data for Name: cluster_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) FROM stdin;
\.


--
-- Data for Name: clustering_data_planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clustering_data_planes (id, hostname, ip, last_seen, config_hash, ttl, version, sync_status) FROM stdin;
\.


--
-- Data for Name: consumers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumers (id, created_at, username, custom_id, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: hmacauth_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hmacauth_credentials (id, created_at, consumer_id, username, secret, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: jwt_secrets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jwt_secrets (id, created_at, consumer_id, key, secret, algorithm, rsa_public_key, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: keyauth_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keyauth_credentials (id, created_at, consumer_id, key, tags, ttl, ws_id) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locks (key, owner, ttl) FROM stdin;
\.


--
-- Data for Name: oauth2_authorization_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_authorization_codes (id, created_at, credential_id, service_id, code, authenticated_userid, scope, ttl, challenge, challenge_method, ws_id) FROM stdin;
\.


--
-- Data for Name: oauth2_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_credentials (id, created_at, name, consumer_id, client_id, client_secret, redirect_uris, tags, client_type, hash_secret, ws_id) FROM stdin;
\.


--
-- Data for Name: oauth2_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_tokens (id, created_at, credential_id, service_id, access_token, refresh_token, token_type, expires_in, authenticated_userid, scope, ttl, ws_id) FROM stdin;
\.


--
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parameters (key, value, created_at) FROM stdin;
cluster_id	3e2c02b7-89ba-419c-a249-d9658e51916f	\N
\.


--
-- Data for Name: plugins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id) FROM stdin;
7c021e4b-6461-4918-9d79-a8979e2c31db	2022-06-14 15:51:50+00	oidc	\N	\N	64cb2078-aecf-4566-9ac7-0031c3eb8c0f	{"realm": "superset", "scope": "openid", "filters": null, "client_id": "client-superset", "discovery": "http://keycloak.localhost:8000/realms/superset/.well-known/openid-configuration", "ssl_verify": "no", "bearer_only": "false", "logout_path": "/logout", "client_secret": "uAaZTIKPfzaxZeFxtAcgQbSrORiQ0hk2", "response_type": "code", "session_secret": null, "redirect_uri_path": null, "recovery_page_path": null, "introspection_endpoint": "http://keycloak.localhost:8000/realms/superset/protocol/openid-connect/token/introspect", "redirect_after_logout_uri": "http://keycloak.localhost:8000/realms/superset/protocol/openid-connect/logout?redirect_uri=http://superset.localhost:8000", "token_endpoint_auth_method": "client_secret_post", "introspection_endpoint_auth_method": null}	t	plugins:oidc:64cb2078-aecf-4566-9ac7-0031c3eb8c0f::::cf012198-f272-41ca-86ec-4508372e34ad	{grpc,grpcs,http,https}	\N	4a61d986-230a-4264-937e-f593e90db2ae
\.


--
-- Data for Name: ratelimiting_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratelimiting_metrics (identifier, period, period_date, service_id, route_id, value, ttl) FROM stdin;
\.


--
-- Data for Name: response_ratelimiting_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.response_ratelimiting_metrics (identifier, period, period_date, service_id, route_id, value) FROM stdin;
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering) FROM stdin;
9b06b15c-67a3-449e-92c2-1a9552b44d79	2022-06-15 04:27:13+00	2022-06-15 06:38:54+00	keycloak-route	13867ecf-82e4-4294-a81e-f764144a615d	{http,https}	\N	{keycloak.localhost}	{/}	\N	\N	\N	0	t	t	\N	426	\N	v1	4a61d986-230a-4264-937e-f593e90db2ae	t	t
64cb2078-aecf-4566-9ac7-0031c3eb8c0f	2022-06-14 15:48:45+00	2022-06-15 06:39:23+00	superset-route	d5b02ad9-7cd6-4795-b350-aa7072e15ed7	{http,https}	\N	{superset.localhost}	{/}	\N	\N	\N	0	t	t	\N	426	\N	v1	4a61d986-230a-4264-937e-f593e90db2ae	t	t
\.


--
-- Data for Name: schema_meta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_meta (key, subsystem, last_executed, executed, pending) FROM stdin;
schema_meta	jwt	003_200_to_210	{000_base_jwt,002_130_to_140,003_200_to_210}	{}
schema_meta	key-auth	003_200_to_210	{000_base_key_auth,002_130_to_140,003_200_to_210}	{}
schema_meta	oauth2	005_210_to_211	{000_base_oauth2,003_130_to_140,004_200_to_210,005_210_to_211}	{}
schema_meta	rate-limiting	004_200_to_210	{000_base_rate_limiting,003_10_to_112,004_200_to_210}	\N
schema_meta	response-ratelimiting	000_base_response_rate_limiting	{000_base_response_rate_limiting}	\N
schema_meta	session	001_add_ttl_index	{000_base_session,001_add_ttl_index}	\N
schema_meta	core	015_270_to_280	{000_base,003_100_to_110,004_110_to_120,005_120_to_130,006_130_to_140,007_140_to_150,008_150_to_200,009_200_to_210,010_210_to_211,011_212_to_213,012_213_to_220,013_220_to_230,014_230_to_270,015_270_to_280}	{}
schema_meta	acl	004_212_to_213	{000_base_acl,002_130_to_140,003_200_to_210,004_212_to_213}	{}
schema_meta	acme	000_base_acme	{000_base_acme}	\N
schema_meta	basic-auth	003_200_to_210	{000_base_basic_auth,002_130_to_140,003_200_to_210}	{}
schema_meta	bot-detection	001_200_to_210	{001_200_to_210}	{}
schema_meta	hmac-auth	003_200_to_210	{000_base_hmac_auth,002_130_to_140,003_200_to_210}	{}
schema_meta	ip-restriction	001_200_to_210	{001_200_to_210}	{}
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, created_at, updated_at, name, retries, protocol, host, port, path, connect_timeout, write_timeout, read_timeout, tags, client_certificate_id, tls_verify, tls_verify_depth, ca_certificates, ws_id, enabled) FROM stdin;
13867ecf-82e4-4294-a81e-f764144a615d	2022-06-15 04:23:32+00	2022-06-15 04:57:04+00	keycloak-service	5	http	keycloak	8080	/	60000	60000	60000	{}	\N	\N	\N	\N	4a61d986-230a-4264-937e-f593e90db2ae	t
d5b02ad9-7cd6-4795-b350-aa7072e15ed7	2022-06-14 15:47:13+00	2022-06-15 06:34:47+00	superset-service	5	http	10.97.28.40	8088	/	60000	60000	60000	{}	\N	\N	\N	\N	4a61d986-230a-4264-937e-f593e90db2ae	t
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, session_id, expires, data, created_at, ttl) FROM stdin;
\.


--
-- Data for Name: snis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.snis (id, created_at, name, certificate_id, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (entity_id, entity_name, tags) FROM stdin;
13867ecf-82e4-4294-a81e-f764144a615d	services	{}
9b06b15c-67a3-449e-92c2-1a9552b44d79	routes	\N
d5b02ad9-7cd6-4795-b350-aa7072e15ed7	services	{}
64cb2078-aecf-4566-9ac7-0031c3eb8c0f	routes	\N
7c021e4b-6461-4918-9d79-a8979e2c31db	plugins	\N
\.


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targets (id, created_at, upstream_id, target, weight, tags, ws_id) FROM stdin;
\.


--
-- Data for Name: ttls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ttls (primary_key_value, primary_uuid_value, table_name, primary_key_name, expire_at) FROM stdin;
\.


--
-- Data for Name: upstreams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upstreams (id, created_at, name, hash_on, hash_fallback, hash_on_header, hash_fallback_header, hash_on_cookie, hash_on_cookie_path, slots, healthchecks, tags, algorithm, host_header, client_certificate_id, ws_id) FROM stdin;
\.


--
-- Data for Name: vaults_beta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vaults_beta (id, ws_id, prefix, name, description, config, created_at, updated_at, tags) FROM stdin;
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workspaces (id, name, comment, created_at, meta, config) FROM stdin;
4a61d986-230a-4264-937e-f593e90db2ae	default	\N	2022-07-21 09:19:43+00	\N	\N
\.


--
-- Name: acls acls_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_cache_key_key UNIQUE (cache_key);


--
-- Name: acls acls_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: acls acls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_pkey PRIMARY KEY (id);


--
-- Name: acme_storage acme_storage_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acme_storage
    ADD CONSTRAINT acme_storage_key_key UNIQUE (key);


--
-- Name: acme_storage acme_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acme_storage
    ADD CONSTRAINT acme_storage_pkey PRIMARY KEY (id);


--
-- Name: basicauth_credentials basicauth_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: basicauth_credentials basicauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: basicauth_credentials basicauth_credentials_ws_id_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_ws_id_username_unique UNIQUE (ws_id, username);


--
-- Name: ca_certificates ca_certificates_cert_digest_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ca_certificates
    ADD CONSTRAINT ca_certificates_cert_digest_key UNIQUE (cert_digest);


--
-- Name: ca_certificates ca_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ca_certificates
    ADD CONSTRAINT ca_certificates_pkey PRIMARY KEY (id);


--
-- Name: certificates certificates_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: cluster_events cluster_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cluster_events
    ADD CONSTRAINT cluster_events_pkey PRIMARY KEY (id);


--
-- Name: clustering_data_planes clustering_data_planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clustering_data_planes
    ADD CONSTRAINT clustering_data_planes_pkey PRIMARY KEY (id);


--
-- Name: consumers consumers_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: consumers consumers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_pkey PRIMARY KEY (id);


--
-- Name: consumers consumers_ws_id_custom_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_ws_id_custom_id_unique UNIQUE (ws_id, custom_id);


--
-- Name: consumers consumers_ws_id_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_ws_id_username_unique UNIQUE (ws_id, username);


--
-- Name: hmacauth_credentials hmacauth_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: hmacauth_credentials hmacauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: hmacauth_credentials hmacauth_credentials_ws_id_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_ws_id_username_unique UNIQUE (ws_id, username);


--
-- Name: jwt_secrets jwt_secrets_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: jwt_secrets jwt_secrets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_pkey PRIMARY KEY (id);


--
-- Name: jwt_secrets jwt_secrets_ws_id_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_ws_id_key_unique UNIQUE (ws_id, key);


--
-- Name: keyauth_credentials keyauth_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: keyauth_credentials keyauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: keyauth_credentials keyauth_credentials_ws_id_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_ws_id_key_unique UNIQUE (ws_id, key);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (key);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_ws_id_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_ws_id_code_unique UNIQUE (ws_id, code);


--
-- Name: oauth2_credentials oauth2_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: oauth2_credentials oauth2_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_pkey PRIMARY KEY (id);


--
-- Name: oauth2_credentials oauth2_credentials_ws_id_client_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_ws_id_client_id_unique UNIQUE (ws_id, client_id);


--
-- Name: oauth2_tokens oauth2_tokens_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: oauth2_tokens oauth2_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth2_tokens oauth2_tokens_ws_id_access_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_ws_id_access_token_unique UNIQUE (ws_id, access_token);


--
-- Name: oauth2_tokens oauth2_tokens_ws_id_refresh_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_ws_id_refresh_token_unique UNIQUE (ws_id, refresh_token);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (key);


--
-- Name: plugins plugins_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_cache_key_key UNIQUE (cache_key);


--
-- Name: plugins plugins_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: plugins plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- Name: ratelimiting_metrics ratelimiting_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratelimiting_metrics
    ADD CONSTRAINT ratelimiting_metrics_pkey PRIMARY KEY (identifier, period, period_date, service_id, route_id);


--
-- Name: response_ratelimiting_metrics response_ratelimiting_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response_ratelimiting_metrics
    ADD CONSTRAINT response_ratelimiting_metrics_pkey PRIMARY KEY (identifier, period, period_date, service_id, route_id);


--
-- Name: routes routes_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: routes routes_ws_id_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_ws_id_name_unique UNIQUE (ws_id, name);


--
-- Name: schema_meta schema_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_meta
    ADD CONSTRAINT schema_meta_pkey PRIMARY KEY (key, subsystem);


--
-- Name: services services_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services services_ws_id_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_ws_id_name_unique UNIQUE (ws_id, name);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_session_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);


--
-- Name: snis snis_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: snis snis_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_name_key UNIQUE (name);


--
-- Name: snis snis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (entity_id);


--
-- Name: targets targets_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: targets targets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: ttls ttls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttls
    ADD CONSTRAINT ttls_pkey PRIMARY KEY (primary_key_value, table_name);


--
-- Name: upstreams upstreams_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: upstreams upstreams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_pkey PRIMARY KEY (id);


--
-- Name: upstreams upstreams_ws_id_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_ws_id_name_unique UNIQUE (ws_id, name);


--
-- Name: vaults_beta vaults_beta_id_ws_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaults_beta
    ADD CONSTRAINT vaults_beta_id_ws_id_key UNIQUE (id, ws_id);


--
-- Name: vaults_beta vaults_beta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaults_beta
    ADD CONSTRAINT vaults_beta_pkey PRIMARY KEY (id);


--
-- Name: vaults_beta vaults_beta_prefix_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaults_beta
    ADD CONSTRAINT vaults_beta_prefix_key UNIQUE (prefix);


--
-- Name: vaults_beta vaults_beta_prefix_ws_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaults_beta
    ADD CONSTRAINT vaults_beta_prefix_ws_id_key UNIQUE (prefix, ws_id);


--
-- Name: workspaces workspaces_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_name_key UNIQUE (name);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: acls_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX acls_consumer_id_idx ON public.acls USING btree (consumer_id);


--
-- Name: acls_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX acls_group_idx ON public.acls USING btree ("group");


--
-- Name: acls_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX acls_tags_idex_tags_idx ON public.acls USING gin (tags);


--
-- Name: basicauth_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX basicauth_consumer_id_idx ON public.basicauth_credentials USING btree (consumer_id);


--
-- Name: basicauth_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX basicauth_tags_idex_tags_idx ON public.basicauth_credentials USING gin (tags);


--
-- Name: certificates_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX certificates_tags_idx ON public.certificates USING gin (tags);


--
-- Name: cluster_events_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cluster_events_at_idx ON public.cluster_events USING btree (at);


--
-- Name: cluster_events_channel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cluster_events_channel_idx ON public.cluster_events USING btree (channel);


--
-- Name: cluster_events_expire_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cluster_events_expire_at_idx ON public.cluster_events USING btree (expire_at);


--
-- Name: clustering_data_planes_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clustering_data_planes_ttl_idx ON public.clustering_data_planes USING btree (ttl);


--
-- Name: consumers_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumers_tags_idx ON public.consumers USING gin (tags);


--
-- Name: consumers_username_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumers_username_idx ON public.consumers USING btree (lower(username));


--
-- Name: hmacauth_credentials_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hmacauth_credentials_consumer_id_idx ON public.hmacauth_credentials USING btree (consumer_id);


--
-- Name: hmacauth_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hmacauth_tags_idex_tags_idx ON public.hmacauth_credentials USING gin (tags);


--
-- Name: jwt_secrets_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jwt_secrets_consumer_id_idx ON public.jwt_secrets USING btree (consumer_id);


--
-- Name: jwt_secrets_secret_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jwt_secrets_secret_idx ON public.jwt_secrets USING btree (secret);


--
-- Name: jwtsecrets_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jwtsecrets_tags_idex_tags_idx ON public.jwt_secrets USING gin (tags);


--
-- Name: keyauth_credentials_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX keyauth_credentials_consumer_id_idx ON public.keyauth_credentials USING btree (consumer_id);


--
-- Name: keyauth_credentials_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX keyauth_credentials_ttl_idx ON public.keyauth_credentials USING btree (ttl);


--
-- Name: keyauth_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX keyauth_tags_idex_tags_idx ON public.keyauth_credentials USING gin (tags);


--
-- Name: locks_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locks_ttl_idx ON public.locks USING btree (ttl);


--
-- Name: oauth2_authorization_codes_authenticated_userid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_authorization_codes_authenticated_userid_idx ON public.oauth2_authorization_codes USING btree (authenticated_userid);


--
-- Name: oauth2_authorization_codes_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_authorization_codes_ttl_idx ON public.oauth2_authorization_codes USING btree (ttl);


--
-- Name: oauth2_authorization_credential_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_authorization_credential_id_idx ON public.oauth2_authorization_codes USING btree (credential_id);


--
-- Name: oauth2_authorization_service_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_authorization_service_id_idx ON public.oauth2_authorization_codes USING btree (service_id);


--
-- Name: oauth2_credentials_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_credentials_consumer_id_idx ON public.oauth2_credentials USING btree (consumer_id);


--
-- Name: oauth2_credentials_secret_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_credentials_secret_idx ON public.oauth2_credentials USING btree (client_secret);


--
-- Name: oauth2_credentials_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_credentials_tags_idex_tags_idx ON public.oauth2_credentials USING gin (tags);


--
-- Name: oauth2_tokens_authenticated_userid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_tokens_authenticated_userid_idx ON public.oauth2_tokens USING btree (authenticated_userid);


--
-- Name: oauth2_tokens_credential_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_tokens_credential_id_idx ON public.oauth2_tokens USING btree (credential_id);


--
-- Name: oauth2_tokens_service_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_tokens_service_id_idx ON public.oauth2_tokens USING btree (service_id);


--
-- Name: oauth2_tokens_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_tokens_ttl_idx ON public.oauth2_tokens USING btree (ttl);


--
-- Name: plugins_consumer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plugins_consumer_id_idx ON public.plugins USING btree (consumer_id);


--
-- Name: plugins_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plugins_name_idx ON public.plugins USING btree (name);


--
-- Name: plugins_route_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plugins_route_id_idx ON public.plugins USING btree (route_id);


--
-- Name: plugins_service_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plugins_service_id_idx ON public.plugins USING btree (service_id);


--
-- Name: plugins_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plugins_tags_idx ON public.plugins USING gin (tags);


--
-- Name: ratelimiting_metrics_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ratelimiting_metrics_idx ON public.ratelimiting_metrics USING btree (service_id, route_id, period_date, period);


--
-- Name: ratelimiting_metrics_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ratelimiting_metrics_ttl_idx ON public.ratelimiting_metrics USING btree (ttl);


--
-- Name: routes_service_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX routes_service_id_idx ON public.routes USING btree (service_id);


--
-- Name: routes_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX routes_tags_idx ON public.routes USING gin (tags);


--
-- Name: services_fkey_client_certificate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_fkey_client_certificate ON public.services USING btree (client_certificate_id);


--
-- Name: services_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_tags_idx ON public.services USING gin (tags);


--
-- Name: session_sessions_expires_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX session_sessions_expires_idx ON public.sessions USING btree (expires);


--
-- Name: sessions_ttl_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_ttl_idx ON public.sessions USING btree (ttl);


--
-- Name: snis_certificate_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX snis_certificate_id_idx ON public.snis USING btree (certificate_id);


--
-- Name: snis_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX snis_tags_idx ON public.snis USING gin (tags);


--
-- Name: tags_entity_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_entity_name_idx ON public.tags USING btree (entity_name);


--
-- Name: tags_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_tags_idx ON public.tags USING gin (tags);


--
-- Name: targets_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targets_tags_idx ON public.targets USING gin (tags);


--
-- Name: targets_target_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targets_target_idx ON public.targets USING btree (target);


--
-- Name: targets_upstream_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targets_upstream_id_idx ON public.targets USING btree (upstream_id);


--
-- Name: ttls_primary_uuid_value_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ttls_primary_uuid_value_idx ON public.ttls USING btree (primary_uuid_value);


--
-- Name: upstreams_fkey_client_certificate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upstreams_fkey_client_certificate ON public.upstreams USING btree (client_certificate_id);


--
-- Name: upstreams_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upstreams_tags_idx ON public.upstreams USING gin (tags);


--
-- Name: vaults_beta_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vaults_beta_tags_idx ON public.vaults_beta USING gin (tags);


--
-- Name: acls acls_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER acls_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.acls FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: basicauth_credentials basicauth_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER basicauth_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.basicauth_credentials FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: ca_certificates ca_certificates_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ca_certificates_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.ca_certificates FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: certificates certificates_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER certificates_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.certificates FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: consumers consumers_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER consumers_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.consumers FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: hmacauth_credentials hmacauth_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER hmacauth_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.hmacauth_credentials FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: jwt_secrets jwtsecrets_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER jwtsecrets_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.jwt_secrets FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: keyauth_credentials keyauth_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER keyauth_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.keyauth_credentials FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: oauth2_credentials oauth2_credentials_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER oauth2_credentials_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.oauth2_credentials FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: plugins plugins_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER plugins_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.plugins FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: routes routes_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER routes_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.routes FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: services services_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER services_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.services FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: snis snis_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER snis_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.snis FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: targets targets_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER targets_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.targets FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: upstreams upstreams_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER upstreams_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.upstreams FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: vaults_beta vaults_beta_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER vaults_beta_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.vaults_beta FOR EACH ROW EXECUTE FUNCTION public.sync_tags();


--
-- Name: acls acls_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: acls acls_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: basicauth_credentials basicauth_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: basicauth_credentials basicauth_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: certificates certificates_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: consumers consumers_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: hmacauth_credentials hmacauth_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: hmacauth_credentials hmacauth_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: jwt_secrets jwt_secrets_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: jwt_secrets jwt_secrets_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: keyauth_credentials keyauth_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: keyauth_credentials keyauth_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_credential_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_credential_id_fkey FOREIGN KEY (credential_id, ws_id) REFERENCES public.oauth2_credentials(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: oauth2_credentials oauth2_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_credentials oauth2_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: oauth2_tokens oauth2_tokens_credential_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_credential_id_fkey FOREIGN KEY (credential_id, ws_id) REFERENCES public.oauth2_credentials(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_tokens oauth2_tokens_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_tokens oauth2_tokens_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: plugins plugins_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: plugins plugins_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_route_id_fkey FOREIGN KEY (route_id, ws_id) REFERENCES public.routes(id, ws_id) ON DELETE CASCADE;


--
-- Name: plugins plugins_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id) ON DELETE CASCADE;


--
-- Name: plugins plugins_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: routes routes_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id);


--
-- Name: routes routes_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: services services_client_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_client_certificate_id_fkey FOREIGN KEY (client_certificate_id, ws_id) REFERENCES public.certificates(id, ws_id);


--
-- Name: services services_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: snis snis_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_certificate_id_fkey FOREIGN KEY (certificate_id, ws_id) REFERENCES public.certificates(id, ws_id);


--
-- Name: snis snis_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: targets targets_upstream_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_upstream_id_fkey FOREIGN KEY (upstream_id, ws_id) REFERENCES public.upstreams(id, ws_id) ON DELETE CASCADE;


--
-- Name: targets targets_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: upstreams upstreams_client_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_client_certificate_id_fkey FOREIGN KEY (client_certificate_id) REFERENCES public.certificates(id);


--
-- Name: upstreams upstreams_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: vaults_beta vaults_beta_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaults_beta
    ADD CONSTRAINT vaults_beta_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
