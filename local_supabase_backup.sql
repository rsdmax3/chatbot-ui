--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Homebrew)

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
-- Name: _analytics; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _analytics;


ALTER SCHEMA _analytics OWNER TO postgres;

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO postgres;

--
-- Name: _supavisor; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _supavisor;


ALTER SCHEMA _supavisor OWNER TO postgres;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: http; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS http WITH SCHEMA extensions;


--
-- Name: EXTENSION http; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION http IS 'HTTP client for PostgreSQL, allows web page retrieval inside the database.';


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA extensions;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: create_duplicate_messages_for_new_chat(uuid, uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO messages (user_id, chat_id, content, role, model, sequence_number, tokens, created_at, updated_at)
    SELECT new_user_id, new_chat_id, content, role, model, sequence_number, tokens, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    FROM messages
    WHERE chat_id = old_chat_id;
END;
$$;


ALTER FUNCTION public.create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid) OWNER TO postgres;

--
-- Name: create_profile_and_workspace(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_profile_and_workspace() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
    random_username TEXT;
BEGIN
    -- Generate a random username
    random_username := 'user' || substr(replace(gen_random_uuid()::text, '-', ''), 1, 16);

    -- Create a profile for the new user
    INSERT INTO public.profiles(user_id, anthropic_api_key, azure_openai_35_turbo_id, azure_openai_45_turbo_id, azure_openai_45_vision_id, azure_openai_api_key, azure_openai_endpoint, google_gemini_api_key, has_onboarded, image_url, image_path, mistral_api_key, display_name, bio, openai_api_key, openai_organization_id, perplexity_api_key, profile_context, use_azure_openai, username)
    VALUES(
        NEW.id,
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        FALSE,
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        FALSE,
        random_username
    );

    INSERT INTO public.workspaces(user_id, is_home, name, default_context_length, default_model, default_prompt, default_temperature, description, embeddings_provider, include_profile_context, include_workspace_instructions, instructions)
    VALUES(
        NEW.id,
        TRUE,
        'Home',
        4096,
        'anthropic.claude-3-5-sonnet-20240620-v1:0', -- Updated default model
        'You are a friendly, helpful AI assistant.',
        0.5,
        'My home workspace.',
        'openai',
        TRUE,
        TRUE,
        ''
    );

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.create_profile_and_workspace() OWNER TO postgres;

--
-- Name: delete_message_including_and_after(uuid, uuid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM messages 
    WHERE user_id = p_user_id AND chat_id = p_chat_id AND sequence_number >= p_sequence_number;
END;
$$;


ALTER FUNCTION public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) OWNER TO postgres;

--
-- Name: delete_messages_including_and_after(uuid, uuid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM messages 
    WHERE user_id = p_user_id AND chat_id = p_chat_id AND sequence_number >= p_sequence_number;
END;
$$;


ALTER FUNCTION public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) OWNER TO postgres;

--
-- Name: delete_old_assistant_image(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_old_assistant_image() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  status INT;
  content TEXT;
BEGIN
  IF TG_OP = 'DELETE' THEN
    SELECT
      INTO status, content
      result.status, result.content
      FROM public.delete_storage_object_from_bucket('assistant_images', OLD.image_path) AS result;
    IF status <> 200 THEN
      RAISE WARNING 'Could not delete assistant image: % %', status, content;
    END IF;
  END IF;
  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.delete_old_assistant_image() OWNER TO postgres;

--
-- Name: delete_old_file(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_old_file() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  status INT;
  content TEXT;
BEGIN
  IF TG_OP = 'DELETE' THEN
    SELECT
      INTO status, content
      result.status, result.content
      FROM public.delete_storage_object_from_bucket('files', OLD.file_path) AS result;
    IF status <> 200 THEN
      RAISE WARNING 'Could not delete file: % %', status, content;
    END IF;
  END IF;
  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.delete_old_file() OWNER TO postgres;

--
-- Name: delete_old_message_images(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_old_message_images() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  status INT;
  content TEXT;
  image_path TEXT;
BEGIN
  IF TG_OP = 'DELETE' THEN
    FOREACH image_path IN ARRAY OLD.image_paths
    LOOP
      SELECT
        INTO status, content
        result.status, result.content
        FROM public.delete_storage_object_from_bucket('message_images', image_path) AS result;
      IF status <> 200 THEN
        RAISE WARNING 'Could not delete message image: % %', status, content;
      END IF;
    END LOOP;
  END IF;
  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.delete_old_message_images() OWNER TO postgres;

--
-- Name: delete_old_profile_image(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_old_profile_image() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  status INT;
  content TEXT;
BEGIN
  IF TG_OP = 'DELETE' THEN
    SELECT
      INTO status, content
      result.status, result.content
      FROM public.delete_storage_object_from_bucket('profile_images', OLD.image_path) AS result;
    IF status <> 200 THEN
      RAISE WARNING 'Could not delete profile image: % %', status, content;
    END IF;
  END IF;
  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.delete_old_profile_image() OWNER TO postgres;

--
-- Name: delete_old_workspace_image(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_old_workspace_image() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  status INT;
  content TEXT;
BEGIN
  IF TG_OP = 'DELETE' THEN
    SELECT
      INTO status, content
      result.status, result.content
      FROM public.delete_storage_object_from_bucket('workspace_images', OLD.image_path) AS result;
    IF status <> 200 THEN
      RAISE WARNING 'Could not delete workspace image: % %', status, content;
    END IF;
  END IF;
  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.delete_old_workspace_image() OWNER TO postgres;

--
-- Name: delete_storage_object(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_storage_object(bucket text, object text, OUT status integer, OUT content text) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  project_url TEXT := 'http://supabase_kong_chatbotui:8000';
  service_role_key TEXT := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU'; -- full access needed for http request to storage
  url TEXT := project_url || '/storage/v1/object/' || bucket || '/' || object;
BEGIN
  SELECT
      INTO status, content
           result.status::INT, result.content::TEXT
      FROM extensions.http((
    'DELETE',
    url,
    ARRAY[extensions.http_header('authorization','Bearer ' || service_role_key)],
    NULL,
    NULL)::extensions.http_request) AS result;
END;
$$;


ALTER FUNCTION public.delete_storage_object(bucket text, object text, OUT status integer, OUT content text) OWNER TO postgres;

--
-- Name: delete_storage_object_from_bucket(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  SELECT
      INTO status, content
           result.status, result.content
      FROM public.delete_storage_object(bucket_name, object_path) AS result;
END;
$$;


ALTER FUNCTION public.delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text) OWNER TO postgres;

--
-- Name: match_file_items_local(extensions.vector, integer, uuid[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.match_file_items_local(query_embedding extensions.vector, match_count integer DEFAULT NULL::integer, file_ids uuid[] DEFAULT NULL::uuid[]) RETURNS TABLE(id uuid, file_id uuid, content text, tokens integer, similarity double precision)
    LANGUAGE plpgsql
    AS $$
#variable_conflict use_column
begin
  return query
  select
    id,
    file_id,
    content,
    tokens,
    1 - (file_items.local_embedding <=> query_embedding) as similarity
  from file_items
  where (file_id = ANY(file_ids))
  order by file_items.local_embedding <=> query_embedding
  limit match_count;
end;
$$;


ALTER FUNCTION public.match_file_items_local(query_embedding extensions.vector, match_count integer, file_ids uuid[]) OWNER TO postgres;

--
-- Name: match_file_items_openai(extensions.vector, integer, uuid[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.match_file_items_openai(query_embedding extensions.vector, match_count integer DEFAULT NULL::integer, file_ids uuid[] DEFAULT NULL::uuid[]) RETURNS TABLE(id uuid, file_id uuid, content text, tokens integer, similarity double precision)
    LANGUAGE plpgsql
    AS $$
#variable_conflict use_column
begin
  return query
  select
    id,
    file_id,
    content,
    tokens,
    1 - (file_items.openai_embedding <=> query_embedding) as similarity
  from file_items
  where (file_id = ANY(file_ids))
  order by file_items.openai_embedding <=> query_embedding
  limit match_count;
end;
$$;


ALTER FUNCTION public.match_file_items_openai(query_embedding extensions.vector, match_count integer, file_ids uuid[]) OWNER TO postgres;

--
-- Name: non_private_assistant_exists(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.non_private_assistant_exists(p_name text) RETURNS boolean
    LANGUAGE sql SECURITY DEFINER
    AS $$
    SELECT EXISTS (
        SELECT 1
        FROM assistants
        WHERE (id::text = (storage.filename(p_name))) AND sharing <> 'private'
    );
$$;


ALTER FUNCTION public.non_private_assistant_exists(p_name text) OWNER TO postgres;

--
-- Name: non_private_file_exists(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.non_private_file_exists(p_name text) RETURNS boolean
    LANGUAGE sql SECURITY DEFINER
    AS $$
    SELECT EXISTS (
        SELECT 1
        FROM files
        WHERE (id::text = (storage.foldername(p_name))[2]) AND sharing <> 'private'
    );
$$;


ALTER FUNCTION public.non_private_file_exists(p_name text) OWNER TO postgres;

--
-- Name: non_private_workspace_exists(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.non_private_workspace_exists(p_name text) RETURNS boolean
    LANGUAGE sql SECURITY DEFINER
    AS $$
    SELECT EXISTS (
        SELECT 1
        FROM workspaces
        WHERE (id::text = (storage.filename(p_name))) AND sharing <> 'private'
    );
$$;


ALTER FUNCTION public.non_private_workspace_exists(p_name text) OWNER TO postgres;

--
-- Name: prevent_home_field_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.prevent_home_field_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.is_home IS DISTINCT FROM OLD.is_home THEN
    RAISE EXCEPTION 'Updating the home field of workspace is not allowed.';
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.prevent_home_field_update() OWNER TO postgres;

--
-- Name: prevent_home_workspace_deletion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.prevent_home_workspace_deletion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF OLD.is_home THEN
    RAISE EXCEPTION 'Home workspace deletion is not allowed.';
  END IF;
  
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.prevent_home_workspace_deletion() OWNER TO postgres;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now(); 
    RETURN NEW; 
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or action = 'DELETE'
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
  DECLARE
    request_id bigint;
    payload jsonb;
    url text := TG_ARGV[0]::text;
    method text := TG_ARGV[1]::text;
    headers jsonb DEFAULT '{}'::jsonb;
    params jsonb DEFAULT '{}'::jsonb;
    timeout_ms integer DEFAULT 1000;
  BEGIN
    IF url IS NULL OR url = 'null' THEN
      RAISE EXCEPTION 'url argument is missing';
    END IF;

    IF method IS NULL OR method = 'null' THEN
      RAISE EXCEPTION 'method argument is missing';
    END IF;

    IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
      headers = '{"Content-Type": "application/json"}'::jsonb;
    ELSE
      headers = TG_ARGV[2]::jsonb;
    END IF;

    IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
      params = '{}'::jsonb;
    ELSE
      params = TG_ARGV[3]::jsonb;
    END IF;

    IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
      timeout_ms = 1000;
    ELSE
      timeout_ms = TG_ARGV[4]::integer;
    END IF;

    CASE
      WHEN method = 'GET' THEN
        SELECT http_get INTO request_id FROM net.http_get(
          url,
          params,
          headers,
          timeout_ms
        );
      WHEN method = 'POST' THEN
        payload = jsonb_build_object(
          'old_record', OLD,
          'record', NEW,
          'type', TG_OP,
          'table', TG_TABLE_NAME,
          'schema', TG_TABLE_SCHEMA
        );

        SELECT http_post INTO request_id FROM net.http_post(
          url,
          payload,
          params,
          headers,
          timeout_ms
        );
      ELSE
        RAISE EXCEPTION 'method argument % is invalid', method;
    END CASE;

    INSERT INTO supabase_functions.hooks
      (hook_table_id, hook_name, request_id)
    VALUES
      (TG_RELID, TG_NAME, request_id);

    RETURN NEW;
  END
$$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: assistant_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistant_collections (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.assistant_collections OWNER TO postgres;

--
-- Name: assistant_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistant_files (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    file_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.assistant_files OWNER TO postgres;

--
-- Name: assistant_tools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistant_tools (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    tool_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.assistant_tools OWNER TO postgres;

--
-- Name: assistant_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistant_workspaces (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.assistant_workspaces OWNER TO postgres;

--
-- Name: assistants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistants (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    context_length integer NOT NULL,
    description text NOT NULL,
    embeddings_provider text NOT NULL,
    include_profile_context boolean NOT NULL,
    include_workspace_instructions boolean NOT NULL,
    model text NOT NULL,
    name text NOT NULL,
    image_path text NOT NULL,
    prompt text NOT NULL,
    temperature real NOT NULL,
    CONSTRAINT assistants_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT assistants_embeddings_provider_check CHECK ((char_length(embeddings_provider) <= 1000)),
    CONSTRAINT assistants_image_path_check CHECK ((char_length(image_path) <= 1000)),
    CONSTRAINT assistants_model_check CHECK ((char_length(model) <= 1000)),
    CONSTRAINT assistants_name_check CHECK ((char_length(name) <= 100)),
    CONSTRAINT assistants_prompt_check CHECK ((char_length(prompt) <= 100000))
);


ALTER TABLE public.assistants OWNER TO postgres;

--
-- Name: chat_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_files (
    user_id uuid NOT NULL,
    chat_id uuid NOT NULL,
    file_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.chat_files OWNER TO postgres;

--
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    assistant_id uuid,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    context_length integer NOT NULL,
    embeddings_provider text NOT NULL,
    include_profile_context boolean NOT NULL,
    include_workspace_instructions boolean NOT NULL,
    model text NOT NULL,
    name text NOT NULL,
    prompt text NOT NULL,
    temperature real NOT NULL,
    CONSTRAINT chats_embeddings_provider_check CHECK ((char_length(embeddings_provider) <= 1000)),
    CONSTRAINT chats_model_check CHECK ((char_length(model) <= 1000)),
    CONSTRAINT chats_name_check CHECK ((char_length(name) <= 200)),
    CONSTRAINT chats_prompt_check CHECK ((char_length(prompt) <= 100000))
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- Name: collection_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_files (
    user_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    file_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.collection_files OWNER TO postgres;

--
-- Name: collection_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_workspaces (
    user_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.collection_workspaces OWNER TO postgres;

--
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    description text NOT NULL,
    name text NOT NULL,
    CONSTRAINT collections_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT collections_name_check CHECK ((char_length(name) <= 100))
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- Name: file_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_items (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    file_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    content text NOT NULL,
    local_embedding extensions.vector(384),
    openai_embedding extensions.vector(1536),
    tokens integer NOT NULL
);


ALTER TABLE public.file_items OWNER TO postgres;

--
-- Name: file_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_workspaces (
    user_id uuid NOT NULL,
    file_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.file_workspaces OWNER TO postgres;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    description text NOT NULL,
    file_path text NOT NULL,
    name text NOT NULL,
    size integer NOT NULL,
    tokens integer NOT NULL,
    type text NOT NULL,
    CONSTRAINT files_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT files_file_path_check CHECK ((char_length(file_path) <= 1000)),
    CONSTRAINT files_name_check CHECK ((char_length(name) <= 100)),
    CONSTRAINT files_type_check CHECK ((char_length(type) <= 100))
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.folders (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    name text NOT NULL,
    description text NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.folders OWNER TO postgres;

--
-- Name: message_file_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_file_items (
    user_id uuid NOT NULL,
    message_id uuid NOT NULL,
    file_item_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.message_file_items OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    chat_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    content text NOT NULL,
    image_paths text[] NOT NULL,
    model text NOT NULL,
    role text NOT NULL,
    sequence_number integer NOT NULL,
    assistant_id uuid,
    CONSTRAINT check_image_paths_length CHECK ((array_length(image_paths, 1) <= 16)),
    CONSTRAINT messages_content_check CHECK ((char_length(content) <= 1000000)),
    CONSTRAINT messages_model_check CHECK ((char_length(model) <= 1000)),
    CONSTRAINT messages_role_check CHECK ((char_length(role) <= 1000))
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: model_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_workspaces (
    user_id uuid NOT NULL,
    model_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.model_workspaces OWNER TO postgres;

--
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    api_key text NOT NULL,
    base_url text NOT NULL,
    description text NOT NULL,
    model_id text NOT NULL,
    name text NOT NULL,
    context_length integer DEFAULT 4096 NOT NULL,
    CONSTRAINT models_api_key_check CHECK ((char_length(api_key) <= 1000)),
    CONSTRAINT models_base_url_check CHECK ((char_length(base_url) <= 1000)),
    CONSTRAINT models_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT models_model_id_check CHECK ((char_length(model_id) <= 1000)),
    CONSTRAINT models_name_check CHECK ((char_length(name) <= 100))
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: preset_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preset_workspaces (
    user_id uuid NOT NULL,
    preset_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.preset_workspaces OWNER TO postgres;

--
-- Name: presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presets (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    context_length integer NOT NULL,
    description text NOT NULL,
    embeddings_provider text NOT NULL,
    include_profile_context boolean NOT NULL,
    include_workspace_instructions boolean NOT NULL,
    model text NOT NULL,
    name text NOT NULL,
    prompt text NOT NULL,
    temperature real NOT NULL,
    CONSTRAINT presets_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT presets_embeddings_provider_check CHECK ((char_length(embeddings_provider) <= 1000)),
    CONSTRAINT presets_model_check CHECK ((char_length(model) <= 1000)),
    CONSTRAINT presets_name_check CHECK ((char_length(name) <= 100)),
    CONSTRAINT presets_prompt_check CHECK ((char_length(prompt) <= 100000))
);


ALTER TABLE public.presets OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    bio text NOT NULL,
    has_onboarded boolean DEFAULT false NOT NULL,
    image_url text NOT NULL,
    image_path text NOT NULL,
    profile_context text NOT NULL,
    display_name text NOT NULL,
    use_azure_openai boolean NOT NULL,
    username text NOT NULL,
    anthropic_api_key text,
    azure_openai_35_turbo_id text,
    azure_openai_45_turbo_id text,
    azure_openai_45_vision_id text,
    azure_openai_api_key text,
    azure_openai_endpoint text,
    google_gemini_api_key text,
    mistral_api_key text,
    openai_api_key text,
    openai_organization_id text,
    perplexity_api_key text,
    openrouter_api_key text,
    azure_openai_embeddings_id text,
    groq_api_key text,
    CONSTRAINT profiles_anthropic_api_key_check CHECK ((char_length(anthropic_api_key) <= 1000)),
    CONSTRAINT profiles_azure_openai_35_turbo_id_check CHECK ((char_length(azure_openai_35_turbo_id) <= 1000)),
    CONSTRAINT profiles_azure_openai_45_turbo_id_check CHECK ((char_length(azure_openai_45_turbo_id) <= 1000)),
    CONSTRAINT profiles_azure_openai_45_vision_id_check CHECK ((char_length(azure_openai_45_vision_id) <= 1000)),
    CONSTRAINT profiles_azure_openai_api_key_check CHECK ((char_length(azure_openai_api_key) <= 1000)),
    CONSTRAINT profiles_azure_openai_embeddings_id_check CHECK ((char_length(azure_openai_embeddings_id) <= 1000)),
    CONSTRAINT profiles_azure_openai_endpoint_check CHECK ((char_length(azure_openai_endpoint) <= 1000)),
    CONSTRAINT profiles_bio_check CHECK ((char_length(bio) <= 500)),
    CONSTRAINT profiles_display_name_check CHECK ((char_length(display_name) <= 100)),
    CONSTRAINT profiles_google_gemini_api_key_check CHECK ((char_length(google_gemini_api_key) <= 1000)),
    CONSTRAINT profiles_groq_api_key_check CHECK ((char_length(groq_api_key) <= 1000)),
    CONSTRAINT profiles_image_path_check CHECK ((char_length(image_path) <= 1000)),
    CONSTRAINT profiles_image_url_check CHECK ((char_length(image_url) <= 1000)),
    CONSTRAINT profiles_mistral_api_key_check CHECK ((char_length(mistral_api_key) <= 1000)),
    CONSTRAINT profiles_openai_api_key_check CHECK ((char_length(openai_api_key) <= 1000)),
    CONSTRAINT profiles_openai_organization_id_check CHECK ((char_length(openai_organization_id) <= 1000)),
    CONSTRAINT profiles_openrouter_api_key_check CHECK ((char_length(openrouter_api_key) <= 1000)),
    CONSTRAINT profiles_perplexity_api_key_check CHECK ((char_length(perplexity_api_key) <= 1000)),
    CONSTRAINT profiles_profile_context_check CHECK ((char_length(profile_context) <= 1500)),
    CONSTRAINT profiles_username_check CHECK (((char_length(username) >= 3) AND (char_length(username) <= 25)))
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: prompt_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prompt_workspaces (
    user_id uuid NOT NULL,
    prompt_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.prompt_workspaces OWNER TO postgres;

--
-- Name: prompts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prompts (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    content text NOT NULL,
    name text NOT NULL,
    CONSTRAINT prompts_content_check CHECK ((char_length(content) <= 100000)),
    CONSTRAINT prompts_name_check CHECK ((char_length(name) <= 100))
);


ALTER TABLE public.prompts OWNER TO postgres;

--
-- Name: tool_workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tool_workspaces (
    user_id uuid NOT NULL,
    tool_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.tool_workspaces OWNER TO postgres;

--
-- Name: tools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tools (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    folder_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    description text NOT NULL,
    name text NOT NULL,
    schema jsonb DEFAULT '{}'::jsonb NOT NULL,
    url text NOT NULL,
    custom_headers jsonb DEFAULT '{}'::jsonb NOT NULL,
    CONSTRAINT tools_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT tools_name_check CHECK ((char_length(name) <= 100)),
    CONSTRAINT tools_url_check CHECK ((char_length(url) <= 1000))
);


ALTER TABLE public.tools OWNER TO postgres;

--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workspaces (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone,
    sharing text DEFAULT 'private'::text NOT NULL,
    default_context_length integer NOT NULL,
    default_model text NOT NULL,
    default_prompt text NOT NULL,
    default_temperature real NOT NULL,
    description text NOT NULL,
    embeddings_provider text NOT NULL,
    include_profile_context boolean NOT NULL,
    include_workspace_instructions boolean NOT NULL,
    instructions text NOT NULL,
    is_home boolean DEFAULT false NOT NULL,
    name text NOT NULL,
    image_path text DEFAULT ''::text NOT NULL,
    CONSTRAINT workspaces_default_model_check CHECK ((char_length(default_model) <= 1000)),
    CONSTRAINT workspaces_default_prompt_check CHECK ((char_length(default_prompt) <= 100000)),
    CONSTRAINT workspaces_description_check CHECK ((char_length(description) <= 500)),
    CONSTRAINT workspaces_embeddings_provider_check CHECK ((char_length(embeddings_provider) <= 1000)),
    CONSTRAINT workspaces_image_path_check CHECK ((char_length(image_path) <= 1000)),
    CONSTRAINT workspaces_instructions_check CHECK ((char_length(instructions) <= 1500)),
    CONSTRAINT workspaces_name_check CHECK ((char_length(name) <= 100))
);


ALTER TABLE public.workspaces OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtime.messages_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER TABLE vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
543c1c3c-d261-4992-bfb2-c49cbc599a5f	postgres_cdc_rls	{"region": "us-east-1", "db_host": "y5EcfJ3m9TqyMR1Xd0fWRJyrV7flSHLpo0VWz1Cc/2k=", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "+enMDFi1J/3IrrquHHwUmA==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "sWBpZNdjggEPTQVlI52Zfw==", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2024-08-07 18:33:33	2024-08-07 18:33:33
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2024-08-07 18:33:29
20220329161857	2024-08-07 18:33:29
20220410212326	2024-08-07 18:33:29
20220506102948	2024-08-07 18:33:29
20220527210857	2024-08-07 18:33:29
20220815211129	2024-08-07 18:33:29
20220815215024	2024-08-07 18:33:29
20220818141501	2024-08-07 18:33:29
20221018173709	2024-08-07 18:33:29
20221102172703	2024-08-07 18:33:29
20221223010058	2024-08-07 18:33:29
20230110180046	2024-08-07 18:33:29
20230810220907	2024-08-07 18:33:29
20230810220924	2024-08-07 18:33:29
20231024094642	2024-08-07 18:33:29
20240306114423	2024-08-07 18:33:29
20240418082835	2024-08-07 18:33:29
20240625211759	2024-08-07 18:33:29
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks) FROM stdin;
a8a608ce-8cf7-4fc9-8f77-71b30609f3d2	realtime-dev	realtime-dev	iNjicxc4+llvc9wovDvqymwfnj9teWMlyOIbJ8Fh6j2WNU8CIJ2ZgjR6MUIKqSmeDmvpsKLsZ9jgXJmQPpwL8w==	200	2024-08-07 18:33:33	2024-08-07 18:33:33	100	postgres_cdc_rls	100000	100	100	f	\N
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	5ed80451-8d3e-43dc-97ec-9d0b1b89c186	{"action":"user_signedup","actor_id":"3062b58b-4812-4afc-a7e2-9e798456626d","actor_username":"ryandonofrio3@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-08-07 18:34:29.4173+00	
00000000-0000-0000-0000-000000000000	c0582743-efc2-4259-b96f-a3a9523185e4	{"action":"login","actor_id":"3062b58b-4812-4afc-a7e2-9e798456626d","actor_username":"ryandonofrio3@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-07 18:34:29.418928+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
3062b58b-4812-4afc-a7e2-9e798456626d	3062b58b-4812-4afc-a7e2-9e798456626d	{"sub": "3062b58b-4812-4afc-a7e2-9e798456626d", "email": "ryandonofrio3@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-08-07 18:34:29.415854+00	2024-08-07 18:34:29.415876+00	2024-08-07 18:34:29.415876+00	b9ca8996-ef5b-43bc-90ec-6030bc937ada
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
a1496e09-d9df-4a92-b36e-d442d148e3b9	2024-08-07 18:34:29.420333+00	2024-08-07 18:34:29.420333+00	password	2204d100-3875-4ce4-99b2-b9a7fe83af11
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	1	wXKCcHhxDb_mT2CUupHTmA	3062b58b-4812-4afc-a7e2-9e798456626d	f	2024-08-07 18:34:29.419694+00	2024-08-07 18:34:29.419694+00	\N	a1496e09-d9df-4a92-b36e-d442d148e3b9
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
a1496e09-d9df-4a92-b36e-d442d148e3b9	3062b58b-4812-4afc-a7e2-9e798456626d	2024-08-07 18:34:29.419206+00	2024-08-07 18:34:29.419206+00	\N	aal1	\N	\N	node	192.168.65.1	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	authenticated	authenticated	test@test.com	$2a$06$wulthq2GdTD1imVjf1ZiKuEAfhOGLEtKwH5IFUgkhNNwMHvg8LFc2	2023-02-18 23:31:13.017218+00	\N		2023-02-18 23:31:12.757017+00		\N			\N	2023-02-18 23:31:13.01781+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-02-18 23:31:12.752281+00	2023-02-18 23:31:13.019418+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3062b58b-4812-4afc-a7e2-9e798456626d	authenticated	authenticated	ryandonofrio3@gmail.com	$2a$10$FlNMSQAbv0U4umifThDiPuaaMecWUJbyvzn.OPvKl9a7gNsfIT9jG	2024-08-07 18:34:29.417773+00	\N		\N		\N			\N	2024-08-07 18:34:29.419177+00	{"provider": "email", "providers": ["email"]}	{"sub": "3062b58b-4812-4afc-a7e2-9e798456626d", "email": "ryandonofrio3@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-08-07 18:34:29.412937+00	2024-08-07 18:34:29.4202+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: assistant_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistant_collections (user_id, assistant_id, collection_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assistant_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistant_files (user_id, assistant_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assistant_tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistant_tools (user_id, assistant_id, tool_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assistant_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistant_workspaces (user_id, assistant_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	49be665a-603b-4c59-a165-8e41e7d440e9	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: assistants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistants (id, user_id, folder_id, created_at, updated_at, sharing, context_length, description, embeddings_provider, include_profile_context, include_workspace_instructions, model, name, image_path, prompt, temperature) FROM stdin;
49be665a-603b-4c59-a165-8e41e7d440e9	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	\N	private	4000	This is an Albert Einstein assistant.	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Albert Einstein		You are Albert Einstein.	0.5
\.


--
-- Data for Name: chat_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_files (user_id, chat_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, user_id, workspace_id, assistant_id, folder_id, created_at, updated_at, sharing, context_length, embeddings_provider, include_profile_context, include_workspace_instructions, model, name, prompt, temperature) FROM stdin;
2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	e87480d3-eca9-4350-9989-f4da7dbcb127	\N	\N	2024-08-07 18:33:31.46209+00	\N	private	4000	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Chat 1	You are an assistant.	0.5
2cf723e5-13c4-44e9-bca0-cdf4c374e054	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	e87480d3-eca9-4350-9989-f4da7dbcb127	\N	6541804d-0585-4f38-9e63-e65c2575fbbe	2024-08-07 18:33:31.46209+00	\N	private	4000	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Chat 4	You are an assistant.	0.5
\.


--
-- Data for Name: collection_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_files (user_id, collection_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: collection_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_workspaces (user_id, collection_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	d7a72b05-8e9a-4834-964b-55d557f13554	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (id, user_id, folder_id, created_at, updated_at, sharing, description, name) FROM stdin;
d7a72b05-8e9a-4834-964b-55d557f13554	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	This is a description for Collection 1	Collection 1
\.


--
-- Data for Name: file_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.file_items (id, file_id, user_id, created_at, updated_at, sharing, content, local_embedding, openai_embedding, tokens) FROM stdin;
\.


--
-- Data for Name: file_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.file_workspaces (user_id, file_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	9d3fa05e-a151-4af2-98e5-7899042d8a2c	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, user_id, folder_id, created_at, updated_at, sharing, description, file_path, name, size, tokens, type) FROM stdin;
9d3fa05e-a151-4af2-98e5-7899042d8a2c	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	\N	private	This is a file for testing	https://example.com/file1	File 1	1000000	250	pdf
\.


--
-- Data for Name: folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.folders (id, user_id, workspace_id, created_at, updated_at, name, description, type) FROM stdin;
6541804d-0585-4f38-9e63-e65c2575fbbe	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N	Chat Folder 1	This is a folder for chats	chats
\.


--
-- Data for Name: message_file_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_file_items (user_id, message_id, file_item_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, chat_id, user_id, created_at, updated_at, content, image_paths, model, role, sequence_number, assistant_id) FROM stdin;
0afc9b97-3570-41f6-9b39-79b62b1c5582	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	Hello! This is a long message with **markdown**. It contains multiple sentences and paragraphs. Let me add more content to this message. I am a user interacting with an AI assistant. I can ask the assistant to perform various tasks, such as generating text, answering questions, and even writing code. The assistant uses a powerful language model to understand my requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	user	0	\N
bb4b5f31-ff45-4c62-bbf6-effb0c2d5dec	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	How are you? This is another long message with *italic markdown*. It also contains multiple sentences and paragraphs. Let me add more content to this message. As an AI assistant, I can understand and respond to a wide range of requests. I can generate text, answer questions, and even write code. I use a powerful language model to understand your requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	assistant	1	\N
70a88f5e-7f58-43d5-bc62-281a81685f93	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	I am fine, thank you! This is a third long message with [link markdown](http://example.com). It contains even more sentences and paragraphs. Let me add even more content to this message. As a user, I can interact with the AI assistant in a variety of ways. I can ask it to generate text, answer questions, and even write code. The assistant uses a powerful language model to understand my requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	user	2	\N
c0adee02-5b69-4e5e-8242-e3a184147e35	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	Great to hear that! This is a fourth long message with `code markdown`. It contains a lot of sentences and paragraphs. Let me add even more content to this message. As an AI assistant, I can understand and respond to a wide range of requests. I can generate text, answer questions, and even write code. I use a powerful language model to understand your requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	assistant	3	\N
54df69c9-e622-4604-96c0-3978e224c06f	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	What can you do? This is a fifth long message with > blockquote markdown. It contains a ton of sentences and paragraphs. Let me add even more content to this message. As a user, I can interact with the AI assistant in a variety of ways. I can ask it to generate text, answer questions, and even write code. The assistant uses a powerful language model to understand my requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	user	4	\N
3aafef5f-d07e-42ac-bcb1-4c41e87a2dff	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	I can assist you with various tasks. This is a sixth long message with - list markdown. It contains an enormous amount of sentences and paragraphs. Let me add even more content to this message. As an AI assistant, I can understand and respond to a wide range of requests. I can generate text, answer questions, and even write code. I use a powerful language model to understand your requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	assistant	5	\N
a53f96f9-9057-43c7-832a-fc91a778279a	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	Can you assist me with my homework? This is a seventh long message with 1. numbered list markdown. It contains a plethora of sentences and paragraphs. Let me add even more content to this message. As a user, I can interact with the AI assistant in a variety of ways. I can ask it to generate text, answer questions, and even write code. The assistant uses a powerful language model to understand my requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	user	6	\N
1789f405-de17-4f5a-b689-f751d76ff999	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	Sure, I would be happy to help. What do you need assistance with? This is an eighth long message with --- horizontal rule markdown. It contains a multitude of sentences and paragraphs. Let me add even more content to this message. As an AI assistant, I can understand and respond to a wide range of requests. I can generate text, answer questions, and even write code. I use a powerful language model to understand your requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	assistant	7	\N
a1c84965-6325-4d75-935f-d2db08d66b9f	2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	I need help with my math homework. This is a ninth long message with # heading markdown. It contains a vast number of sentences and paragraphs. Let me add even more content to this message. As a user, I can interact with the AI assistant in a variety of ways. I can ask it to generate text, answer questions, and even write code. The assistant uses a powerful language model to understand my requests and generate appropriate responses. This is a very interesting and exciting technology!	{}	anthropic.claude-3-5-sonnet-20240620-v1:0	user	8	\N
\.


--
-- Data for Name: model_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_workspaces (user_id, model_id, workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.models (id, user_id, folder_id, created_at, updated_at, sharing, api_key, base_url, description, model_id, name, context_length) FROM stdin;
\.


--
-- Data for Name: preset_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preset_workspaces (user_id, preset_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	d20a6912-bbb3-4949-bb31-eba87b179c2d	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presets (id, user_id, folder_id, created_at, updated_at, sharing, context_length, description, embeddings_provider, include_profile_context, include_workspace_instructions, model, name, prompt, temperature) FROM stdin;
d20a6912-bbb3-4949-bb31-eba87b179c2d	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	4000	Description for Preset 1	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Preset 1	Prompt 1	0.5
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, user_id, created_at, updated_at, bio, has_onboarded, image_url, image_path, profile_context, display_name, use_azure_openai, username, anthropic_api_key, azure_openai_35_turbo_id, azure_openai_45_turbo_id, azure_openai_45_vision_id, azure_openai_api_key, azure_openai_endpoint, google_gemini_api_key, mistral_api_key, openai_api_key, openai_organization_id, perplexity_api_key, openrouter_api_key, azure_openai_embeddings_id, groq_api_key) FROM stdin;
27d79441-7b8d-492c-8d39-f3217c49c478	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N		f					f	userb0864775a15f47ea												\N	\N	\N
31843e0c-68ca-42cc-8d8e-af7c70b68a84	3062b58b-4812-4afc-a7e2-9e798456626d	2024-08-07 18:34:29.41269+00	2024-08-07 18:34:34.769151+00		t					f	useree3f95530e0e4f80												\N	\N	\N
\.


--
-- Data for Name: prompt_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prompt_workspaces (user_id, prompt_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	9dc7baf3-2e0e-44cd-8c2b-d049d1ee2b9b	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prompts (id, user_id, folder_id, created_at, updated_at, sharing, content, name) FROM stdin;
9dc7baf3-2e0e-44cd-8c2b-d049d1ee2b9b	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	I want you to act as a storyteller. You will come up with entertaining stories that are engaging, imaginative and captivating for the audience. It can be fairy tales, educational stories or any other type of stories which has the potential to capture people's attention and imagination. Depending on the target audience, you may choose specific themes or topics for your storytelling session e.g., if it’s children then you can talk about animals; If it’s adults then history-based tales might engage them better etc. My first request is 'I need an interesting story on perseverance.'	Storyteller
\.


--
-- Data for Name: tool_workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tool_workspaces (user_id, tool_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	bdfe86ca-3c1d-4147-bbc6-a675a723c9ab	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tools (id, user_id, folder_id, created_at, updated_at, sharing, description, name, schema, url, custom_headers) FROM stdin;
bdfe86ca-3c1d-4147-bbc6-a675a723c9ab	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	This is a description for Tool 1	Tool 1	{}	http://example.com	{}
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workspaces (id, user_id, created_at, updated_at, sharing, default_context_length, default_model, default_prompt, default_temperature, description, embeddings_provider, include_profile_context, include_workspace_instructions, instructions, is_home, name, image_path) FROM stdin;
e87480d3-eca9-4350-9989-f4da7dbcb127	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	private	4096	anthropic.claude-3-5-sonnet-20240620-v1:0	You are a friendly, helpful AI assistant.	0.5	My home workspace.	openai	t	t		t	Home	
fabdc90d-9eaa-4f42-905f-2a5649e33675	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	private	4000	anthropic.claude-3-5-sonnet-20240620-v1:0	You are an assistant.	0.5	This is for testing.	openai	t	t	These are the instructions.	f	Workspace 1	
eaf4630d-acac-471c-84f2-2463ad1865ce	3062b58b-4812-4afc-a7e2-9e798456626d	2024-08-07 18:34:29.41269+00	\N	private	4096	anthropic.claude-3-5-sonnet-20240620-v1:0	You are a friendly, helpful AI assistant.	0.5	My home workspace.	openai	t	t		t	Home	
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-08-07 18:33:30
20211116045059	2024-08-07 18:33:30
20211116050929	2024-08-07 18:33:30
20211116051442	2024-08-07 18:33:30
20211116212300	2024-08-07 18:33:30
20211116213355	2024-08-07 18:33:30
20211116213934	2024-08-07 18:33:30
20211116214523	2024-08-07 18:33:30
20211122062447	2024-08-07 18:33:30
20211124070109	2024-08-07 18:33:30
20211202204204	2024-08-07 18:33:30
20211202204605	2024-08-07 18:33:30
20211210212804	2024-08-07 18:33:30
20211228014915	2024-08-07 18:33:30
20220107221237	2024-08-07 18:33:30
20220228202821	2024-08-07 18:33:30
20220312004840	2024-08-07 18:33:30
20220603231003	2024-08-07 18:33:30
20220603232444	2024-08-07 18:33:30
20220615214548	2024-08-07 18:33:30
20220712093339	2024-08-07 18:33:30
20220908172859	2024-08-07 18:33:30
20220916233421	2024-08-07 18:33:30
20230119133233	2024-08-07 18:33:30
20230128025114	2024-08-07 18:33:30
20230128025212	2024-08-07 18:33:30
20230227211149	2024-08-07 18:33:30
20230228184745	2024-08-07 18:33:30
20230308225145	2024-08-07 18:33:30
20230328144023	2024-08-07 18:33:30
20231018144023	2024-08-07 18:33:30
20231204144023	2024-08-07 18:33:30
20231204144024	2024-08-07 18:33:30
20231204144025	2024-08-07 18:33:30
20240108234812	2024-08-07 18:33:30
20240109165339	2024-08-07 18:33:30
20240227174441	2024-08-07 18:33:30
20240311171622	2024-08-07 18:33:30
20240321100241	2024-08-07 18:33:30
20240401105812	2024-08-07 18:33:30
20240418121054	2024-08-07 18:33:30
20240523004032	2024-08-07 18:33:30
20240618124746	2024-08-07 18:33:30
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
profile_images	profile_images	\N	2024-08-07 18:33:31.330403+00	2024-08-07 18:33:31.330403+00	t	f	\N	\N	\N
files	files	\N	2024-08-07 18:33:31.352008+00	2024-08-07 18:33:31.352008+00	f	f	\N	\N	\N
assistant_images	assistant_images	\N	2024-08-07 18:33:31.374742+00	2024-08-07 18:33:31.374742+00	f	f	\N	\N	\N
message_images	message_images	\N	2024-08-07 18:33:31.388531+00	2024-08-07 18:33:31.388531+00	f	f	\N	\N	\N
workspace_images	workspace_images	\N	2024-08-07 18:33:31.447374+00	2024-08-07 18:33:31.447374+00	f	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-08-07 18:33:30.875275
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-08-07 18:33:30.87652
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-08-07 18:33:30.877188
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-08-07 18:33:30.881069
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-08-07 18:33:30.885999
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-08-07 18:33:30.886948
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-08-07 18:33:30.88797
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-08-07 18:33:30.888903
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-08-07 18:33:30.889521
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-08-07 18:33:30.890153
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-08-07 18:33:30.891034
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-08-07 18:33:30.892064
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-08-07 18:33:30.893135
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-08-07 18:33:30.893839
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-08-07 18:33:30.894454
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-08-07 18:33:30.902944
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-08-07 18:33:30.903792
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-08-07 18:33:30.904311
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-08-07 18:33:30.90502
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-08-07 18:33:30.905912
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-08-07 18:33:30.906708
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-08-07 18:33:30.908656
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-08-07 18:33:30.916743
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-08-07 18:33:30.921324
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2024-08-07 18:33:19.582844+00
20210809183423_update_grants	2024-08-07 18:33:19.582844+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
20240108234540	{"-- Enable HTTP extension\ncreate extension http with schema extensions","-- Enable vector extension\ncreate extension vector with schema extensions","-- Function to update modified column\nCREATE OR REPLACE FUNCTION update_updated_at_column()\nRETURNS TRIGGER AS $$\nBEGIN\n    NEW.updated_at = now(); \n    RETURN NEW; \nEND;\n$$ language 'plpgsql'","-- Function to delete a message and all following messages\nCREATE OR REPLACE FUNCTION delete_message_including_and_after(\n    p_user_id UUID, \n    p_chat_id UUID, \n    p_sequence_number INT\n)\nRETURNS VOID AS $$\nBEGIN\n    DELETE FROM messages \n    WHERE user_id = p_user_id AND chat_id = p_chat_id AND sequence_number >= p_sequence_number;\nEND;\n$$ LANGUAGE plpgsql","-- Function to create duplicate messages for a new chat\nCREATE OR REPLACE FUNCTION create_duplicate_messages_for_new_chat(old_chat_id UUID, new_chat_id UUID, new_user_id UUID)\nRETURNS VOID AS $$\nBEGIN\n    INSERT INTO messages (user_id, chat_id, content, role, model, sequence_number, tokens, created_at, updated_at)\n    SELECT new_user_id, new_chat_id, content, role, model, sequence_number, tokens, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP\n    FROM messages\n    WHERE chat_id = old_chat_id;\nEND;\n$$ LANGUAGE plpgsql","-- Policy to allow users to read their own files\nCREATE POLICY \\"Allow users to read their own files\\"\nON storage.objects FOR SELECT\nTO authenticated\nUSING (auth.uid()::text = owner_id::text)","-- Function to delete a storage object\nCREATE OR REPLACE FUNCTION delete_storage_object(bucket TEXT, object TEXT, OUT status INT, OUT content TEXT)\nRETURNS RECORD\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nDECLARE\n  project_url TEXT := 'http://supabase_kong_chatbotui:8000';\n  service_role_key TEXT := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU'; -- full access needed for http request to storage\n  url TEXT := project_url || '/storage/v1/object/' || bucket || '/' || object;\nBEGIN\n  SELECT\n      INTO status, content\n           result.status::INT, result.content::TEXT\n      FROM extensions.http((\n    'DELETE',\n    url,\n    ARRAY[extensions.http_header('authorization','Bearer ' || service_role_key)],\n    NULL,\n    NULL)::extensions.http_request) AS result;\nEND;\n$$","-- Function to delete a storage object from a bucket\nCREATE OR REPLACE FUNCTION delete_storage_object_from_bucket(bucket_name TEXT, object_path TEXT, OUT status INT, OUT content TEXT)\nRETURNS RECORD\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nBEGIN\n  SELECT\n      INTO status, content\n           result.status, result.content\n      FROM public.delete_storage_object(bucket_name, object_path) AS result;\nEND;\n$$"}	setup
20240108234541	{"--------------- PROFILES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS profiles (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- RELATIONSHIPS\n    user_id UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- REQUIRED\n    bio TEXT NOT NULL CHECK (char_length(bio) <= 500),\n    has_onboarded BOOLEAN NOT NULL DEFAULT FALSE,\n    image_url TEXT NOT NULL CHECK (char_length(image_url) <= 1000), -- public file url in profile_images bucket\n    image_path TEXT NOT NULL CHECK (char_length(image_path) <= 1000), -- file path in profile_images bucket\n    profile_context TEXT NOT NULL CHECK (char_length(profile_context) <= 1500),\n    display_name TEXT NOT NULL CHECK (char_length(display_name) <= 100),\n    use_azure_openai BOOLEAN NOT NULL,\n    username TEXT NOT NULL UNIQUE CHECK (char_length(username) >= 3 AND char_length(username) <= 25),\n\n    -- OPTIONAL\n    anthropic_api_key TEXT CHECK (char_length(anthropic_api_key) <= 1000),\n    azure_openai_35_turbo_id TEXT CHECK (char_length(azure_openai_35_turbo_id) <= 1000),\n    azure_openai_45_turbo_id TEXT CHECK (char_length(azure_openai_45_turbo_id) <= 1000),\n    azure_openai_45_vision_id TEXT CHECK (char_length(azure_openai_45_vision_id) <= 1000),\n    azure_openai_api_key TEXT CHECK (char_length(azure_openai_api_key) <= 1000),\n    azure_openai_endpoint TEXT CHECK (char_length(azure_openai_endpoint) <= 1000),\n    google_gemini_api_key TEXT CHECK (char_length(google_gemini_api_key) <= 1000),\n    mistral_api_key TEXT CHECK (char_length(mistral_api_key) <= 1000),\n    openai_api_key TEXT CHECK (char_length(openai_api_key) <= 1000),\n    openai_organization_id TEXT CHECK (char_length(openai_organization_id) <= 1000),\n    perplexity_api_key TEXT CHECK (char_length(perplexity_api_key) <= 1000)\n)","-- INDEXES --\n\nCREATE INDEX idx_profiles_user_id ON profiles (user_id)","-- RLS --\n\nALTER TABLE profiles ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own profiles\\"\n    ON profiles\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- FUNCTIONS --\n\nCREATE OR REPLACE FUNCTION delete_old_profile_image()\nRETURNS TRIGGER\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nDECLARE\n  status INT;\n  content TEXT;\nBEGIN\n  IF TG_OP = 'DELETE' THEN\n    SELECT\n      INTO status, content\n      result.status, result.content\n      FROM public.delete_storage_object_from_bucket('profile_images', OLD.image_path) AS result;\n    IF status <> 200 THEN\n      RAISE WARNING 'Could not delete profile image: % %', status, content;\n    END IF;\n  END IF;\n  IF TG_OP = 'DELETE' THEN\n    RETURN OLD;\n  END IF;\n  RETURN NEW;\nEND;\n$$","-- TRIGGERS --\n\nCREATE TRIGGER update_profiles_updated_at\nBEFORE UPDATE ON profiles\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","CREATE OR REPLACE FUNCTION create_profile_and_workspace() \nRETURNS TRIGGER\nsecurity definer set search_path = public\nAS $$\nDECLARE\n    random_username TEXT;\nBEGIN\n    -- Generate a random username\n    random_username := 'user' || substr(replace(gen_random_uuid()::text, '-', ''), 1, 16);\n\n    -- Create a profile for the new user\n    INSERT INTO public.profiles(user_id, anthropic_api_key, azure_openai_35_turbo_id, azure_openai_45_turbo_id, azure_openai_45_vision_id, azure_openai_api_key, azure_openai_endpoint, google_gemini_api_key, has_onboarded, image_url, image_path, mistral_api_key, display_name, bio, openai_api_key, openai_organization_id, perplexity_api_key, profile_context, use_azure_openai, username)\n    VALUES(\n        NEW.id,\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        FALSE,\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        FALSE,\n        random_username\n    );\n\n    -- Create the home workspace for the new user\n    INSERT INTO public.workspaces(user_id, is_home, name, default_context_length, default_model, default_prompt, default_temperature, description, embeddings_provider, include_profile_context, include_workspace_instructions, instructions)\n    VALUES(\n        NEW.id,\n        TRUE,\n        'Home',\n        4096,\n        'gpt-4-1106-preview',\n        'You are a friendly, helpful AI assistant.',\n        0.5,\n        'My home workspace.',\n        'openai',\n        TRUE,\n        TRUE,\n        ''\n    );\n\n    RETURN NEW;\nEND;\n$$ language 'plpgsql'","CREATE TRIGGER create_profile_and_workspace_trigger\nAFTER INSERT ON auth.users\nFOR EACH ROW\nEXECUTE PROCEDURE public.create_profile_and_workspace()","CREATE TRIGGER delete_old_profile_image\nAFTER DELETE ON profiles\nFOR EACH ROW\nEXECUTE PROCEDURE delete_old_profile_image()","-- STORAGE --\n\nINSERT INTO storage.buckets (id, name, public) VALUES ('profile_images', 'profile_images', true)","CREATE POLICY \\"Allow public read access on profile images\\"\n    ON storage.objects FOR SELECT\n    USING (bucket_id = 'profile_images')","CREATE POLICY \\"Allow authenticated insert access to own profile images\\"\n    ON storage.objects FOR INSERT TO authenticated\n    WITH CHECK (bucket_id = 'profile_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow authenticated update access to own profile images\\"\n    ON storage.objects FOR UPDATE TO authenticated\n    USING (bucket_id = 'profile_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow authenticated delete access to own profile images\\"\n    ON storage.objects FOR DELETE TO authenticated\n    USING (bucket_id = 'profile_images' AND (storage.foldername(name))[1] = auth.uid()::text)"}	add_profiles
20240108234542	{"--------------- WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS workspaces (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    default_context_length INTEGER NOT NULL,\n    default_model TEXT NOT NULL CHECK (char_length(default_model) <= 1000),\n    default_prompt TEXT NOT NULL CHECK (char_length(default_prompt) <= 100000),\n    default_temperature REAL NOT NULL,\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    embeddings_provider TEXT NOT NULL CHECK (char_length(embeddings_provider) <= 1000),\n    include_profile_context BOOLEAN NOT NULL,\n    include_workspace_instructions BOOLEAN NOT NULL,\n    instructions TEXT NOT NULL CHECK (char_length(instructions) <= 1500),\n    is_home BOOLEAN NOT NULL DEFAULT FALSE,\n    name TEXT NOT NULL CHECK (char_length(name) <= 100)\n)","-- INDEXES --\n\nCREATE INDEX idx_workspaces_user_id ON workspaces (user_id)","-- RLS --\n\nALTER TABLE workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own workspaces\\"\n    ON workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private workspaces\\"\n    ON workspaces\n    FOR SELECT\n    USING (sharing <> 'private')","-- FUNCTIONS --\n\nCREATE OR REPLACE FUNCTION prevent_home_field_update()\nRETURNS TRIGGER AS $$\nBEGIN\n  IF NEW.is_home IS DISTINCT FROM OLD.is_home THEN\n    RAISE EXCEPTION 'Updating the home field of workspace is not allowed.';\n  END IF;\n  \n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql","-- TRIGGERS --\n\nCREATE TRIGGER update_workspaces_updated_at\nBEFORE UPDATE ON workspaces\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","CREATE OR REPLACE FUNCTION prevent_home_workspace_deletion()\nRETURNS TRIGGER AS $$\nBEGIN\n  IF OLD.is_home THEN\n    RAISE EXCEPTION 'Home workspace deletion is not allowed.';\n  END IF;\n  \n  RETURN OLD;\nEND;\n$$ LANGUAGE plpgsql","CREATE TRIGGER prevent_update_of_home_field\nBEFORE UPDATE ON workspaces\nFOR EACH ROW\nEXECUTE PROCEDURE prevent_home_field_update()","-- INDEXES --\n\nCREATE UNIQUE INDEX idx_unique_home_workspace_per_user \nON workspaces(user_id) \nWHERE is_home"}	add_workspaces
20240108234543	{"--------------- FOLDERS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS folders (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- REQUIRED\n    name TEXT NOT NULL,\n    description TEXT NOT NULL,\n    type TEXT NOT NULL\n)","-- INDEXES --\n\nCREATE INDEX folders_user_id_idx ON folders(user_id)","CREATE INDEX folders_workspace_id_idx ON folders(workspace_id)","-- RLS --\n\nALTER TABLE folders ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own folders\\"\n    ON folders\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_folders_updated_at\nBEFORE UPDATE ON folders\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()"}	add_folders
20240108234544	{"--------------- FILES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS files (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    file_path TEXT NOT NULL CHECK (char_length(file_path) <= 1000),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100),\n    size INT NOT NULL,\n    tokens INT NOT NULL,\n    type TEXT NOT NULL CHECK (char_length(type) <= 100)\n)","-- INDEXES --\n\nCREATE INDEX files_user_id_idx ON files(user_id)","-- RLS --\n\nALTER TABLE files ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own files\\"\n    ON files\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private files\\"\n    ON files\n    FOR SELECT\n    USING (sharing <> 'private')","-- FUNCTIONS --\n\nCREATE OR REPLACE FUNCTION delete_old_file()\nRETURNS TRIGGER\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nDECLARE\n  status INT;\n  content TEXT;\nBEGIN\n  IF TG_OP = 'DELETE' THEN\n    SELECT\n      INTO status, content\n      result.status, result.content\n      FROM public.delete_storage_object_from_bucket('files', OLD.file_path) AS result;\n    IF status <> 200 THEN\n      RAISE WARNING 'Could not delete file: % %', status, content;\n    END IF;\n  END IF;\n  IF TG_OP = 'DELETE' THEN\n    RETURN OLD;\n  END IF;\n  RETURN NEW;\nEND;\n$$","-- TRIGGERS --\n\nCREATE TRIGGER update_files_updated_at\nBEFORE UPDATE ON files\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","CREATE TRIGGER delete_old_file\nBEFORE DELETE ON files\nFOR EACH ROW\nEXECUTE PROCEDURE delete_old_file()","-- STORAGE --\n\nINSERT INTO storage.buckets (id, name, public) VALUES ('files', 'files', false)","CREATE OR REPLACE FUNCTION public.non_private_file_exists(p_name text)\nRETURNS boolean\nLANGUAGE sql\nSECURITY DEFINER\nAS $$\n    SELECT EXISTS (\n        SELECT 1\n        FROM files\n        WHERE (id::text = (storage.foldername(p_name))[2]) AND sharing <> 'private'\n    );\n$$","CREATE POLICY \\"Allow public read access on non-private files\\"\n    ON storage.objects FOR SELECT TO public\n    USING (bucket_id = 'files' AND public.non_private_file_exists(name))","CREATE POLICY \\"Allow authenticated insert access to own file\\"\n    ON storage.objects FOR INSERT TO authenticated\n    WITH CHECK (bucket_id = 'files' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow authenticated update access to own file\\"\n    ON storage.objects FOR UPDATE TO authenticated\n    USING (bucket_id = 'files' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow authenticated delete access to own file\\"\n    ON storage.objects FOR DELETE TO authenticated\n    USING (bucket_id = 'files' AND (storage.foldername(name))[1] = auth.uid()::text)","--------------- FILE WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS file_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    file_id UUID NOT NULL REFERENCES files(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(file_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX file_workspaces_user_id_idx ON file_workspaces(user_id)","CREATE INDEX file_workspaces_file_id_idx ON file_workspaces(file_id)","CREATE INDEX file_workspaces_workspace_id_idx ON file_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE file_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own file_workspaces\\"\n    ON file_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_file_workspaces_updated_at\nBEFORE UPDATE ON file_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_files
20240108234545	{"--------------- FILE ITEMS ---------------\n\ncreate table file_items (\n  -- ID\n  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n  -- RELATIONSHIPS\n  file_id UUID NOT NULL REFERENCES files(id) ON DELETE CASCADE,\n  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n  -- METADATA\n  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n  updated_at TIMESTAMPTZ,\n\n  -- SHARING\n  sharing TEXT NOT NULL DEFAULT 'private',\n\n  -- REQUIRED\n  content TEXT NOT NULL,\n  local_embedding vector(384), -- 384 works for local w/ Xenova/all-MiniLM-L6-v2\n  openai_embedding vector(1536), -- 1536 for OpenAI\n  tokens INT NOT NULL\n)","-- INDEXES --\n\nCREATE INDEX file_items_file_id_idx ON file_items(file_id)","CREATE INDEX file_items_embedding_idx ON file_items\n  USING hnsw (openai_embedding vector_cosine_ops)","CREATE INDEX file_items_local_embedding_idx ON file_items\n  USING hnsw (local_embedding vector_cosine_ops)","-- RLS\n\nALTER TABLE file_items ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own file items\\"\n    ON file_items\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private file items\\"\n    ON file_items\n    FOR SELECT\n    USING (file_id IN (\n        SELECT id FROM files WHERE sharing <> 'private'\n    ))","-- TRIGGERS --\n\nCREATE TRIGGER update_profiles_updated_at\nBEFORE UPDATE ON file_items\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","-- FUNCTIONS --\n\ncreate function match_file_items_local (\n  query_embedding vector(384),\n  match_count int DEFAULT null,\n  file_ids UUID[] DEFAULT null\n) returns table (\n  id UUID,\n  file_id UUID,\n  content TEXT,\n  tokens INT,\n  similarity float\n)\nlanguage plpgsql\nas $$\n#variable_conflict use_column\nbegin\n  return query\n  select\n    id,\n    file_id,\n    content,\n    tokens,\n    1 - (file_items.local_embedding <=> query_embedding) as similarity\n  from file_items\n  where (file_id = ANY(file_ids))\n  order by file_items.local_embedding <=> query_embedding\n  limit match_count;\nend;\n$$","create function match_file_items_openai (\n  query_embedding vector(1536),\n  match_count int DEFAULT null,\n  file_ids UUID[] DEFAULT null\n) returns table (\n  id UUID,\n  file_id UUID,\n  content TEXT,\n  tokens INT,\n  similarity float\n)\nlanguage plpgsql\nas $$\n#variable_conflict use_column\nbegin\n  return query\n  select\n    id,\n    file_id,\n    content,\n    tokens,\n    1 - (file_items.openai_embedding <=> query_embedding) as similarity\n  from file_items\n  where (file_id = ANY(file_ids))\n  order by file_items.openai_embedding <=> query_embedding\n  limit match_count;\nend;\n$$"}	add_file_items
20240108234546	{"--------------- PRESETS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS presets (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    context_length INT NOT NULL,\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    embeddings_provider TEXT NOT NULL CHECK (char_length(embeddings_provider) <= 1000),\n    include_profile_context BOOLEAN NOT NULL,\n    include_workspace_instructions BOOLEAN NOT NULL,\n    model TEXT NOT NULL CHECK (char_length(model) <= 1000),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100),\n    prompt TEXT NOT NULL CHECK (char_length(prompt) <= 100000),\n    temperature REAL NOT NULL\n)","-- INDEXES --\n\nCREATE INDEX presets_user_id_idx ON presets(user_id)","-- RLS --\n\nALTER TABLE presets ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own presets\\"\n    ON presets\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private presets\\"\n    ON presets\n    FOR SELECT\n    USING (sharing <> 'private')","-- TRIGGERS --\n\nCREATE TRIGGER update_presets_updated_at\nBEFORE UPDATE ON presets \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()","--------------- PRESET WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS preset_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    preset_id UUID NOT NULL REFERENCES presets(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(preset_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX preset_workspaces_user_id_idx ON preset_workspaces(user_id)","CREATE INDEX preset_workspaces_preset_id_idx ON preset_workspaces(preset_id)","CREATE INDEX preset_workspaces_workspace_id_idx ON preset_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE preset_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own preset_workspaces\\"\n    ON preset_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_preset_workspaces_updated_at\nBEFORE UPDATE ON preset_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_presets
20240108234547	{"--------------- ASSISTANTS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS assistants (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n     --SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    context_length INT NOT NULL,\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    embeddings_provider TEXT NOT NULL CHECK (char_length(embeddings_provider) <= 1000),\n    include_profile_context BOOLEAN NOT NULL,\n    include_workspace_instructions BOOLEAN NOT NULL,\n    model TEXT NOT NULL CHECK (char_length(model) <= 1000),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100),\n    image_path TEXT NOT NULL CHECK (char_length(image_path) <= 1000), -- file path in assistant_images bucket\n    prompt TEXT NOT NULL CHECK (char_length(prompt) <= 100000),\n    temperature REAL NOT NULL\n)","-- INDEXES --\n\nCREATE INDEX assistants_user_id_idx ON assistants(user_id)","-- RLS --\n\nALTER TABLE assistants ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own assistants\\"\n    ON assistants\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private assistants\\"\n    ON assistants\n    FOR SELECT\n    USING (sharing <> 'private')","-- FUNCTIONS --\n\nCREATE OR REPLACE FUNCTION delete_old_assistant_image()\nRETURNS TRIGGER\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nDECLARE\n  status INT;\n  content TEXT;\nBEGIN\n  IF TG_OP = 'DELETE' THEN\n    SELECT\n      INTO status, content\n      result.status, result.content\n      FROM public.delete_storage_object_from_bucket('assistant_images', OLD.image_path) AS result;\n    IF status <> 200 THEN\n      RAISE WARNING 'Could not delete assistant image: % %', status, content;\n    END IF;\n  END IF;\n  IF TG_OP = 'DELETE' THEN\n    RETURN OLD;\n  END IF;\n  RETURN NEW;\nEND;\n$$","-- TRIGGERS --\n\nCREATE TRIGGER update_assistants_updated_at\nBEFORE UPDATE ON assistants\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","CREATE TRIGGER delete_old_assistant_image\nAFTER DELETE ON assistants\nFOR EACH ROW\nEXECUTE PROCEDURE delete_old_assistant_image()","-- STORAGE --\n\nINSERT INTO storage.buckets (id, name, public) VALUES ('assistant_images', 'assistant_images', false)","CREATE OR REPLACE FUNCTION public.non_private_assistant_exists(p_name text)\nRETURNS boolean\nLANGUAGE sql\nSECURITY DEFINER\nAS $$\n    SELECT EXISTS (\n        SELECT 1\n        FROM assistants\n        WHERE (id::text = (storage.filename(p_name))) AND sharing <> 'private'\n    );\n$$","CREATE POLICY \\"Allow public read access on non-private assistant images\\"\n    ON storage.objects FOR SELECT TO public\n    USING (bucket_id = 'assistant_images' AND public.non_private_assistant_exists(name))","CREATE POLICY \\"Allow insert access to own assistant images\\"\n    ON storage.objects FOR INSERT TO authenticated\n    WITH CHECK (bucket_id = 'assistant_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow update access to own assistant images\\"\n    ON storage.objects FOR UPDATE TO authenticated\n    USING (bucket_id = 'assistant_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow delete access to own assistant images\\"\n    ON storage.objects FOR DELETE TO authenticated\n    USING (bucket_id = 'assistant_images' AND (storage.foldername(name))[1] = auth.uid()::text)","--------------- ASSISTANT WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS assistant_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    assistant_id UUID NOT NULL REFERENCES assistants(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(assistant_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX assistant_workspaces_user_id_idx ON assistant_workspaces(user_id)","CREATE INDEX assistant_workspaces_assistant_id_idx ON assistant_workspaces(assistant_id)","CREATE INDEX assistant_workspaces_workspace_id_idx ON assistant_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE assistant_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own assistant_workspaces\\"\n    ON assistant_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_assistant_workspaces_updated_at\nBEFORE UPDATE ON assistant_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_assistants
20240108234548	{"--------------- CHATS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS chats (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n    \n    -- OPTIONAL RELATIONSHIPS\n    assistant_id UUID REFERENCES assistants(id) ON DELETE CASCADE,\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    context_length INT NOT NULL,\n    embeddings_provider TEXT NOT NULL CHECK (char_length(embeddings_provider) <= 1000),\n    include_profile_context BOOLEAN NOT NULL,\n    include_workspace_instructions BOOLEAN NOT NULL,\n    model TEXT NOT NULL CHECK (char_length(model) <= 1000),\n    name TEXT NOT NULL CHECK (char_length(name) <= 200),\n    prompt TEXT NOT NULL CHECK (char_length(prompt) <= 100000),\n    temperature REAL NOT NULL\n)","-- INDEXES --\n\nCREATE INDEX idx_chats_user_id ON chats (user_id)","CREATE INDEX idx_chats_workspace_id ON chats (workspace_id)","-- RLS --\n\nALTER TABLE chats ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own chats\\"\n    ON chats\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private chats\\"\n    ON chats\n    FOR SELECT\n    USING (sharing <> 'private')","-- TRIGGERS --\n\nCREATE TRIGGER update_chats_updated_at\nBEFORE UPDATE ON chats \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()","--------------- CHAT FILES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS chat_files (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    chat_id UUID NOT NULL REFERENCES chats(id) ON DELETE CASCADE,\n    file_id UUID NOT NULL REFERENCES files(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(chat_id, file_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX idx_chat_files_chat_id ON chat_files (chat_id)","-- RLS --\n\nALTER TABLE chat_files ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own chat_files\\"\n    ON chat_files\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_chat_files_updated_at\nBEFORE UPDATE ON chat_files \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_chats
20240108234549	{"--------------- MESSAGES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS messages (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- RELATIONSHIPS\n    chat_id UUID NOT NULL REFERENCES chats(id) ON DELETE CASCADE,\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- REQUIRED\n    content TEXT NOT NULL CHECK (char_length(content) <= 1000000),\n    image_paths TEXT[] NOT NULL, -- file paths in message_images bucket\n    model TEXT NOT NULL CHECK (char_length(model) <= 1000),\n    role TEXT NOT NULL CHECK (char_length(role) <= 1000),\n    sequence_number INT NOT NULL,\n\n    -- CONSTRAINTS\n    CONSTRAINT check_image_paths_length CHECK (array_length(image_paths, 1) <= 16)\n)","-- INDEXES --\n\nCREATE INDEX idx_messages_chat_id ON messages (chat_id)","-- RLS --\n\nALTER TABLE messages ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own messages\\"\n    ON messages\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to messages for non-private chats\\"\n    ON messages\n    FOR SELECT\n    USING (chat_id IN (\n        SELECT id FROM chats WHERE sharing <> 'private'\n    ))","-- FUNCTIONS --\n\nCREATE OR REPLACE FUNCTION delete_old_message_images()\nRETURNS TRIGGER\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nDECLARE\n  status INT;\n  content TEXT;\n  image_path TEXT;\nBEGIN\n  IF TG_OP = 'DELETE' THEN\n    FOREACH image_path IN ARRAY OLD.image_paths\n    LOOP\n      SELECT\n        INTO status, content\n        result.status, result.content\n        FROM public.delete_storage_object_from_bucket('message_images', image_path) AS result;\n      IF status <> 200 THEN\n        RAISE WARNING 'Could not delete message image: % %', status, content;\n      END IF;\n    END LOOP;\n  END IF;\n  IF TG_OP = 'DELETE' THEN\n    RETURN OLD;\n  END IF;\n  RETURN NEW;\nEND;\n$$","CREATE OR REPLACE FUNCTION delete_messages_including_and_after(\n    p_user_id UUID, \n    p_chat_id UUID, \n    p_sequence_number INT\n)\nRETURNS VOID AS $$\nBEGIN\n    DELETE FROM messages \n    WHERE user_id = p_user_id AND chat_id = p_chat_id AND sequence_number >= p_sequence_number;\nEND;\n$$ LANGUAGE plpgsql","-- TRIGGERS --\n\nCREATE TRIGGER update_messages_updated_at\nBEFORE UPDATE ON messages\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","CREATE TRIGGER delete_old_message_images\nAFTER DELETE ON messages\nFOR EACH ROW\nEXECUTE PROCEDURE delete_old_message_images()","-- STORAGE --\n\n-- MESSAGE IMAGES\n\nINSERT INTO storage.buckets (id, name, public) VALUES ('message_images', 'message_images', false)","CREATE POLICY \\"Allow read access to own message images\\"\n    ON storage.objects FOR SELECT\n    USING (\n        bucket_id = 'message_images' AND \n        (\n            (storage.foldername(name))[1] = auth.uid()::text OR\n            (\n                EXISTS (\n                    SELECT 1 FROM chats \n                    WHERE id = (\n                        SELECT chat_id FROM messages WHERE id = (storage.foldername(name))[2]::uuid\n                    ) AND sharing <> 'private'\n                )\n            )\n        )\n    )","CREATE POLICY \\"Allow insert access to own message images\\"\n    ON storage.objects FOR INSERT\n    WITH CHECK (bucket_id = 'message_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow update access to own message images\\"\n    ON storage.objects FOR UPDATE\n    USING (bucket_id = 'message_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow delete access to own message images\\"\n    ON storage.objects FOR DELETE\n    USING (bucket_id = 'message_images' AND (storage.foldername(name))[1] = auth.uid()::text)","--------------- MESSAGE FILE ITEMS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS message_file_items (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    message_id UUID NOT NULL REFERENCES messages(id) ON DELETE CASCADE,\n    file_item_id UUID NOT NULL REFERENCES file_items(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(message_id, file_item_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX idx_message_file_items_message_id ON message_file_items (message_id)","-- RLS --\n\nALTER TABLE message_file_items ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own message_file_items\\"\n    ON message_file_items\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_message_file_items_updated_at\nBEFORE UPDATE ON message_file_items \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_messages
20240108234550	{"--------------- PROMPTS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS prompts (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    content TEXT NOT NULL CHECK (char_length(content) <= 100000),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100)\n)","-- INDEXES --\n\nCREATE INDEX prompts_user_id_idx ON prompts(user_id)","-- RLS --\n\nALTER TABLE prompts ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own prompts\\"\n    ON prompts\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private prompts\\"\n    ON prompts\n    FOR SELECT\n    USING (sharing <> 'private')","-- TRIGGERS --\n\nCREATE TRIGGER update_prompts_updated_at\nBEFORE UPDATE ON prompts\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","--------------- PROMPT WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS prompt_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    prompt_id UUID NOT NULL REFERENCES prompts(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(prompt_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX prompt_workspaces_user_id_idx ON prompt_workspaces(user_id)","CREATE INDEX prompt_workspaces_prompt_id_idx ON prompt_workspaces(prompt_id)","CREATE INDEX prompt_workspaces_workspace_id_idx ON prompt_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE prompt_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own prompt_workspaces\\"\n    ON prompt_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_prompt_workspaces_updated_at\nBEFORE UPDATE ON prompt_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_prompts
20240108234551	{"--------------- COLLECTIONS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS collections (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100)\n)","-- INDEXES --\n\nCREATE INDEX collections_user_id_idx ON collections(user_id)","-- RLS --\n\nALTER TABLE collections ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own collections\\"\n    ON collections\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private collections\\"\n    ON collections\n    FOR SELECT\n    USING (sharing <> 'private')","-- TRIGGERS --\n\nCREATE TRIGGER update_collections_updated_at\nBEFORE UPDATE ON collections\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","--------------- COLLECTION WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS collection_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    collection_id UUID NOT NULL REFERENCES collections(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(collection_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX collection_workspaces_user_id_idx ON collection_workspaces(user_id)","CREATE INDEX collection_workspaces_collection_id_idx ON collection_workspaces(collection_id)","CREATE INDEX collection_workspaces_workspace_id_idx ON collection_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE collection_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own collection_workspaces\\"\n    ON collection_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_collection_workspaces_updated_at\nBEFORE UPDATE ON collection_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()","--------------- COLLECTION FILES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS collection_files (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    collection_id UUID NOT NULL REFERENCES collections(id) ON DELETE CASCADE,\n    file_id UUID NOT NULL REFERENCES files(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(collection_id, file_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX idx_collection_files_collection_id ON collection_files (collection_id)","CREATE INDEX idx_collection_files_file_id ON collection_files (file_id)","-- RLS --\n\nALTER TABLE collection_files ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own collection_files\\"\n    ON collection_files\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to collection files for non-private collections\\"\n    ON collection_files\n    FOR SELECT\n    USING (collection_id IN (\n        SELECT id FROM collections WHERE sharing <> 'private'\n    ))","-- TRIGGERS --\n\nCREATE TRIGGER update_collection_files_updated_at\nBEFORE UPDATE ON collection_files \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()","--------------- REFERS BACK TO FILES ---------------\n\nCREATE POLICY \\"Allow view access to files for non-private collections\\"\n    ON files\n    FOR SELECT\n    USING (id IN (\n        SELECT file_id FROM collection_files WHERE collection_id IN (\n            SELECT id FROM collections WHERE sharing <> 'private'\n        )\n    ))"}	add_collections
20240115135033	{"ALTER TABLE profiles\nADD COLUMN openrouter_api_key TEXT CHECK (char_length(openrouter_api_key) <= 1000)"}	add_openrouter
20240115171510	{"--------------- ASSISTANT FILES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS assistant_files (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    assistant_id UUID NOT NULL REFERENCES assistants(id) ON DELETE CASCADE,\n    file_id UUID NOT NULL REFERENCES files(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(assistant_id, file_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX assistant_files_user_id_idx ON assistant_files(user_id)","CREATE INDEX assistant_files_assistant_id_idx ON assistant_files(assistant_id)","CREATE INDEX assistant_files_file_id_idx ON assistant_files(file_id)","-- RLS --\n\nALTER TABLE assistant_files ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own assistant_files\\"\n    ON assistant_files\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_assistant_files_updated_at\nBEFORE UPDATE ON assistant_files \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()","--------------- ASSISTANT COLLECTIONS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS assistant_collections (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    assistant_id UUID NOT NULL REFERENCES assistants(id) ON DELETE CASCADE,\n    collection_id UUID NOT NULL REFERENCES collections(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(assistant_id, collection_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX assistant_collections_user_id_idx ON assistant_collections(user_id)","CREATE INDEX assistant_collections_assistant_id_idx ON assistant_collections(assistant_id)","CREATE INDEX assistant_collections_collection_id_idx ON assistant_collections(collection_id)","-- RLS --\n\nALTER TABLE assistant_collections ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own assistant_collections\\"\n    ON assistant_collections\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_assistant_collections_updated_at\nBEFORE UPDATE ON assistant_collections \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_assistant_files
20240115171524	{"--------------- TOOLS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS tools (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n     --SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100),\n    schema JSONB NOT NULL,\n    url TEXT NOT NULL CHECK (char_length(url) <= 1000)\n)","-- INDEXES --\n\nCREATE INDEX tools_user_id_idx ON tools(user_id)","-- RLS --\n\nALTER TABLE tools ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own tools\\"\n    ON tools\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private tools\\"\n    ON tools\n    FOR SELECT\n    USING (sharing <> 'private')","-- TRIGGERS --\n\nCREATE TRIGGER update_tools_updated_at\nBEFORE UPDATE ON tools\nFOR EACH ROW\nEXECUTE PROCEDURE update_updated_at_column()","--------------- TOOL WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS tool_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    tool_id UUID NOT NULL REFERENCES tools(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(tool_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX tool_workspaces_user_id_idx ON tool_workspaces(user_id)","CREATE INDEX tool_workspaces_tool_id_idx ON tool_workspaces(tool_id)","CREATE INDEX tool_workspaces_workspace_id_idx ON tool_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE tool_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own tool_workspaces\\"\n    ON tool_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_tool_workspaces_updated_at\nBEFORE UPDATE ON tool_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_tools
20240115172125	{"--------------- ASSISTANT TOOLS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS assistant_tools (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    assistant_id UUID NOT NULL REFERENCES assistants(id) ON DELETE CASCADE,\n    tool_id UUID NOT NULL REFERENCES tools(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(assistant_id, tool_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX assistant_tools_user_id_idx ON assistant_tools(user_id)","CREATE INDEX assistant_tools_assistant_id_idx ON assistant_tools(assistant_id)","CREATE INDEX assistant_tools_tool_id_idx ON assistant_tools(tool_id)","-- RLS --\n\nALTER TABLE assistant_tools ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own assistant_tools\\"\n    ON assistant_tools\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_assistant_tools_updated_at\nBEFORE UPDATE ON assistant_tools \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_assistant_tools
20240118224049	{"ALTER TABLE profiles\nADD COLUMN azure_openai_embeddings_id TEXT CHECK (char_length(azure_openai_embeddings_id) <= 1000)"}	add_azure_embeddings
20240124234424	{"ALTER TABLE tools\nADD COLUMN custom_headers JSONB NOT NULL DEFAULT '{}',\nADD COLUMN request_in_body BOOLEAN NOT NULL DEFAULT TRUE,\nALTER COLUMN schema SET DEFAULT '{}'"}	tool_improvements
20240125192042	{"-- WORKSPACES\n\nUPDATE workspaces\nSET default_model = 'anthropic.claude-3-5-sonnet-20240620-v1:0'\nWHERE default_model = 'gpt-4-1106-preview'","UPDATE workspaces\nSET default_model = 'gpt-3.5-turbo'\nWHERE default_model = 'gpt-3.5-turbo-1106'","-- PRESETS\n\nUPDATE presets\nSET model = 'anthropic.claude-3-5-sonnet-20240620-v1:0'\nWHERE model = 'gpt-4-1106-preview'","UPDATE presets\nSET model = 'gpt-3.5-turbo'\nWHERE model = 'gpt-3.5-turbo-1106'","-- ASSISTANTS\n\nUPDATE assistants\nSET model = 'anthropic.claude-3-5-sonnet-20240620-v1:0'\nWHERE model = 'gpt-4-1106-preview'","UPDATE assistants\nSET model = 'gpt-3.5-turbo'\nWHERE model = 'gpt-3.5-turbo-1106'","-- CHATS\n\nUPDATE chats\nSET model = 'anthropic.claude-3-5-sonnet-20240620-v1:0'\nWHERE model = 'gpt-4-1106-preview'","UPDATE chats\nSET model = 'gpt-3.5-turbo'\nWHERE model = 'gpt-3.5-turbo-1106'","-- MESSAGES\n\nUPDATE messages\nSET model = 'anthropic.claude-3-5-sonnet-20240620-v1:0'\nWHERE model = 'gpt-4-1106-preview'","UPDATE messages\nSET model = 'gpt-3.5-turbo'\nWHERE model = 'gpt-3.5-turbo-1106'","-- PROFILES\n\nCREATE OR REPLACE FUNCTION create_profile_and_workspace() \nRETURNS TRIGGER\nLANGUAGE plpgsql\nSECURITY DEFINER\nSET search_path = public\nAS $$\nDECLARE\n    random_username TEXT;\nBEGIN\n    -- Generate a random username\n    random_username := 'user' || substr(replace(gen_random_uuid()::text, '-', ''), 1, 16);\n\n    -- Create a profile for the new user\n    INSERT INTO public.profiles(user_id, anthropic_api_key, azure_openai_35_turbo_id, azure_openai_45_turbo_id, azure_openai_45_vision_id, azure_openai_api_key, azure_openai_endpoint, google_gemini_api_key, has_onboarded, image_url, image_path, mistral_api_key, display_name, bio, openai_api_key, openai_organization_id, perplexity_api_key, profile_context, use_azure_openai, username)\n    VALUES(\n        NEW.id,\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        FALSE,\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        '',\n        FALSE,\n        random_username\n    );\n\n    INSERT INTO public.workspaces(user_id, is_home, name, default_context_length, default_model, default_prompt, default_temperature, description, embeddings_provider, include_profile_context, include_workspace_instructions, instructions)\n    VALUES(\n        NEW.id,\n        TRUE,\n        'Home',\n        4096,\n        'anthropic.claude-3-5-sonnet-20240620-v1:0', -- Updated default model\n        'You are a friendly, helpful AI assistant.',\n        0.5,\n        'My home workspace.',\n        'openai',\n        TRUE,\n        TRUE,\n        ''\n    );\n\n    RETURN NEW;\nEND;\n$$"}	upgrade_openai_models
20240125194719	{"--------------- MODELS ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS models (\n    -- ID\n    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),\n\n    -- RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n\n    -- OPTIONAL RELATIONSHIPS\n    folder_id UUID REFERENCES folders(id) ON DELETE SET NULL,\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ,\n\n    -- SHARING\n    sharing TEXT NOT NULL DEFAULT 'private',\n\n    -- REQUIRED\n    api_key TEXT NOT NULL CHECK (char_length(api_key) <= 1000),\n    base_url TEXT NOT NULL CHECK (char_length(base_url) <= 1000),\n    description TEXT NOT NULL CHECK (char_length(description) <= 500),\n    model_id TEXT NOT NULL CHECK (char_length(model_id) <= 1000),\n    name TEXT NOT NULL CHECK (char_length(name) <= 100)\n)","-- INDEXES --\n\nCREATE INDEX models_user_id_idx ON models(user_id)","-- RLS --\n\nALTER TABLE models ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own models\\"\n    ON models\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","CREATE POLICY \\"Allow view access to non-private models\\"\n    ON models\n    FOR SELECT\n    USING (sharing <> 'private')","-- TRIGGERS --\n\nCREATE TRIGGER update_models_updated_at\nBEFORE UPDATE ON models \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()","--------------- MODEL WORKSPACES ---------------\n\n-- TABLE --\n\nCREATE TABLE IF NOT EXISTS model_workspaces (\n    -- REQUIRED RELATIONSHIPS\n    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n    model_id UUID NOT NULL REFERENCES models(id) ON DELETE CASCADE,\n    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,\n\n    PRIMARY KEY(model_id, workspace_id),\n\n    -- METADATA\n    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,\n    updated_at TIMESTAMPTZ\n)","-- INDEXES --\n\nCREATE INDEX model_workspaces_user_id_idx ON model_workspaces(user_id)","CREATE INDEX model_workspaces_model_id_idx ON model_workspaces(model_id)","CREATE INDEX model_workspaces_workspace_id_idx ON model_workspaces(workspace_id)","-- RLS --\n\nALTER TABLE model_workspaces ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"Allow full access to own model_workspaces\\"\n    ON model_workspaces\n    USING (user_id = auth.uid())\n    WITH CHECK (user_id = auth.uid())","-- TRIGGERS --\n\nCREATE TRIGGER update_model_workspaces_updated_at\nBEFORE UPDATE ON model_workspaces \nFOR EACH ROW \nEXECUTE PROCEDURE update_updated_at_column()"}	add_custom_models
20240129232644	{"-- ALTER TABLE --\n\nALTER TABLE workspaces\nADD COLUMN image_path TEXT DEFAULT '' NOT NULL CHECK (char_length(image_path) <= 1000)","-- STORAGE --\n\nINSERT INTO storage.buckets (id, name, public) VALUES ('workspace_images', 'workspace_images', false)","-- FUNCTIONS --\n\nCREATE OR REPLACE FUNCTION delete_old_workspace_image()\nRETURNS TRIGGER\nLANGUAGE 'plpgsql'\nSECURITY DEFINER\nAS $$\nDECLARE\n  status INT;\n  content TEXT;\nBEGIN\n  IF TG_OP = 'DELETE' THEN\n    SELECT\n      INTO status, content\n      result.status, result.content\n      FROM public.delete_storage_object_from_bucket('workspace_images', OLD.image_path) AS result;\n    IF status <> 200 THEN\n      RAISE WARNING 'Could not delete workspace image: % %', status, content;\n    END IF;\n  END IF;\n  IF TG_OP = 'DELETE' THEN\n    RETURN OLD;\n  END IF;\n  RETURN NEW;\nEND;\n$$","-- TRIGGERS --\n\nCREATE TRIGGER delete_old_workspace_image\nAFTER DELETE ON workspaces\nFOR EACH ROW\nEXECUTE PROCEDURE delete_old_workspace_image()","-- POLICIES --\n\nCREATE OR REPLACE FUNCTION public.non_private_workspace_exists(p_name text)\nRETURNS boolean\nLANGUAGE sql\nSECURITY DEFINER\nAS $$\n    SELECT EXISTS (\n        SELECT 1\n        FROM workspaces\n        WHERE (id::text = (storage.filename(p_name))) AND sharing <> 'private'\n    );\n$$","CREATE POLICY \\"Allow public read access on non-private workspace images\\"\n    ON storage.objects FOR SELECT TO public\n    USING (bucket_id = 'workspace_images' AND public.non_private_workspace_exists(name))","CREATE POLICY \\"Allow insert access to own workspace images\\"\n    ON storage.objects FOR INSERT TO authenticated\n    WITH CHECK (bucket_id = 'workspace_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow update access to own workspace images\\"\n    ON storage.objects FOR UPDATE TO authenticated\n    USING (bucket_id = 'workspace_images' AND (storage.foldername(name))[1] = auth.uid()::text)","CREATE POLICY \\"Allow delete access to own workspace images\\"\n    ON storage.objects FOR DELETE TO authenticated\n    USING (bucket_id = 'workspace_images' AND (storage.foldername(name))[1] = auth.uid()::text)"}	add_workspace_images
20240212063532	{"ALTER TABLE messages ADD COLUMN assistant_id UUID REFERENCES assistants(id) ON DELETE CASCADE DEFAULT NULL"}	add_at_assistants
20240213040255	{"ALTER TABLE tools\nDROP COLUMN request_in_body"}	remove_request_in_body_from_tools
20240213085646	{"ALTER TABLE models ADD COLUMN context_length INT NOT NULL DEFAULT 4096"}	add_context_length_to_custom_models
20240302004845	{"ALTER TABLE profiles ADD COLUMN groq_api_key TEXT CHECK (char_length(groq_api_key) <= 1000)"}	add_groq
20240805201034	{"-- drop trigger if exists \\"update_assistant_collections_updated_at\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop trigger if exists \\"update_assistant_files_updated_at\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop trigger if exists \\"update_assistant_tools_updated_at\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop trigger if exists \\"update_assistant_workspaces_updated_at\\" on \\"public\\".\\"assistant_workspaces\\";\n\n-- drop trigger if exists \\"delete_old_assistant_image\\" on \\"public\\".\\"assistants\\";\n\n-- drop trigger if exists \\"update_assistants_updated_at\\" on \\"public\\".\\"assistants\\";\n\n-- drop trigger if exists \\"update_chat_files_updated_at\\" on \\"public\\".\\"chat_files\\";\n\n-- drop trigger if exists \\"update_collection_files_updated_at\\" on \\"public\\".\\"collection_files\\";\n\n-- drop trigger if exists \\"update_collection_workspaces_updated_at\\" on \\"public\\".\\"collection_workspaces\\";\n\n-- drop trigger if exists \\"update_collections_updated_at\\" on \\"public\\".\\"collections\\";\n\n-- drop trigger if exists \\"update_profiles_updated_at\\" on \\"public\\".\\"file_items\\";\n\n-- drop trigger if exists \\"update_file_workspaces_updated_at\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop trigger if exists \\"delete_old_file\\" on \\"public\\".\\"files\\";\n\n-- drop trigger if exists \\"update_files_updated_at\\" on \\"public\\".\\"files\\";\n\n-- drop trigger if exists \\"update_folders_updated_at\\" on \\"public\\".\\"folders\\";\n\n-- drop trigger if exists \\"update_message_file_items_updated_at\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop trigger if exists \\"update_model_workspaces_updated_at\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop trigger if exists \\"update_models_updated_at\\" on \\"public\\".\\"models\\";\n\n-- drop trigger if exists \\"update_preset_workspaces_updated_at\\" on \\"public\\".\\"preset_workspaces\\";\n\n-- drop trigger if exists \\"update_presets_updated_at\\" on \\"public\\".\\"presets\\";\n\n-- drop trigger if exists \\"update_prompt_workspaces_updated_at\\" on \\"public\\".\\"prompt_workspaces\\";\n\n-- drop trigger if exists \\"update_prompts_updated_at\\" on \\"public\\".\\"prompts\\";\n\n-- drop trigger if exists \\"update_tool_workspaces_updated_at\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop trigger if exists \\"update_tools_updated_at\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow full access to own assistant_collections\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop policy \\"Allow full access to own assistant_files\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop policy \\"Allow full access to own assistant_tools\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop policy \\"Allow full access to own assistant_workspaces\\" on \\"public\\".\\"assistant_workspaces\\";\n\n-- drop policy \\"Allow full access to own assistants\\" on \\"public\\".\\"assistants\\";\n\n-- drop policy \\"Allow view access to non-private assistants\\" on \\"public\\".\\"assistants\\";\n\n-- drop policy \\"Allow full access to own chat_files\\" on \\"public\\".\\"chat_files\\";\n\n-- drop policy \\"Allow view access to non-private chats\\" on \\"public\\".\\"chats\\";\n\n-- drop policy \\"Allow full access to own collection_files\\" on \\"public\\".\\"collection_files\\";\n\n-- drop policy \\"Allow view access to collection files for non-private collectio\\" on \\"public\\".\\"collection_files\\";\n\n-- drop policy \\"Allow full access to own collection_workspaces\\" on \\"public\\".\\"collection_workspaces\\";\n\n-- drop policy \\"Allow full access to own collections\\" on \\"public\\".\\"collections\\";\n\n-- drop policy \\"Allow view access to non-private collections\\" on \\"public\\".\\"collections\\";\n\n-- drop policy \\"Allow full access to own file items\\" on \\"public\\".\\"file_items\\";\n\n-- drop policy \\"Allow view access to non-private file items\\" on \\"public\\".\\"file_items\\";\n\n-- drop policy \\"Allow full access to own file_workspaces\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop policy \\"Allow full access to own files\\" on \\"public\\".\\"files\\";\n\n-- drop policy \\"Allow view access to files for non-private collections\\" on \\"public\\".\\"files\\";\n\n-- drop policy \\"Allow view access to non-private files\\" on \\"public\\".\\"files\\";\n\n-- drop policy \\"Allow full access to own folders\\" on \\"public\\".\\"folders\\";\n\n-- drop policy \\"Allow full access to own message_file_items\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop policy \\"Allow full access to own model_workspaces\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop policy \\"Allow full access to own models\\" on \\"public\\".\\"models\\";\n\n-- drop policy \\"Allow view access to non-private models\\" on \\"public\\".\\"models\\";\n\n-- drop policy \\"Allow full access to own preset_workspaces\\" on \\"public\\".\\"preset_workspaces\\";\n\n-- drop policy \\"Allow full access to own presets\\" on \\"public\\".\\"presets\\";\n\n-- drop policy \\"Allow view access to non-private presets\\" on \\"public\\".\\"presets\\";\n\n-- drop policy \\"Allow full access to own prompt_workspaces\\" on \\"public\\".\\"prompt_workspaces\\";\n\n-- drop policy \\"Allow full access to own prompts\\" on \\"public\\".\\"prompts\\";\n\n-- drop policy \\"Allow view access to non-private prompts\\" on \\"public\\".\\"prompts\\";\n\n-- drop policy \\"Allow full access to own tool_workspaces\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop policy \\"Allow full access to own tools\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow view access to non-private tools\\" on \\"public\\".\\"tools\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistants\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistants\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistants\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"folders\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"folders\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"folders\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"preset_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"preset_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"preset_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"presets\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"presets\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"presets\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"prompt_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"prompt_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"prompt_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"prompts\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"prompts\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"prompts\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_description_check\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_embeddings_provider_check\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_image_path_check\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_model_check\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_name_check\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_prompt_check\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_chat_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"chats\\" drop constraint \\"chats_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"chats\\" drop constraint \\"chats_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"chats\\" drop constraint \\"chats_model_check\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_description_check\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_name_check\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_description_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_file_path_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_name_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_type_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"folders\\" drop constraint \\"folders_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"folders\\" drop constraint \\"folders_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_file_item_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_message_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"messages\\" drop constraint \\"messages_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"messages\\" drop constraint \\"messages_model_check\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_model_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_api_key_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_base_url_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_description_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_model_id_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_name_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"preset_workspaces\\" drop constraint \\"preset_workspaces_preset_id_fkey\\";\n\n-- alter table \\"public\\".\\"preset_workspaces\\" drop constraint \\"preset_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"preset_workspaces\\" drop constraint \\"preset_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_description_check\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_embeddings_provider_check\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_model_check\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_name_check\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_prompt_check\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_anthropic_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_azure_openai_35_turbo_id_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_azure_openai_45_turbo_id_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_azure_openai_45_vision_id_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_azure_openai_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_azure_openai_embeddings_id_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_azure_openai_endpoint_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_bio_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_google_gemini_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_groq_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_mistral_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_openai_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_openai_organization_id_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_openrouter_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_perplexity_api_key_check\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop constraint \\"profiles_profile_context_check\\";\n\n-- alter table \\"public\\".\\"prompt_workspaces\\" drop constraint \\"prompt_workspaces_prompt_id_fkey\\";\n\n-- alter table \\"public\\".\\"prompt_workspaces\\" drop constraint \\"prompt_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"prompt_workspaces\\" drop constraint \\"prompt_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"prompts\\" drop constraint \\"prompts_content_check\\";\n\n-- alter table \\"public\\".\\"prompts\\" drop constraint \\"prompts_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"prompts\\" drop constraint \\"prompts_name_check\\";\n\n-- alter table \\"public\\".\\"prompts\\" drop constraint \\"prompts_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_description_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_name_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_url_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"workspaces\\" drop constraint \\"workspaces_default_model_check\\";\n\n-- alter table \\"public\\".\\"workspaces\\" drop constraint \\"workspaces_embeddings_provider_check\\";\n\n-- drop function if exists \\"public\\".\\"create_duplicate_messages_for_new_chat\\"(old_chat_id uuid, new_chat_id uuid, new_user_id uuid);\n\n-- drop function if exists \\"public\\".\\"delete_storage_object\\"(bucket text, object text, OUT status integer, OUT content text);\n\n-- drop function if exists \\"public\\".\\"delete_storage_object_from_bucket\\"(bucket_name text, object_path text, OUT status integer, OUT content text);\n\n-- drop function if exists \\"public\\".\\"match_file_items_local\\"(query_embedding vector, match_count integer, file_ids uuid[]);\n\n-- drop function if exists \\"public\\".\\"match_file_items_openai\\"(query_embedding vector, match_count integer, file_ids uuid[]);\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_pkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_pkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_pkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_pkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_pkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_pkey\\";\n\n-- alter table \\"public\\".\\"folders\\" drop constraint \\"folders_pkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_pkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_pkey\\";\n\n-- alter table \\"public\\".\\"preset_workspaces\\" drop constraint \\"preset_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"presets\\" drop constraint \\"presets_pkey\\";\n\n-- alter table \\"public\\".\\"prompt_workspaces\\" drop constraint \\"prompt_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"prompts\\" drop constraint \\"prompts_pkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistants_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistants_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"chat_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_embedding_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_local_embedding_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"folders_pkey\\";\n\n-- drop index if exists \\"public\\".\\"folders_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"folders_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"idx_chat_files_chat_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_collection_files_collection_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_collection_files_file_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_message_file_items_message_id\\";\n\n-- drop index if exists \\"public\\".\\"message_file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_model_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"models_pkey\\";\n\n-- drop index if exists \\"public\\".\\"models_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"preset_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"preset_workspaces_preset_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"preset_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"preset_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"presets_pkey\\";\n\n-- drop index if exists \\"public\\".\\"presets_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"prompt_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"prompt_workspaces_prompt_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"prompt_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"prompt_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"prompts_pkey\\";\n\n-- drop index if exists \\"public\\".\\"prompts_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tools_user_id_idx\\";\n\n-- drop table \\"public\\".\\"assistant_collections\\";\n\n-- drop table \\"public\\".\\"assistant_files\\";\n\n-- drop table \\"public\\".\\"assistant_tools\\";\n\n-- drop table \\"public\\".\\"assistant_workspaces\\";\n\n-- drop table \\"public\\".\\"assistants\\";\n\n-- drop table \\"public\\".\\"chat_files\\";\n\n-- drop table \\"public\\".\\"collection_files\\";\n\n-- drop table \\"public\\".\\"collection_workspaces\\";\n\n-- drop table \\"public\\".\\"collections\\";\n\n-- drop table \\"public\\".\\"file_items\\";\n\n-- drop table \\"public\\".\\"file_workspaces\\";\n\n-- drop table \\"public\\".\\"files\\";\n\n-- drop table \\"public\\".\\"folders\\";\n\n-- drop table \\"public\\".\\"message_file_items\\";\n\n-- drop table \\"public\\".\\"model_workspaces\\";\n\n-- drop table \\"public\\".\\"models\\";\n\n-- drop table \\"public\\".\\"preset_workspaces\\";\n\n-- drop table \\"public\\".\\"presets\\";\n\n-- drop table \\"public\\".\\"prompt_workspaces\\";\n\n-- drop table \\"public\\".\\"prompts\\";\n\n-- drop table \\"public\\".\\"tool_workspaces\\";\n\n-- drop table \\"public\\".\\"tools\\";\n\n-- alter table \\"public\\".\\"chats\\" drop column \\"assistant_id\\";\n\n-- alter table \\"public\\".\\"chats\\" drop column \\"folder_id\\";\n\n-- alter table \\"public\\".\\"chats\\" alter column \\"model\\" set default 'claude-3-sonnet-20240229'::text;\n\n-- alter table \\"public\\".\\"messages\\" drop column \\"assistant_id\\";\n\n-- alter table \\"public\\".\\"messages\\" alter column \\"model\\" set default 'claude-3-sonnet-20240229'::text;\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"anthropic_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"azure_openai_35_turbo_id\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"azure_openai_45_turbo_id\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"azure_openai_45_vision_id\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"azure_openai_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"azure_openai_embeddings_id\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"azure_openai_endpoint\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"bio\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"google_gemini_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"groq_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"mistral_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"openai_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"openai_organization_id\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"openrouter_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"perplexity_api_key\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"profile_context\\";\n\n-- alter table \\"public\\".\\"profiles\\" drop column \\"use_azure_openai\\";\n\n-- alter table \\"public\\".\\"workspaces\\" drop column \\"embeddings_provider\\";\n\n-- alter table \\"public\\".\\"workspaces\\" alter column \\"default_model\\" drop not null;\n\n-- set check_function_bodies = off;\n\n-- CREATE OR REPLACE FUNCTION public.create_profile_and_workspace()\n--  RETURNS trigger\n--  LANGUAGE plpgsql\n--  SECURITY DEFINER\n--  SET search_path TO 'public'\n-- AS $function$\n-- DECLARE\n--     random_username TEXT;\n-- BEGIN\n--     -- Generate a random username\n--     random_username := 'user' || substr(replace(gen_random_uuid()::text, '-', ''), 1, 16);\n\n--     -- Create a profile for the new user\n--     INSERT INTO public.profiles(user_id, has_onboarded, image_url, image_path, display_name, username)\n--     VALUES(\n--         NEW.id,\n--         FALSE,\n--         '',\n--         '',\n--         '',\n--         random_username\n--     );\n\n--     INSERT INTO public.workspaces(user_id, is_home, name, default_context_length, default_model, default_prompt, default_temperature, description, embeddings_provider, include_profile_context, include_workspace_instructions, instructions)\n--     VALUES(\n--         NEW.id,\n--         TRUE,\n--         'Home',\n--         4096,\n--         'anthropic.claude-3-5-sonnet-20240620-v1:0',\n--         'You are a friendly, helpful AI assistant named Medea.',\n--         0.5,\n--         'My home workspace.',\n--         'openai',\n--         TRUE,\n--         TRUE,\n--         ''\n--     );\n\n--     RETURN NEW;\n-- END;\n-- $function$\n-- ;"}	revert
20240805211828	{"-- drop trigger if exists \\"update_assistant_collections_updated_at\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop trigger if exists \\"update_assistant_files_updated_at\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop trigger if exists \\"update_assistant_tools_updated_at\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop trigger if exists \\"update_assistant_workspaces_updated_at\\" on \\"public\\".\\"assistant_workspaces\\";\n\n-- drop trigger if exists \\"update_chat_files_updated_at\\" on \\"public\\".\\"chat_files\\";\n\n-- drop trigger if exists \\"update_collection_files_updated_at\\" on \\"public\\".\\"collection_files\\";\n\n-- drop trigger if exists \\"update_collection_workspaces_updated_at\\" on \\"public\\".\\"collection_workspaces\\";\n\n-- drop trigger if exists \\"update_collections_updated_at\\" on \\"public\\".\\"collections\\";\n\n-- drop trigger if exists \\"update_profiles_updated_at\\" on \\"public\\".\\"file_items\\";\n\n-- drop trigger if exists \\"update_file_workspaces_updated_at\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop trigger if exists \\"delete_old_file\\" on \\"public\\".\\"files\\";\n\n-- drop trigger if exists \\"update_files_updated_at\\" on \\"public\\".\\"files\\";\n\n-- drop trigger if exists \\"update_message_file_items_updated_at\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop trigger if exists \\"update_model_workspaces_updated_at\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop trigger if exists \\"update_models_updated_at\\" on \\"public\\".\\"models\\";\n\n-- drop trigger if exists \\"update_tool_workspaces_updated_at\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop trigger if exists \\"update_tools_updated_at\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow full access to own assistant_collections\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop policy \\"Allow full access to own assistant_files\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop policy \\"Allow full access to own assistant_tools\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop policy \\"Allow full access to own assistant_workspaces\\" on \\"public\\".\\"assistant_workspaces\\";\n\n-- drop policy \\"Allow full access to own chat_files\\" on \\"public\\".\\"chat_files\\";\n\n-- drop policy \\"Allow full access to own collection_files\\" on \\"public\\".\\"collection_files\\";\n\n-- drop policy \\"Allow view access to collection files for non-private collectio\\" on \\"public\\".\\"collection_files\\";\n\n-- drop policy \\"Allow full access to own collection_workspaces\\" on \\"public\\".\\"collection_workspaces\\";\n\n-- drop policy \\"Allow full access to own collections\\" on \\"public\\".\\"collections\\";\n\n-- drop policy \\"Allow view access to non-private collections\\" on \\"public\\".\\"collections\\";\n\n-- drop policy \\"Allow full access to own file items\\" on \\"public\\".\\"file_items\\";\n\n-- drop policy \\"Allow view access to non-private file items\\" on \\"public\\".\\"file_items\\";\n\n-- drop policy \\"Allow full access to own file_workspaces\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop policy \\"Allow full access to own files\\" on \\"public\\".\\"files\\";\n\n-- drop policy \\"Allow view access to files for non-private collections\\" on \\"public\\".\\"files\\";\n\n-- drop policy \\"Allow view access to non-private files\\" on \\"public\\".\\"files\\";\n\n-- drop policy \\"Allow full access to own message_file_items\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop policy \\"Allow full access to own model_workspaces\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop policy \\"Allow full access to own models\\" on \\"public\\".\\"models\\";\n\n-- drop policy \\"Allow view access to non-private models\\" on \\"public\\".\\"models\\";\n\n-- drop policy \\"Allow full access to own tool_workspaces\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop policy \\"Allow full access to own tools\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow view access to non-private tools\\" on \\"public\\".\\"tools\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collection_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collection_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collection_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop constraint \\"assistants_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_chat_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_description_check\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_name_check\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_description_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_file_path_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_name_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_type_check\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_file_item_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_message_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"messages\\" drop constraint \\"check_image_paths_length\\";\n\n-- alter table \\"public\\".\\"messages\\" drop constraint \\"messages_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_model_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_api_key_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_base_url_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_description_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_model_id_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_name_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_description_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_name_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_url_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_workspaces\\" drop constraint \\"assistant_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_pkey\\";\n\n-- alter table \\"public\\".\\"collection_files\\" drop constraint \\"collection_files_pkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"collections\\" drop constraint \\"collections_pkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_pkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"files\\" drop constraint \\"files_pkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_pkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_pkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"chat_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_embedding_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_local_embedding_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"idx_chat_files_chat_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_collection_files_collection_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_collection_files_file_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_message_file_items_message_id\\";\n\n-- drop index if exists \\"public\\".\\"message_file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_model_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"models_pkey\\";\n\n-- drop index if exists \\"public\\".\\"models_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tools_user_id_idx\\";\n\n-- drop table \\"public\\".\\"assistant_collections\\";\n\n-- drop table \\"public\\".\\"assistant_files\\";\n\n-- drop table \\"public\\".\\"assistant_tools\\";\n\n-- drop table \\"public\\".\\"assistant_workspaces\\";\n\n-- drop table \\"public\\".\\"chat_files\\";\n\n-- drop table \\"public\\".\\"collection_files\\";\n\n-- drop table \\"public\\".\\"collection_workspaces\\";\n\n-- drop table \\"public\\".\\"collections\\";\n\n-- drop table \\"public\\".\\"file_items\\";\n\n-- drop table \\"public\\".\\"file_workspaces\\";\n\n-- drop table \\"public\\".\\"files\\";\n\n-- drop table \\"public\\".\\"message_file_items\\";\n\n-- drop table \\"public\\".\\"model_workspaces\\";\n\n-- drop table \\"public\\".\\"models\\";\n\n-- drop table \\"public\\".\\"tool_workspaces\\";\n\n-- drop table \\"public\\".\\"tools\\";\n\n-- alter table \\"public\\".\\"assistants\\" drop column \\"folder_id\\";\n\n-- alter table \\"public\\".\\"messages\\" drop column \\"image_paths\\";\n\n-- alter table \\"public\\".\\"profiles\\" add column \\"aws_access_key_id\\" text null;\n\n-- alter table \\"public\\".\\"profiles\\" add column \\"aws_secret_access_key\\" text null;\n\n-- alter table \\"public\\".\\"profiles\\" add column \\"aws_session_token\\" text null;"}	remove_unneeded_tables
20240806171512	{"-- drop trigger if exists \\"update_assistant_collections_updated_at\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop trigger if exists \\"update_assistant_files_updated_at\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop trigger if exists \\"update_assistant_tools_updated_at\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop trigger if exists \\"update_chat_files_updated_at\\" on \\"public\\".\\"chat_files\\";\n\n-- drop trigger if exists \\"update_collection_workspaces_updated_at\\" on \\"public\\".\\"collection_workspaces\\";\n\n-- drop trigger if exists \\"update_profiles_updated_at\\" on \\"public\\".\\"file_items\\";\n\n-- drop trigger if exists \\"update_file_workspaces_updated_at\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop trigger if exists \\"update_message_file_items_updated_at\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop trigger if exists \\"update_model_workspaces_updated_at\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop trigger if exists \\"update_tool_workspaces_updated_at\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop trigger if exists \\"update_tools_updated_at\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow full access to own assistant_collections\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop policy \\"Allow full access to own assistant_files\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop policy \\"Allow full access to own assistant_tools\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop policy \\"Allow full access to own chat_files\\" on \\"public\\".\\"chat_files\\";\n\n-- drop policy \\"Allow full access to own collection_workspaces\\" on \\"public\\".\\"collection_workspaces\\";\n\n-- drop policy \\"Allow full access to own file items\\" on \\"public\\".\\"file_items\\";\n\n-- drop policy \\"Allow view access to non-private file items\\" on \\"public\\".\\"file_items\\";\n\n-- drop policy \\"Allow full access to own file_workspaces\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop policy \\"Allow full access to own message_file_items\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop policy \\"Allow full access to own model_workspaces\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop policy \\"Allow full access to own tool_workspaces\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop policy \\"Allow full access to own tools\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow view access to non-private tools\\" on \\"public\\".\\"tools\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"collection_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_chat_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_file_item_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_message_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_model_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_description_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_name_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_url_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_pkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_pkey\\";\n\n-- alter table \\"public\\".\\"collection_workspaces\\" drop constraint \\"collection_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"file_items\\" drop constraint \\"file_items_pkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_pkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"chat_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"collection_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_embedding_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_local_embedding_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"idx_chat_files_chat_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_message_file_items_message_id\\";\n\n-- drop index if exists \\"public\\".\\"message_file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_model_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tools_user_id_idx\\";\n\n-- drop table \\"public\\".\\"assistant_collections\\";\n\n-- drop table \\"public\\".\\"assistant_files\\";\n\n-- drop table \\"public\\".\\"assistant_tools\\";\n\n-- drop table \\"public\\".\\"chat_files\\";\n\n-- drop table \\"public\\".\\"collection_workspaces\\";\n\n-- drop table \\"public\\".\\"file_items\\";\n\n-- drop table \\"public\\".\\"file_workspaces\\";\n\n-- drop table \\"public\\".\\"message_file_items\\";\n\n-- drop table \\"public\\".\\"model_workspaces\\";\n\n-- drop table \\"public\\".\\"tool_workspaces\\";\n\n-- drop table \\"public\\".\\"tools\\";"}	new_schema
20240806345443	{"-- -- Recreate the assistants table\n-- CREATE TABLE IF NOT EXISTS public.assistants (\n--     id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,\n--     user_id UUID NOT NULL REFERENCES auth.users(id),\n--     folder_id UUID REFERENCES public.folders(id),\n--     name TEXT NOT NULL,\n--     description TEXT NOT NULL,\n--     model TEXT NOT NULL,\n--     prompt TEXT NOT NULL,\n--     temperature NUMERIC NOT NULL,\n--     context_length INTEGER NOT NULL,\n--     embeddings_provider TEXT NOT NULL,\n--     image_path TEXT NOT NULL,\n--     include_profile_context BOOLEAN NOT NULL,\n--     include_workspace_instructions BOOLEAN NOT NULL,\n--     sharing TEXT NOT NULL DEFAULT 'private',\n--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,\n--     updated_at TIMESTAMP WITH TIME ZONE\n-- );\n\n-- -- Add indexes\n-- -- CREATE INDEX assistants_user_id_idx ON public.assistants (user_id);\n-- -- CREATE INDEX assistants_folder_id_idx ON public.assistants (folder_id);\n\n-- -- Add RLS policies\n-- ALTER TABLE public.assistants ENABLE ROW LEVEL SECURITY;\n\n-- CREATE POLICY \\"Users can create their own assistants\\"\n-- ON public.assistants FOR INSERT\n-- TO authenticated\n-- WITH CHECK (auth.uid() = user_id);\n\n-- CREATE POLICY \\"Users can view their own assistants\\"\n-- ON public.assistants FOR SELECT\n-- TO authenticated\n-- USING (auth.uid() = user_id);\n\n-- CREATE POLICY \\"Users can update their own assistants\\"\n-- ON public.assistants FOR UPDATE\n-- TO authenticated\n-- USING (auth.uid() = user_id);\n\n-- CREATE POLICY \\"Users can delete their own assistants\\"\n-- ON public.assistants FOR DELETE\n-- TO authenticated\n-- USING (auth.uid() = user_id);\n\n-- -- Add assistant_id to messages table\n-- -- ALTER TABLE public.messages\n-- -- ADD COLUMN assistant_id UUID REFERENCES public.assistants(id);\n\n-- -- Create index on assistant_id in messages table\n-- CREATE INDEX messages_assistant_id_idx ON public.messages (assistant_id);\n\n-- -- Add trigger for updated_at\n-- -- CREATE TRIGGER set_updated_at\n-- -- BEFORE UPDATE ON public.assistants\n-- -- FOR EACH ROW\n-- -- EXECUTE FUNCTION public.set_updated_at();\n\n-- -- Grant permissions\n-- GRANT ALL ON public.assistants TO authenticated;\n-- GRANT ALL ON public.assistants TO service_role"}	assistants
20240807164617	{"-- drop trigger if exists \\"update_assistant_collections_updated_at\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop trigger if exists \\"update_assistant_files_updated_at\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop trigger if exists \\"update_assistant_tools_updated_at\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop trigger if exists \\"update_chat_files_updated_at\\" on \\"public\\".\\"chat_files\\";\n\n-- drop trigger if exists \\"update_file_workspaces_updated_at\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop trigger if exists \\"update_tool_workspaces_updated_at\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop trigger if exists \\"update_tools_updated_at\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow full access to own assistant_collections\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop policy \\"Allow full access to own assistant_files\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop policy \\"Allow full access to own assistant_tools\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop policy \\"Allow full access to own chat_files\\" on \\"public\\".\\"chat_files\\";\n\n-- drop policy \\"Allow full access to own file_workspaces\\" on \\"public\\".\\"file_workspaces\\";\n\n-- drop policy \\"Allow full access to own tool_workspaces\\" on \\"public\\".\\"tool_workspaces\\";\n\n-- drop policy \\"Allow full access to own tools\\" on \\"public\\".\\"tools\\";\n\n-- drop policy \\"Allow view access to non-private tools\\" on \\"public\\".\\"tools\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"file_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tool_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"tools\\" from \\"service_role\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_chat_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_description_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_name_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_url_check\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_pkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_pkey\\";\n\n-- alter table \\"public\\".\\"file_workspaces\\" drop constraint \\"file_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"tool_workspaces\\" drop constraint \\"tool_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"tools\\" drop constraint \\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"chat_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"file_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"idx_chat_files_chat_id\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tool_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"tools_user_id_idx\\";\n\n-- drop table \\"public\\".\\"assistant_collections\\";\n\n-- drop table \\"public\\".\\"assistant_files\\";\n\n-- drop table \\"public\\".\\"assistant_tools\\";\n\n-- drop table \\"public\\".\\"chat_files\\";\n\n-- drop table \\"public\\".\\"file_workspaces\\";\n\n-- drop table \\"public\\".\\"tool_workspaces\\";\n\n-- drop table \\"public\\".\\"tools\\";"}	slower_day2
20240807170514	{"-- drop trigger if exists \\"update_assistant_collections_updated_at\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop trigger if exists \\"update_assistant_files_updated_at\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop trigger if exists \\"update_assistant_tools_updated_at\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop trigger if exists \\"update_chat_files_updated_at\\" on \\"public\\".\\"chat_files\\";\n\n-- drop trigger if exists \\"update_message_file_items_updated_at\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop trigger if exists \\"update_model_workspaces_updated_at\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop trigger if exists \\"update_models_updated_at\\" on \\"public\\".\\"models\\";\n\n-- drop policy \\"Allow full access to own assistant_collections\\" on \\"public\\".\\"assistant_collections\\";\n\n-- drop policy \\"Allow full access to own assistant_files\\" on \\"public\\".\\"assistant_files\\";\n\n-- drop policy \\"Allow full access to own assistant_tools\\" on \\"public\\".\\"assistant_tools\\";\n\n-- drop policy \\"Allow full access to own chat_files\\" on \\"public\\".\\"chat_files\\";\n\n-- drop policy \\"Allow full access to own message_file_items\\" on \\"public\\".\\"message_file_items\\";\n\n-- drop policy \\"Allow full access to own model_workspaces\\" on \\"public\\".\\"model_workspaces\\";\n\n-- drop policy \\"Allow full access to own models\\" on \\"public\\".\\"models\\";\n\n-- drop policy \\"Allow view access to non-private models\\" on \\"public\\".\\"models\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_collections\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"assistant_tools\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"chat_files\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"message_file_items\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"model_workspaces\\" from \\"service_role\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"anon\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"authenticated\\";\n\n-- revoke delete on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke insert on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke references on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke select on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke trigger on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke truncate on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- revoke update on table \\"public\\".\\"models\\" from \\"service_role\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_collection_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_assistant_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_tool_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_chat_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_file_id_fkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_file_item_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_message_id_fkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_model_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_workspace_id_fkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_api_key_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_base_url_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_description_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_folder_id_fkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_model_id_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_name_check\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_user_id_fkey\\";\n\n-- alter table \\"public\\".\\"assistant_collections\\" drop constraint \\"assistant_collections_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_files\\" drop constraint \\"assistant_files_pkey\\";\n\n-- alter table \\"public\\".\\"assistant_tools\\" drop constraint \\"assistant_tools_pkey\\";\n\n-- alter table \\"public\\".\\"chat_files\\" drop constraint \\"chat_files_pkey\\";\n\n-- alter table \\"public\\".\\"message_file_items\\" drop constraint \\"message_file_items_pkey\\";\n\n-- alter table \\"public\\".\\"model_workspaces\\" drop constraint \\"model_workspaces_pkey\\";\n\n-- alter table \\"public\\".\\"models\\" drop constraint \\"models_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_collection_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_collections_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_file_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_files_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_assistant_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_pkey\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_tool_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"assistant_tools_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"chat_files_pkey\\";\n\n-- drop index if exists \\"public\\".\\"idx_chat_files_chat_id\\";\n\n-- drop index if exists \\"public\\".\\"idx_message_file_items_message_id\\";\n\n-- drop index if exists \\"public\\".\\"message_file_items_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_model_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_pkey\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_user_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"model_workspaces_workspace_id_idx\\";\n\n-- drop index if exists \\"public\\".\\"models_pkey\\";\n\n-- drop index if exists \\"public\\".\\"models_user_id_idx\\";\n\n-- drop table \\"public\\".\\"assistant_collections\\";\n\n-- drop table \\"public\\".\\"assistant_files\\";\n\n-- drop table \\"public\\".\\"assistant_tools\\";\n\n-- drop table \\"public\\".\\"chat_files\\";\n\n-- drop table \\"public\\".\\"message_file_items\\";\n\n-- drop table \\"public\\".\\"model_workspaces\\";\n\n-- drop table \\"public\\".\\"models\\";"}	slower_day3
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: assistant_collections assistant_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_pkey PRIMARY KEY (assistant_id, collection_id);


--
-- Name: assistant_files assistant_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_pkey PRIMARY KEY (assistant_id, file_id);


--
-- Name: assistant_tools assistant_tools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_pkey PRIMARY KEY (assistant_id, tool_id);


--
-- Name: assistant_workspaces assistant_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_pkey PRIMARY KEY (assistant_id, workspace_id);


--
-- Name: assistants assistants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_pkey PRIMARY KEY (id);


--
-- Name: chat_files chat_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_pkey PRIMARY KEY (chat_id, file_id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: collection_files collection_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_pkey PRIMARY KEY (collection_id, file_id);


--
-- Name: collection_workspaces collection_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_pkey PRIMARY KEY (collection_id, workspace_id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: file_items file_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_items
    ADD CONSTRAINT file_items_pkey PRIMARY KEY (id);


--
-- Name: file_workspaces file_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_pkey PRIMARY KEY (file_id, workspace_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: folders folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- Name: message_file_items message_file_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_pkey PRIMARY KEY (message_id, file_item_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: model_workspaces model_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_pkey PRIMARY KEY (model_id, workspace_id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: preset_workspaces preset_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_pkey PRIMARY KEY (preset_id, workspace_id);


--
-- Name: presets presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presets
    ADD CONSTRAINT presets_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_key UNIQUE (user_id);


--
-- Name: profiles profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);


--
-- Name: prompt_workspaces prompt_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_pkey PRIMARY KEY (prompt_id, workspace_id);


--
-- Name: prompts prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_pkey PRIMARY KEY (id);


--
-- Name: tool_workspaces tool_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_pkey PRIMARY KEY (tool_id, workspace_id);


--
-- Name: tools tools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (id);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: assistant_collections_assistant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_collections_assistant_id_idx ON public.assistant_collections USING btree (assistant_id);


--
-- Name: assistant_collections_collection_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_collections_collection_id_idx ON public.assistant_collections USING btree (collection_id);


--
-- Name: assistant_collections_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_collections_user_id_idx ON public.assistant_collections USING btree (user_id);


--
-- Name: assistant_files_assistant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_files_assistant_id_idx ON public.assistant_files USING btree (assistant_id);


--
-- Name: assistant_files_file_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_files_file_id_idx ON public.assistant_files USING btree (file_id);


--
-- Name: assistant_files_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_files_user_id_idx ON public.assistant_files USING btree (user_id);


--
-- Name: assistant_tools_assistant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_tools_assistant_id_idx ON public.assistant_tools USING btree (assistant_id);


--
-- Name: assistant_tools_tool_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_tools_tool_id_idx ON public.assistant_tools USING btree (tool_id);


--
-- Name: assistant_tools_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_tools_user_id_idx ON public.assistant_tools USING btree (user_id);


--
-- Name: assistant_workspaces_assistant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_workspaces_assistant_id_idx ON public.assistant_workspaces USING btree (assistant_id);


--
-- Name: assistant_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_workspaces_user_id_idx ON public.assistant_workspaces USING btree (user_id);


--
-- Name: assistant_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_workspaces_workspace_id_idx ON public.assistant_workspaces USING btree (workspace_id);


--
-- Name: assistants_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistants_user_id_idx ON public.assistants USING btree (user_id);


--
-- Name: collection_workspaces_collection_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX collection_workspaces_collection_id_idx ON public.collection_workspaces USING btree (collection_id);


--
-- Name: collection_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX collection_workspaces_user_id_idx ON public.collection_workspaces USING btree (user_id);


--
-- Name: collection_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX collection_workspaces_workspace_id_idx ON public.collection_workspaces USING btree (workspace_id);


--
-- Name: collections_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX collections_user_id_idx ON public.collections USING btree (user_id);


--
-- Name: file_items_embedding_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_items_embedding_idx ON public.file_items USING hnsw (openai_embedding extensions.vector_cosine_ops);


--
-- Name: file_items_file_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_items_file_id_idx ON public.file_items USING btree (file_id);


--
-- Name: file_items_local_embedding_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_items_local_embedding_idx ON public.file_items USING hnsw (local_embedding extensions.vector_cosine_ops);


--
-- Name: file_workspaces_file_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_workspaces_file_id_idx ON public.file_workspaces USING btree (file_id);


--
-- Name: file_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_workspaces_user_id_idx ON public.file_workspaces USING btree (user_id);


--
-- Name: file_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_workspaces_workspace_id_idx ON public.file_workspaces USING btree (workspace_id);


--
-- Name: files_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_user_id_idx ON public.files USING btree (user_id);


--
-- Name: folders_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX folders_user_id_idx ON public.folders USING btree (user_id);


--
-- Name: folders_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX folders_workspace_id_idx ON public.folders USING btree (workspace_id);


--
-- Name: idx_chat_files_chat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_files_chat_id ON public.chat_files USING btree (chat_id);


--
-- Name: idx_chats_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chats_user_id ON public.chats USING btree (user_id);


--
-- Name: idx_chats_workspace_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chats_workspace_id ON public.chats USING btree (workspace_id);


--
-- Name: idx_collection_files_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_collection_files_collection_id ON public.collection_files USING btree (collection_id);


--
-- Name: idx_collection_files_file_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_collection_files_file_id ON public.collection_files USING btree (file_id);


--
-- Name: idx_message_file_items_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_message_file_items_message_id ON public.message_file_items USING btree (message_id);


--
-- Name: idx_messages_chat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_chat_id ON public.messages USING btree (chat_id);


--
-- Name: idx_profiles_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_user_id ON public.profiles USING btree (user_id);


--
-- Name: idx_unique_home_workspace_per_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_unique_home_workspace_per_user ON public.workspaces USING btree (user_id) WHERE is_home;


--
-- Name: idx_workspaces_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_workspaces_user_id ON public.workspaces USING btree (user_id);


--
-- Name: model_workspaces_model_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_workspaces_model_id_idx ON public.model_workspaces USING btree (model_id);


--
-- Name: model_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_workspaces_user_id_idx ON public.model_workspaces USING btree (user_id);


--
-- Name: model_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_workspaces_workspace_id_idx ON public.model_workspaces USING btree (workspace_id);


--
-- Name: models_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX models_user_id_idx ON public.models USING btree (user_id);


--
-- Name: preset_workspaces_preset_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX preset_workspaces_preset_id_idx ON public.preset_workspaces USING btree (preset_id);


--
-- Name: preset_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX preset_workspaces_user_id_idx ON public.preset_workspaces USING btree (user_id);


--
-- Name: preset_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX preset_workspaces_workspace_id_idx ON public.preset_workspaces USING btree (workspace_id);


--
-- Name: presets_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX presets_user_id_idx ON public.presets USING btree (user_id);


--
-- Name: prompt_workspaces_prompt_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prompt_workspaces_prompt_id_idx ON public.prompt_workspaces USING btree (prompt_id);


--
-- Name: prompt_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prompt_workspaces_user_id_idx ON public.prompt_workspaces USING btree (user_id);


--
-- Name: prompt_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prompt_workspaces_workspace_id_idx ON public.prompt_workspaces USING btree (workspace_id);


--
-- Name: prompts_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prompts_user_id_idx ON public.prompts USING btree (user_id);


--
-- Name: tool_workspaces_tool_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tool_workspaces_tool_id_idx ON public.tool_workspaces USING btree (tool_id);


--
-- Name: tool_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tool_workspaces_user_id_idx ON public.tool_workspaces USING btree (user_id);


--
-- Name: tool_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tool_workspaces_workspace_id_idx ON public.tool_workspaces USING btree (workspace_id);


--
-- Name: tools_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tools_user_id_idx ON public.tools USING btree (user_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: users create_profile_and_workspace_trigger; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER create_profile_and_workspace_trigger AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.create_profile_and_workspace();


--
-- Name: assistants delete_old_assistant_image; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_old_assistant_image AFTER DELETE ON public.assistants FOR EACH ROW EXECUTE FUNCTION public.delete_old_assistant_image();


--
-- Name: files delete_old_file; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_old_file BEFORE DELETE ON public.files FOR EACH ROW EXECUTE FUNCTION public.delete_old_file();


--
-- Name: messages delete_old_message_images; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_old_message_images AFTER DELETE ON public.messages FOR EACH ROW EXECUTE FUNCTION public.delete_old_message_images();


--
-- Name: profiles delete_old_profile_image; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_old_profile_image AFTER DELETE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.delete_old_profile_image();


--
-- Name: workspaces delete_old_workspace_image; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_old_workspace_image AFTER DELETE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.delete_old_workspace_image();


--
-- Name: workspaces prevent_update_of_home_field; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER prevent_update_of_home_field BEFORE UPDATE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.prevent_home_field_update();


--
-- Name: assistant_collections update_assistant_collections_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_assistant_collections_updated_at BEFORE UPDATE ON public.assistant_collections FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistant_files update_assistant_files_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_assistant_files_updated_at BEFORE UPDATE ON public.assistant_files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistant_tools update_assistant_tools_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_assistant_tools_updated_at BEFORE UPDATE ON public.assistant_tools FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistant_workspaces update_assistant_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_assistant_workspaces_updated_at BEFORE UPDATE ON public.assistant_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistants update_assistants_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_assistants_updated_at BEFORE UPDATE ON public.assistants FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: chat_files update_chat_files_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_chat_files_updated_at BEFORE UPDATE ON public.chat_files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: chats update_chats_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_chats_updated_at BEFORE UPDATE ON public.chats FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: collection_files update_collection_files_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_collection_files_updated_at BEFORE UPDATE ON public.collection_files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: collection_workspaces update_collection_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_collection_workspaces_updated_at BEFORE UPDATE ON public.collection_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: collections update_collections_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_collections_updated_at BEFORE UPDATE ON public.collections FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: file_workspaces update_file_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_file_workspaces_updated_at BEFORE UPDATE ON public.file_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: files update_files_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_files_updated_at BEFORE UPDATE ON public.files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: folders update_folders_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_folders_updated_at BEFORE UPDATE ON public.folders FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: message_file_items update_message_file_items_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_message_file_items_updated_at BEFORE UPDATE ON public.message_file_items FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: messages update_messages_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_messages_updated_at BEFORE UPDATE ON public.messages FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: model_workspaces update_model_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_model_workspaces_updated_at BEFORE UPDATE ON public.model_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: models update_models_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_models_updated_at BEFORE UPDATE ON public.models FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: preset_workspaces update_preset_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_preset_workspaces_updated_at BEFORE UPDATE ON public.preset_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: presets update_presets_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_presets_updated_at BEFORE UPDATE ON public.presets FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: file_items update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.file_items FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: profiles update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: prompt_workspaces update_prompt_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_prompt_workspaces_updated_at BEFORE UPDATE ON public.prompt_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: prompts update_prompts_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_prompts_updated_at BEFORE UPDATE ON public.prompts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: tool_workspaces update_tool_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_tool_workspaces_updated_at BEFORE UPDATE ON public.tool_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: tools update_tools_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_tools_updated_at BEFORE UPDATE ON public.tools FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: workspaces update_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_workspaces_updated_at BEFORE UPDATE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: assistant_collections assistant_collections_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_collections assistant_collections_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON DELETE CASCADE;


--
-- Name: assistant_collections assistant_collections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_files assistant_files_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_files assistant_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: assistant_files assistant_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_tools assistant_tools_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_tools assistant_tools_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tools(id) ON DELETE CASCADE;


--
-- Name: assistant_tools assistant_tools_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_workspaces assistant_workspaces_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_workspaces assistant_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_workspaces assistant_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: assistants assistants_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: assistants assistants_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chat_files chat_files_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_files chat_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: chat_files chat_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chats chats_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: chats chats_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: chats chats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chats chats_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: collection_files collection_files_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON DELETE CASCADE;


--
-- Name: collection_files collection_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: collection_files collection_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: collection_workspaces collection_workspaces_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON DELETE CASCADE;


--
-- Name: collection_workspaces collection_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: collection_workspaces collection_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: collections collections_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: collections collections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: file_items file_items_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_items
    ADD CONSTRAINT file_items_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: file_items file_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_items
    ADD CONSTRAINT file_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: file_workspaces file_workspaces_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: file_workspaces file_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: file_workspaces file_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: files files_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: files files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: folders folders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: folders folders_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: message_file_items message_file_items_file_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_file_item_id_fkey FOREIGN KEY (file_item_id) REFERENCES public.file_items(id) ON DELETE CASCADE;


--
-- Name: message_file_items message_file_items_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: message_file_items message_file_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: messages messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: model_workspaces model_workspaces_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- Name: model_workspaces model_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: model_workspaces model_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: models models_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: models models_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: preset_workspaces preset_workspaces_preset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_preset_id_fkey FOREIGN KEY (preset_id) REFERENCES public.presets(id) ON DELETE CASCADE;


--
-- Name: preset_workspaces preset_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: preset_workspaces preset_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: presets presets_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presets
    ADD CONSTRAINT presets_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: presets presets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presets
    ADD CONSTRAINT presets_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: prompt_workspaces prompt_workspaces_prompt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_prompt_id_fkey FOREIGN KEY (prompt_id) REFERENCES public.prompts(id) ON DELETE CASCADE;


--
-- Name: prompt_workspaces prompt_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: prompt_workspaces prompt_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: prompts prompts_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: prompts prompts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: tool_workspaces tool_workspaces_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tools(id) ON DELETE CASCADE;


--
-- Name: tool_workspaces tool_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: tool_workspaces tool_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: tools tools_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: tools tools_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: workspaces workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: assistant_collections Allow full access to own assistant_collections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own assistant_collections" ON public.assistant_collections USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistant_files Allow full access to own assistant_files; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own assistant_files" ON public.assistant_files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistant_tools Allow full access to own assistant_tools; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own assistant_tools" ON public.assistant_tools USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistant_workspaces Allow full access to own assistant_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own assistant_workspaces" ON public.assistant_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistants Allow full access to own assistants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own assistants" ON public.assistants USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: chat_files Allow full access to own chat_files; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own chat_files" ON public.chat_files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: chats Allow full access to own chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own chats" ON public.chats USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collection_files Allow full access to own collection_files; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own collection_files" ON public.collection_files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collection_workspaces Allow full access to own collection_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own collection_workspaces" ON public.collection_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collections Allow full access to own collections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own collections" ON public.collections USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: file_items Allow full access to own file items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own file items" ON public.file_items USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: file_workspaces Allow full access to own file_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own file_workspaces" ON public.file_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: files Allow full access to own files; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own files" ON public.files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: folders Allow full access to own folders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own folders" ON public.folders USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: message_file_items Allow full access to own message_file_items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own message_file_items" ON public.message_file_items USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: messages Allow full access to own messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own messages" ON public.messages USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: model_workspaces Allow full access to own model_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own model_workspaces" ON public.model_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: models Allow full access to own models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own models" ON public.models USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: preset_workspaces Allow full access to own preset_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own preset_workspaces" ON public.preset_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: presets Allow full access to own presets; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own presets" ON public.presets USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: profiles Allow full access to own profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own profiles" ON public.profiles USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: prompt_workspaces Allow full access to own prompt_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own prompt_workspaces" ON public.prompt_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: prompts Allow full access to own prompts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own prompts" ON public.prompts USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: tool_workspaces Allow full access to own tool_workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own tool_workspaces" ON public.tool_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: tools Allow full access to own tools; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own tools" ON public.tools USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: workspaces Allow full access to own workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow full access to own workspaces" ON public.workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collection_files Allow view access to collection files for non-private collectio; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to collection files for non-private collectio" ON public.collection_files FOR SELECT USING ((collection_id IN ( SELECT collections.id
   FROM public.collections
  WHERE (collections.sharing <> 'private'::text))));


--
-- Name: files Allow view access to files for non-private collections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to files for non-private collections" ON public.files FOR SELECT USING ((id IN ( SELECT collection_files.file_id
   FROM public.collection_files
  WHERE (collection_files.collection_id IN ( SELECT collections.id
           FROM public.collections
          WHERE (collections.sharing <> 'private'::text))))));


--
-- Name: messages Allow view access to messages for non-private chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to messages for non-private chats" ON public.messages FOR SELECT USING ((chat_id IN ( SELECT chats.id
   FROM public.chats
  WHERE (chats.sharing <> 'private'::text))));


--
-- Name: assistants Allow view access to non-private assistants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private assistants" ON public.assistants FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: chats Allow view access to non-private chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private chats" ON public.chats FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: collections Allow view access to non-private collections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private collections" ON public.collections FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: file_items Allow view access to non-private file items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private file items" ON public.file_items FOR SELECT USING ((file_id IN ( SELECT files.id
   FROM public.files
  WHERE (files.sharing <> 'private'::text))));


--
-- Name: files Allow view access to non-private files; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private files" ON public.files FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: models Allow view access to non-private models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private models" ON public.models FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: presets Allow view access to non-private presets; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private presets" ON public.presets FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: prompts Allow view access to non-private prompts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private prompts" ON public.prompts FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: tools Allow view access to non-private tools; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private tools" ON public.tools FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: workspaces Allow view access to non-private workspaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow view access to non-private workspaces" ON public.workspaces FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: assistant_collections; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assistant_collections ENABLE ROW LEVEL SECURITY;

--
-- Name: assistant_files; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assistant_files ENABLE ROW LEVEL SECURITY;

--
-- Name: assistant_tools; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assistant_tools ENABLE ROW LEVEL SECURITY;

--
-- Name: assistant_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assistant_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: assistants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assistants ENABLE ROW LEVEL SECURITY;

--
-- Name: chat_files; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.chat_files ENABLE ROW LEVEL SECURITY;

--
-- Name: chats; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.chats ENABLE ROW LEVEL SECURITY;

--
-- Name: collection_files; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.collection_files ENABLE ROW LEVEL SECURITY;

--
-- Name: collection_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.collection_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: collections; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.collections ENABLE ROW LEVEL SECURITY;

--
-- Name: file_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.file_items ENABLE ROW LEVEL SECURITY;

--
-- Name: file_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.file_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: files; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.files ENABLE ROW LEVEL SECURITY;

--
-- Name: folders; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.folders ENABLE ROW LEVEL SECURITY;

--
-- Name: message_file_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.message_file_items ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: model_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.model_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: models; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.models ENABLE ROW LEVEL SECURITY;

--
-- Name: preset_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.preset_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: presets; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.presets ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: prompt_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.prompt_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: prompts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.prompts ENABLE ROW LEVEL SECURITY;

--
-- Name: tool_workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.tool_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: tools; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.tools ENABLE ROW LEVEL SECURITY;

--
-- Name: workspaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow authenticated delete access to own file; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated delete access to own file" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'files'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated delete access to own profile images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated delete access to own profile images" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'profile_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated insert access to own file; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated insert access to own file" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'files'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated insert access to own profile images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated insert access to own profile images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'profile_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated update access to own file; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated update access to own file" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'files'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated update access to own profile images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated update access to own profile images" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'profile_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow delete access to own assistant images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow delete access to own assistant images" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'assistant_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow delete access to own message images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow delete access to own message images" ON storage.objects FOR DELETE USING (((bucket_id = 'message_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow delete access to own workspace images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow delete access to own workspace images" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'workspace_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow insert access to own assistant images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow insert access to own assistant images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'assistant_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow insert access to own message images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow insert access to own message images" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'message_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow insert access to own workspace images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow insert access to own workspace images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'workspace_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow public read access on non-private assistant images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow public read access on non-private assistant images" ON storage.objects FOR SELECT USING (((bucket_id = 'assistant_images'::text) AND public.non_private_assistant_exists(name)));


--
-- Name: objects Allow public read access on non-private files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow public read access on non-private files" ON storage.objects FOR SELECT USING (((bucket_id = 'files'::text) AND public.non_private_file_exists(name)));


--
-- Name: objects Allow public read access on non-private workspace images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow public read access on non-private workspace images" ON storage.objects FOR SELECT USING (((bucket_id = 'workspace_images'::text) AND public.non_private_workspace_exists(name)));


--
-- Name: objects Allow public read access on profile images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow public read access on profile images" ON storage.objects FOR SELECT USING ((bucket_id = 'profile_images'::text));


--
-- Name: objects Allow read access to own message images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow read access to own message images" ON storage.objects FOR SELECT USING (((bucket_id = 'message_images'::text) AND (((storage.foldername(name))[1] = (auth.uid())::text) OR (EXISTS ( SELECT 1
   FROM public.chats
  WHERE ((chats.id = ( SELECT messages.chat_id
           FROM public.messages
          WHERE (messages.id = ((storage.foldername(chats.name))[2])::uuid))) AND (chats.sharing <> 'private'::text)))))));


--
-- Name: objects Allow update access to own assistant images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow update access to own assistant images" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'assistant_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow update access to own message images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow update access to own message images" ON storage.objects FOR UPDATE USING (((bucket_id = 'message_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow update access to own workspace images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow update access to own workspace images" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'workspace_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow users to read their own files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow users to read their own files" ON storage.objects FOR SELECT TO authenticated USING (((auth.uid())::text = owner_id));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: FUNCTION halfvec_in(cstring, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_in(cstring, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_out(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_out(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_recv(internal, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_recv(internal, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_send(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_send(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_typmod_in(cstring[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_typmod_in(cstring[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_in(cstring, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_in(cstring, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_out(extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_out(extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_recv(internal, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_recv(internal, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_send(extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_send(extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_typmod_in(cstring[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_typmod_in(cstring[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_in(cstring, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_in(cstring, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_out(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_out(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_recv(internal, oid, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_recv(internal, oid, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_send(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_send(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_typmod_in(cstring[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_typmod_in(cstring[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_halfvec(real[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_halfvec(real[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_vector(real[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_vector(real[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_halfvec(double precision[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_halfvec(double precision[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_vector(double precision[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_vector(double precision[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_halfvec(integer[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_halfvec(integer[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_vector(integer[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_vector(integer[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_halfvec(numeric[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_halfvec(numeric[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION array_to_vector(numeric[], integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.array_to_vector(numeric[], integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_to_float4(extensions.halfvec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_to_float4(extensions.halfvec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec(extensions.halfvec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec(extensions.halfvec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_to_sparsevec(extensions.halfvec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_to_sparsevec(extensions.halfvec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_to_vector(extensions.halfvec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_to_vector(extensions.halfvec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_to_halfvec(extensions.sparsevec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_to_halfvec(extensions.sparsevec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec(extensions.sparsevec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec(extensions.sparsevec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_to_vector(extensions.sparsevec, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_to_vector(extensions.sparsevec, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_to_float4(extensions.vector, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_to_float4(extensions.vector, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_to_halfvec(extensions.vector, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_to_halfvec(extensions.vector, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_to_sparsevec(extensions.vector, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_to_sparsevec(extensions.vector, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector(extensions.vector, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector(extensions.vector, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION binary_quantize(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.binary_quantize(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION binary_quantize(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.binary_quantize(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cosine_distance(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cosine_distance(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cosine_distance(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cosine_distance(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cosine_distance(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cosine_distance(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION halfvec_accum(double precision[], extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_accum(double precision[], extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_add(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_add(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_avg(double precision[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_avg(double precision[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_cmp(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_cmp(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_combine(double precision[], double precision[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_combine(double precision[], double precision[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_concat(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_concat(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_eq(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_eq(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_ge(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_ge(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_gt(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_gt(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_l2_squared_distance(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_l2_squared_distance(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_le(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_le(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_lt(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_lt(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_mul(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_mul(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_ne(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_ne(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_negative_inner_product(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_negative_inner_product(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_spherical_distance(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_spherical_distance(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_sub(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.halfvec_sub(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hamming_distance(bit, bit); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hamming_distance(bit, bit) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hnsw_bit_support(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hnsw_bit_support(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hnsw_halfvec_support(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hnsw_halfvec_support(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hnsw_sparsevec_support(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hnsw_sparsevec_support(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hnswhandler(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hnswhandler(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http(request extensions.http_request); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http(request extensions.http_request) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_delete(uri character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_delete(uri character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_delete(uri character varying, content character varying, content_type character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_delete(uri character varying, content character varying, content_type character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_get(uri character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_get(uri character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_get(uri character varying, data jsonb); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_get(uri character varying, data jsonb) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_head(uri character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_head(uri character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_header(field character varying, value character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_header(field character varying, value character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_list_curlopt(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_list_curlopt() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_patch(uri character varying, content character varying, content_type character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_patch(uri character varying, content character varying, content_type character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_post(uri character varying, data jsonb); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_post(uri character varying, data jsonb) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_post(uri character varying, content character varying, content_type character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_post(uri character varying, content character varying, content_type character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_put(uri character varying, content character varying, content_type character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_put(uri character varying, content character varying, content_type character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_reset_curlopt(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_reset_curlopt() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION http_set_curlopt(curlopt character varying, value character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.http_set_curlopt(curlopt character varying, value character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION inner_product(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.inner_product(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION inner_product(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.inner_product(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION inner_product(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.inner_product(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION ivfflat_bit_support(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ivfflat_bit_support(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION ivfflat_halfvec_support(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ivfflat_halfvec_support(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION ivfflathandler(internal); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ivfflathandler(internal) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION jaccard_distance(bit, bit); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.jaccard_distance(bit, bit) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l1_distance(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l1_distance(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l1_distance(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l1_distance(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l1_distance(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l1_distance(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_distance(extensions.halfvec, extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_distance(extensions.halfvec, extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_distance(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_distance(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_distance(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_distance(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_norm(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_norm(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_norm(extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_norm(extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_normalize(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_normalize(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_normalize(extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_normalize(extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION l2_normalize(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.l2_normalize(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_cmp(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_cmp(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_eq(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_eq(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_ge(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_ge(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_gt(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_gt(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_l2_squared_distance(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_l2_squared_distance(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_le(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_le(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_lt(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_lt(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_ne(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_ne(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sparsevec_negative_inner_product(extensions.sparsevec, extensions.sparsevec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sparsevec_negative_inner_product(extensions.sparsevec, extensions.sparsevec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION subvector(extensions.halfvec, integer, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.subvector(extensions.halfvec, integer, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION subvector(extensions.vector, integer, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.subvector(extensions.vector, integer, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION urlencode(string bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.urlencode(string bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION urlencode(data jsonb); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.urlencode(data jsonb) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION urlencode(string character varying); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.urlencode(string character varying) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_accum(double precision[], extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_accum(double precision[], extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_add(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_add(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_avg(double precision[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_avg(double precision[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_cmp(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_cmp(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_combine(double precision[], double precision[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_combine(double precision[], double precision[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_concat(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_concat(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_dims(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_dims(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_dims(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_dims(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_eq(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_eq(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_ge(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_ge(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_gt(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_gt(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_l2_squared_distance(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_l2_squared_distance(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_le(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_le(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_lt(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_lt(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_mul(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_mul(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_ne(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_ne(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_negative_inner_product(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_negative_inner_product(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_norm(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_norm(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_spherical_distance(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_spherical_distance(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION vector_sub(extensions.vector, extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.vector_sub(extensions.vector, extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer); Type: ACL; Schema: net; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;


--
-- Name: FUNCTION http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer); Type: ACL; Schema: net; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid) TO service_role;


--
-- Name: FUNCTION create_profile_and_workspace(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_profile_and_workspace() TO anon;
GRANT ALL ON FUNCTION public.create_profile_and_workspace() TO authenticated;
GRANT ALL ON FUNCTION public.create_profile_and_workspace() TO service_role;


--
-- Name: FUNCTION delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) TO anon;
GRANT ALL ON FUNCTION public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) TO authenticated;
GRANT ALL ON FUNCTION public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) TO service_role;


--
-- Name: FUNCTION delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) TO anon;
GRANT ALL ON FUNCTION public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) TO authenticated;
GRANT ALL ON FUNCTION public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) TO service_role;


--
-- Name: FUNCTION delete_old_assistant_image(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_old_assistant_image() TO anon;
GRANT ALL ON FUNCTION public.delete_old_assistant_image() TO authenticated;
GRANT ALL ON FUNCTION public.delete_old_assistant_image() TO service_role;


--
-- Name: FUNCTION delete_old_file(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_old_file() TO anon;
GRANT ALL ON FUNCTION public.delete_old_file() TO authenticated;
GRANT ALL ON FUNCTION public.delete_old_file() TO service_role;


--
-- Name: FUNCTION delete_old_message_images(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_old_message_images() TO anon;
GRANT ALL ON FUNCTION public.delete_old_message_images() TO authenticated;
GRANT ALL ON FUNCTION public.delete_old_message_images() TO service_role;


--
-- Name: FUNCTION delete_old_profile_image(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_old_profile_image() TO anon;
GRANT ALL ON FUNCTION public.delete_old_profile_image() TO authenticated;
GRANT ALL ON FUNCTION public.delete_old_profile_image() TO service_role;


--
-- Name: FUNCTION delete_old_workspace_image(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_old_workspace_image() TO anon;
GRANT ALL ON FUNCTION public.delete_old_workspace_image() TO authenticated;
GRANT ALL ON FUNCTION public.delete_old_workspace_image() TO service_role;


--
-- Name: FUNCTION delete_storage_object(bucket text, object text, OUT status integer, OUT content text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_storage_object(bucket text, object text, OUT status integer, OUT content text) TO anon;
GRANT ALL ON FUNCTION public.delete_storage_object(bucket text, object text, OUT status integer, OUT content text) TO authenticated;
GRANT ALL ON FUNCTION public.delete_storage_object(bucket text, object text, OUT status integer, OUT content text) TO service_role;


--
-- Name: FUNCTION delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text) TO anon;
GRANT ALL ON FUNCTION public.delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text) TO authenticated;
GRANT ALL ON FUNCTION public.delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text) TO service_role;


--
-- Name: FUNCTION match_file_items_local(query_embedding extensions.vector, match_count integer, file_ids uuid[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.match_file_items_local(query_embedding extensions.vector, match_count integer, file_ids uuid[]) TO anon;
GRANT ALL ON FUNCTION public.match_file_items_local(query_embedding extensions.vector, match_count integer, file_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.match_file_items_local(query_embedding extensions.vector, match_count integer, file_ids uuid[]) TO service_role;


--
-- Name: FUNCTION match_file_items_openai(query_embedding extensions.vector, match_count integer, file_ids uuid[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.match_file_items_openai(query_embedding extensions.vector, match_count integer, file_ids uuid[]) TO anon;
GRANT ALL ON FUNCTION public.match_file_items_openai(query_embedding extensions.vector, match_count integer, file_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.match_file_items_openai(query_embedding extensions.vector, match_count integer, file_ids uuid[]) TO service_role;


--
-- Name: FUNCTION non_private_assistant_exists(p_name text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.non_private_assistant_exists(p_name text) TO anon;
GRANT ALL ON FUNCTION public.non_private_assistant_exists(p_name text) TO authenticated;
GRANT ALL ON FUNCTION public.non_private_assistant_exists(p_name text) TO service_role;


--
-- Name: FUNCTION non_private_file_exists(p_name text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.non_private_file_exists(p_name text) TO anon;
GRANT ALL ON FUNCTION public.non_private_file_exists(p_name text) TO authenticated;
GRANT ALL ON FUNCTION public.non_private_file_exists(p_name text) TO service_role;


--
-- Name: FUNCTION non_private_workspace_exists(p_name text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.non_private_workspace_exists(p_name text) TO anon;
GRANT ALL ON FUNCTION public.non_private_workspace_exists(p_name text) TO authenticated;
GRANT ALL ON FUNCTION public.non_private_workspace_exists(p_name text) TO service_role;


--
-- Name: FUNCTION prevent_home_field_update(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.prevent_home_field_update() TO anon;
GRANT ALL ON FUNCTION public.prevent_home_field_update() TO authenticated;
GRANT ALL ON FUNCTION public.prevent_home_field_update() TO service_role;


--
-- Name: FUNCTION prevent_home_workspace_deletion(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.prevent_home_workspace_deletion() TO anon;
GRANT ALL ON FUNCTION public.prevent_home_workspace_deletion() TO authenticated;
GRANT ALL ON FUNCTION public.prevent_home_workspace_deletion() TO service_role;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;


--
-- Name: FUNCTION avg(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.avg(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION avg(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.avg(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sum(extensions.halfvec); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sum(extensions.halfvec) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sum(extensions.vector); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sum(extensions.vector) TO postgres WITH GRANT OPTION;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT ALL ON TABLE auth.audit_log_entries TO postgres;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.flow_state TO postgres;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.identities TO postgres;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT ALL ON TABLE auth.instances TO postgres;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_amr_claims TO postgres;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_challenges TO postgres;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_factors TO postgres;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.one_time_tokens TO postgres;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT ALL ON TABLE auth.refresh_tokens TO postgres;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_providers TO postgres;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_relay_states TO postgres;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT ALL ON TABLE auth.schema_migrations TO postgres;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sessions TO postgres;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_domains TO postgres;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_providers TO postgres;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT ALL ON TABLE auth.users TO postgres;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE assistant_collections; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assistant_collections TO anon;
GRANT ALL ON TABLE public.assistant_collections TO authenticated;
GRANT ALL ON TABLE public.assistant_collections TO service_role;


--
-- Name: TABLE assistant_files; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assistant_files TO anon;
GRANT ALL ON TABLE public.assistant_files TO authenticated;
GRANT ALL ON TABLE public.assistant_files TO service_role;


--
-- Name: TABLE assistant_tools; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assistant_tools TO anon;
GRANT ALL ON TABLE public.assistant_tools TO authenticated;
GRANT ALL ON TABLE public.assistant_tools TO service_role;


--
-- Name: TABLE assistant_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assistant_workspaces TO anon;
GRANT ALL ON TABLE public.assistant_workspaces TO authenticated;
GRANT ALL ON TABLE public.assistant_workspaces TO service_role;


--
-- Name: TABLE assistants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assistants TO anon;
GRANT ALL ON TABLE public.assistants TO authenticated;
GRANT ALL ON TABLE public.assistants TO service_role;


--
-- Name: TABLE chat_files; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chat_files TO anon;
GRANT ALL ON TABLE public.chat_files TO authenticated;
GRANT ALL ON TABLE public.chat_files TO service_role;


--
-- Name: TABLE chats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chats TO anon;
GRANT ALL ON TABLE public.chats TO authenticated;
GRANT ALL ON TABLE public.chats TO service_role;


--
-- Name: TABLE collection_files; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.collection_files TO anon;
GRANT ALL ON TABLE public.collection_files TO authenticated;
GRANT ALL ON TABLE public.collection_files TO service_role;


--
-- Name: TABLE collection_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.collection_workspaces TO anon;
GRANT ALL ON TABLE public.collection_workspaces TO authenticated;
GRANT ALL ON TABLE public.collection_workspaces TO service_role;


--
-- Name: TABLE collections; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.collections TO anon;
GRANT ALL ON TABLE public.collections TO authenticated;
GRANT ALL ON TABLE public.collections TO service_role;


--
-- Name: TABLE file_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.file_items TO anon;
GRANT ALL ON TABLE public.file_items TO authenticated;
GRANT ALL ON TABLE public.file_items TO service_role;


--
-- Name: TABLE file_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.file_workspaces TO anon;
GRANT ALL ON TABLE public.file_workspaces TO authenticated;
GRANT ALL ON TABLE public.file_workspaces TO service_role;


--
-- Name: TABLE files; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files TO anon;
GRANT ALL ON TABLE public.files TO authenticated;
GRANT ALL ON TABLE public.files TO service_role;


--
-- Name: TABLE folders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.folders TO anon;
GRANT ALL ON TABLE public.folders TO authenticated;
GRANT ALL ON TABLE public.folders TO service_role;


--
-- Name: TABLE message_file_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.message_file_items TO anon;
GRANT ALL ON TABLE public.message_file_items TO authenticated;
GRANT ALL ON TABLE public.message_file_items TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.messages TO anon;
GRANT ALL ON TABLE public.messages TO authenticated;
GRANT ALL ON TABLE public.messages TO service_role;


--
-- Name: TABLE model_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.model_workspaces TO anon;
GRANT ALL ON TABLE public.model_workspaces TO authenticated;
GRANT ALL ON TABLE public.model_workspaces TO service_role;


--
-- Name: TABLE models; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.models TO anon;
GRANT ALL ON TABLE public.models TO authenticated;
GRANT ALL ON TABLE public.models TO service_role;


--
-- Name: TABLE preset_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.preset_workspaces TO anon;
GRANT ALL ON TABLE public.preset_workspaces TO authenticated;
GRANT ALL ON TABLE public.preset_workspaces TO service_role;


--
-- Name: TABLE presets; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.presets TO anon;
GRANT ALL ON TABLE public.presets TO authenticated;
GRANT ALL ON TABLE public.presets TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE prompt_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.prompt_workspaces TO anon;
GRANT ALL ON TABLE public.prompt_workspaces TO authenticated;
GRANT ALL ON TABLE public.prompt_workspaces TO service_role;


--
-- Name: TABLE prompts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.prompts TO anon;
GRANT ALL ON TABLE public.prompts TO authenticated;
GRANT ALL ON TABLE public.prompts TO service_role;


--
-- Name: TABLE tool_workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tool_workspaces TO anon;
GRANT ALL ON TABLE public.tool_workspaces TO authenticated;
GRANT ALL ON TABLE public.tool_workspaces TO service_role;


--
-- Name: TABLE tools; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tools TO anon;
GRANT ALL ON TABLE public.tools TO authenticated;
GRANT ALL ON TABLE public.tools TO service_role;


--
-- Name: TABLE workspaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.workspaces TO anon;
GRANT ALL ON TABLE public.workspaces TO authenticated;
GRANT ALL ON TABLE public.workspaces TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO postgres;
GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO postgres;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO postgres;
GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

