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

DROP EVENT TRIGGER IF EXISTS pgrst_drop_watch;
DROP EVENT TRIGGER IF EXISTS pgrst_ddl_watch;
DROP EVENT TRIGGER IF EXISTS issue_pg_net_access;
DROP EVENT TRIGGER IF EXISTS issue_pg_graphql_access;
DROP EVENT TRIGGER IF EXISTS issue_pg_cron_access;
DROP EVENT TRIGGER IF EXISTS issue_graphql_placeholder;
DROP PUBLICATION IF EXISTS supabase_realtime;
DROP POLICY IF EXISTS "Allow users to read their own files" ON storage.objects;
DROP POLICY IF EXISTS "Allow update access to own workspace images" ON storage.objects;
DROP POLICY IF EXISTS "Allow update access to own message images" ON storage.objects;
DROP POLICY IF EXISTS "Allow update access to own assistant images" ON storage.objects;
DROP POLICY IF EXISTS "Allow read access to own message images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public read access on profile images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public read access on non-private workspace images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public read access on non-private files" ON storage.objects;
DROP POLICY IF EXISTS "Allow public read access on non-private assistant images" ON storage.objects;
DROP POLICY IF EXISTS "Allow insert access to own workspace images" ON storage.objects;
DROP POLICY IF EXISTS "Allow insert access to own message images" ON storage.objects;
DROP POLICY IF EXISTS "Allow insert access to own assistant images" ON storage.objects;
DROP POLICY IF EXISTS "Allow delete access to own workspace images" ON storage.objects;
DROP POLICY IF EXISTS "Allow delete access to own message images" ON storage.objects;
DROP POLICY IF EXISTS "Allow delete access to own assistant images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated update access to own profile images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated update access to own file" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated insert access to own profile images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated insert access to own file" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated delete access to own profile images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated delete access to own file" ON storage.objects;
DROP POLICY IF EXISTS "Allow view access to non-private workspaces" ON public.workspaces;
DROP POLICY IF EXISTS "Allow view access to non-private tools" ON public.tools;
DROP POLICY IF EXISTS "Allow view access to non-private prompts" ON public.prompts;
DROP POLICY IF EXISTS "Allow view access to non-private presets" ON public.presets;
DROP POLICY IF EXISTS "Allow view access to non-private models" ON public.models;
DROP POLICY IF EXISTS "Allow view access to non-private files" ON public.files;
DROP POLICY IF EXISTS "Allow view access to non-private file items" ON public.file_items;
DROP POLICY IF EXISTS "Allow view access to non-private collections" ON public.collections;
DROP POLICY IF EXISTS "Allow view access to non-private chats" ON public.chats;
DROP POLICY IF EXISTS "Allow view access to non-private assistants" ON public.assistants;
DROP POLICY IF EXISTS "Allow view access to messages for non-private chats" ON public.messages;
DROP POLICY IF EXISTS "Allow view access to files for non-private collections" ON public.files;
DROP POLICY IF EXISTS "Allow view access to collection files for non-private collectio" ON public.collection_files;
DROP POLICY IF EXISTS "Allow full access to own workspaces" ON public.workspaces;
DROP POLICY IF EXISTS "Allow full access to own tools" ON public.tools;
DROP POLICY IF EXISTS "Allow full access to own tool_workspaces" ON public.tool_workspaces;
DROP POLICY IF EXISTS "Allow full access to own prompts" ON public.prompts;
DROP POLICY IF EXISTS "Allow full access to own prompt_workspaces" ON public.prompt_workspaces;
DROP POLICY IF EXISTS "Allow full access to own profiles" ON public.profiles;
DROP POLICY IF EXISTS "Allow full access to own presets" ON public.presets;
DROP POLICY IF EXISTS "Allow full access to own preset_workspaces" ON public.preset_workspaces;
DROP POLICY IF EXISTS "Allow full access to own models" ON public.models;
DROP POLICY IF EXISTS "Allow full access to own model_workspaces" ON public.model_workspaces;
DROP POLICY IF EXISTS "Allow full access to own messages" ON public.messages;
DROP POLICY IF EXISTS "Allow full access to own message_file_items" ON public.message_file_items;
DROP POLICY IF EXISTS "Allow full access to own folders" ON public.folders;
DROP POLICY IF EXISTS "Allow full access to own files" ON public.files;
DROP POLICY IF EXISTS "Allow full access to own file_workspaces" ON public.file_workspaces;
DROP POLICY IF EXISTS "Allow full access to own file items" ON public.file_items;
DROP POLICY IF EXISTS "Allow full access to own collections" ON public.collections;
DROP POLICY IF EXISTS "Allow full access to own collection_workspaces" ON public.collection_workspaces;
DROP POLICY IF EXISTS "Allow full access to own collection_files" ON public.collection_files;
DROP POLICY IF EXISTS "Allow full access to own chats" ON public.chats;
DROP POLICY IF EXISTS "Allow full access to own chat_files" ON public.chat_files;
DROP POLICY IF EXISTS "Allow full access to own assistants" ON public.assistants;
DROP POLICY IF EXISTS "Allow full access to own assistant_workspaces" ON public.assistant_workspaces;
DROP POLICY IF EXISTS "Allow full access to own assistant_tools" ON public.assistant_tools;
DROP POLICY IF EXISTS "Allow full access to own assistant_files" ON public.assistant_files;
DROP POLICY IF EXISTS "Allow full access to own assistant_collections" ON public.assistant_collections;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_upload_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads DROP CONSTRAINT IF EXISTS s3_multipart_uploads_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.objects DROP CONSTRAINT IF EXISTS "objects_bucketId_fkey";
ALTER TABLE IF EXISTS ONLY public.workspaces DROP CONSTRAINT IF EXISTS workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tools DROP CONSTRAINT IF EXISTS tools_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tools DROP CONSTRAINT IF EXISTS tools_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tool_workspaces DROP CONSTRAINT IF EXISTS tool_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tool_workspaces DROP CONSTRAINT IF EXISTS tool_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tool_workspaces DROP CONSTRAINT IF EXISTS tool_workspaces_tool_id_fkey;
ALTER TABLE IF EXISTS ONLY public.prompts DROP CONSTRAINT IF EXISTS prompts_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.prompts DROP CONSTRAINT IF EXISTS prompts_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.prompt_workspaces DROP CONSTRAINT IF EXISTS prompt_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.prompt_workspaces DROP CONSTRAINT IF EXISTS prompt_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.prompt_workspaces DROP CONSTRAINT IF EXISTS prompt_workspaces_prompt_id_fkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.presets DROP CONSTRAINT IF EXISTS presets_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.presets DROP CONSTRAINT IF EXISTS presets_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.preset_workspaces DROP CONSTRAINT IF EXISTS preset_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.preset_workspaces DROP CONSTRAINT IF EXISTS preset_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.preset_workspaces DROP CONSTRAINT IF EXISTS preset_workspaces_preset_id_fkey;
ALTER TABLE IF EXISTS ONLY public.models DROP CONSTRAINT IF EXISTS models_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.models DROP CONSTRAINT IF EXISTS models_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.model_workspaces DROP CONSTRAINT IF EXISTS model_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.model_workspaces DROP CONSTRAINT IF EXISTS model_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.model_workspaces DROP CONSTRAINT IF EXISTS model_workspaces_model_id_fkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_chat_id_fkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_assistant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.message_file_items DROP CONSTRAINT IF EXISTS message_file_items_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.message_file_items DROP CONSTRAINT IF EXISTS message_file_items_message_id_fkey;
ALTER TABLE IF EXISTS ONLY public.message_file_items DROP CONSTRAINT IF EXISTS message_file_items_file_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.folders DROP CONSTRAINT IF EXISTS folders_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.folders DROP CONSTRAINT IF EXISTS folders_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.file_workspaces DROP CONSTRAINT IF EXISTS file_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.file_workspaces DROP CONSTRAINT IF EXISTS file_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.file_workspaces DROP CONSTRAINT IF EXISTS file_workspaces_file_id_fkey;
ALTER TABLE IF EXISTS ONLY public.file_items DROP CONSTRAINT IF EXISTS file_items_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.file_items DROP CONSTRAINT IF EXISTS file_items_file_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collections DROP CONSTRAINT IF EXISTS collections_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collections DROP CONSTRAINT IF EXISTS collections_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_workspaces DROP CONSTRAINT IF EXISTS collection_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_workspaces DROP CONSTRAINT IF EXISTS collection_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_workspaces DROP CONSTRAINT IF EXISTS collection_workspaces_collection_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_files DROP CONSTRAINT IF EXISTS collection_files_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_files DROP CONSTRAINT IF EXISTS collection_files_file_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_files DROP CONSTRAINT IF EXISTS collection_files_collection_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chats DROP CONSTRAINT IF EXISTS chats_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chats DROP CONSTRAINT IF EXISTS chats_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chats DROP CONSTRAINT IF EXISTS chats_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chats DROP CONSTRAINT IF EXISTS chats_assistant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chat_files DROP CONSTRAINT IF EXISTS chat_files_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chat_files DROP CONSTRAINT IF EXISTS chat_files_file_id_fkey;
ALTER TABLE IF EXISTS ONLY public.chat_files DROP CONSTRAINT IF EXISTS chat_files_chat_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistants DROP CONSTRAINT IF EXISTS assistants_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistants DROP CONSTRAINT IF EXISTS assistants_folder_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_workspaces DROP CONSTRAINT IF EXISTS assistant_workspaces_workspace_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_workspaces DROP CONSTRAINT IF EXISTS assistant_workspaces_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_workspaces DROP CONSTRAINT IF EXISTS assistant_workspaces_assistant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_tools DROP CONSTRAINT IF EXISTS assistant_tools_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_tools DROP CONSTRAINT IF EXISTS assistant_tools_tool_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_tools DROP CONSTRAINT IF EXISTS assistant_tools_assistant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_files DROP CONSTRAINT IF EXISTS assistant_files_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_files DROP CONSTRAINT IF EXISTS assistant_files_file_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_files DROP CONSTRAINT IF EXISTS assistant_files_assistant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_collections DROP CONSTRAINT IF EXISTS assistant_collections_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_collections DROP CONSTRAINT IF EXISTS assistant_collections_collection_id_fkey;
ALTER TABLE IF EXISTS ONLY public.assistant_collections DROP CONSTRAINT IF EXISTS assistant_collections_assistant_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sso_domains DROP CONSTRAINT IF EXISTS sso_domains_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_flow_state_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_session_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.one_time_tokens DROP CONSTRAINT IF EXISTS one_time_tokens_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_challenges DROP CONSTRAINT IF EXISTS mfa_challenges_auth_factor_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS mfa_amr_claims_session_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_user_id_fkey;
ALTER TABLE IF EXISTS ONLY _realtime.extensions DROP CONSTRAINT IF EXISTS extensions_tenant_external_id_fkey;
DROP TRIGGER IF EXISTS update_objects_updated_at ON storage.objects;
DROP TRIGGER IF EXISTS tr_check_filters ON realtime.subscription;
DROP TRIGGER IF EXISTS update_workspaces_updated_at ON public.workspaces;
DROP TRIGGER IF EXISTS update_tools_updated_at ON public.tools;
DROP TRIGGER IF EXISTS update_tool_workspaces_updated_at ON public.tool_workspaces;
DROP TRIGGER IF EXISTS update_prompts_updated_at ON public.prompts;
DROP TRIGGER IF EXISTS update_prompt_workspaces_updated_at ON public.prompt_workspaces;
DROP TRIGGER IF EXISTS update_profiles_updated_at ON public.profiles;
DROP TRIGGER IF EXISTS update_profiles_updated_at ON public.file_items;
DROP TRIGGER IF EXISTS update_presets_updated_at ON public.presets;
DROP TRIGGER IF EXISTS update_preset_workspaces_updated_at ON public.preset_workspaces;
DROP TRIGGER IF EXISTS update_models_updated_at ON public.models;
DROP TRIGGER IF EXISTS update_model_workspaces_updated_at ON public.model_workspaces;
DROP TRIGGER IF EXISTS update_messages_updated_at ON public.messages;
DROP TRIGGER IF EXISTS update_message_file_items_updated_at ON public.message_file_items;
DROP TRIGGER IF EXISTS update_folders_updated_at ON public.folders;
DROP TRIGGER IF EXISTS update_files_updated_at ON public.files;
DROP TRIGGER IF EXISTS update_file_workspaces_updated_at ON public.file_workspaces;
DROP TRIGGER IF EXISTS update_collections_updated_at ON public.collections;
DROP TRIGGER IF EXISTS update_collection_workspaces_updated_at ON public.collection_workspaces;
DROP TRIGGER IF EXISTS update_collection_files_updated_at ON public.collection_files;
DROP TRIGGER IF EXISTS update_chats_updated_at ON public.chats;
DROP TRIGGER IF EXISTS update_chat_files_updated_at ON public.chat_files;
DROP TRIGGER IF EXISTS update_assistants_updated_at ON public.assistants;
DROP TRIGGER IF EXISTS update_assistant_workspaces_updated_at ON public.assistant_workspaces;
DROP TRIGGER IF EXISTS update_assistant_tools_updated_at ON public.assistant_tools;
DROP TRIGGER IF EXISTS update_assistant_files_updated_at ON public.assistant_files;
DROP TRIGGER IF EXISTS update_assistant_collections_updated_at ON public.assistant_collections;
DROP TRIGGER IF EXISTS prevent_update_of_home_field ON public.workspaces;
DROP TRIGGER IF EXISTS delete_old_workspace_image ON public.workspaces;
DROP TRIGGER IF EXISTS delete_old_profile_image ON public.profiles;
DROP TRIGGER IF EXISTS delete_old_message_images ON public.messages;
DROP TRIGGER IF EXISTS delete_old_file ON public.files;
DROP TRIGGER IF EXISTS delete_old_assistant_image ON public.assistants;
DROP TRIGGER IF EXISTS create_profile_and_workspace_trigger ON auth.users;
DROP INDEX IF EXISTS supabase_functions.supabase_functions_hooks_request_id_idx;
DROP INDEX IF EXISTS supabase_functions.supabase_functions_hooks_h_table_id_h_name_idx;
DROP INDEX IF EXISTS storage.name_prefix_search;
DROP INDEX IF EXISTS storage.idx_objects_bucket_id_name;
DROP INDEX IF EXISTS storage.idx_multipart_uploads_list;
DROP INDEX IF EXISTS storage.bucketid_objname;
DROP INDEX IF EXISTS storage.bname;
DROP INDEX IF EXISTS realtime.subscription_subscription_id_entity_filters_key;
DROP INDEX IF EXISTS realtime.messages_topic_index;
DROP INDEX IF EXISTS realtime.ix_realtime_subscription_entity;
DROP INDEX IF EXISTS public.tools_user_id_idx;
DROP INDEX IF EXISTS public.tool_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.tool_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.tool_workspaces_tool_id_idx;
DROP INDEX IF EXISTS public.prompts_user_id_idx;
DROP INDEX IF EXISTS public.prompt_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.prompt_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.prompt_workspaces_prompt_id_idx;
DROP INDEX IF EXISTS public.presets_user_id_idx;
DROP INDEX IF EXISTS public.preset_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.preset_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.preset_workspaces_preset_id_idx;
DROP INDEX IF EXISTS public.models_user_id_idx;
DROP INDEX IF EXISTS public.model_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.model_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.model_workspaces_model_id_idx;
DROP INDEX IF EXISTS public.idx_workspaces_user_id;
DROP INDEX IF EXISTS public.idx_unique_home_workspace_per_user;
DROP INDEX IF EXISTS public.idx_profiles_user_id;
DROP INDEX IF EXISTS public.idx_messages_chat_id;
DROP INDEX IF EXISTS public.idx_message_file_items_message_id;
DROP INDEX IF EXISTS public.idx_collection_files_file_id;
DROP INDEX IF EXISTS public.idx_collection_files_collection_id;
DROP INDEX IF EXISTS public.idx_chats_workspace_id;
DROP INDEX IF EXISTS public.idx_chats_user_id;
DROP INDEX IF EXISTS public.idx_chat_files_chat_id;
DROP INDEX IF EXISTS public.folders_workspace_id_idx;
DROP INDEX IF EXISTS public.folders_user_id_idx;
DROP INDEX IF EXISTS public.files_user_id_idx;
DROP INDEX IF EXISTS public.file_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.file_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.file_workspaces_file_id_idx;
DROP INDEX IF EXISTS public.file_items_local_embedding_idx;
DROP INDEX IF EXISTS public.file_items_file_id_idx;
DROP INDEX IF EXISTS public.file_items_embedding_idx;
DROP INDEX IF EXISTS public.collections_user_id_idx;
DROP INDEX IF EXISTS public.collection_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.collection_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.collection_workspaces_collection_id_idx;
DROP INDEX IF EXISTS public.assistants_user_id_idx;
DROP INDEX IF EXISTS public.assistant_workspaces_workspace_id_idx;
DROP INDEX IF EXISTS public.assistant_workspaces_user_id_idx;
DROP INDEX IF EXISTS public.assistant_workspaces_assistant_id_idx;
DROP INDEX IF EXISTS public.assistant_tools_user_id_idx;
DROP INDEX IF EXISTS public.assistant_tools_tool_id_idx;
DROP INDEX IF EXISTS public.assistant_tools_assistant_id_idx;
DROP INDEX IF EXISTS public.assistant_files_user_id_idx;
DROP INDEX IF EXISTS public.assistant_files_file_id_idx;
DROP INDEX IF EXISTS public.assistant_files_assistant_id_idx;
DROP INDEX IF EXISTS public.assistant_collections_user_id_idx;
DROP INDEX IF EXISTS public.assistant_collections_collection_id_idx;
DROP INDEX IF EXISTS public.assistant_collections_assistant_id_idx;
DROP INDEX IF EXISTS auth.users_is_anonymous_idx;
DROP INDEX IF EXISTS auth.users_instance_id_idx;
DROP INDEX IF EXISTS auth.users_instance_id_email_idx;
DROP INDEX IF EXISTS auth.users_email_partial_key;
DROP INDEX IF EXISTS auth.user_id_created_at_idx;
DROP INDEX IF EXISTS auth.sso_providers_resource_id_idx;
DROP INDEX IF EXISTS auth.sso_domains_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.sso_domains_domain_idx;
DROP INDEX IF EXISTS auth.sessions_user_id_idx;
DROP INDEX IF EXISTS auth.sessions_not_after_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_for_email_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_created_at_idx;
DROP INDEX IF EXISTS auth.saml_providers_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_updated_at_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_session_id_revoked_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_parent_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_instance_id_user_id_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_instance_id_idx;
DROP INDEX IF EXISTS auth.recovery_token_idx;
DROP INDEX IF EXISTS auth.reauthentication_token_idx;
DROP INDEX IF EXISTS auth.one_time_tokens_user_id_token_type_key;
DROP INDEX IF EXISTS auth.one_time_tokens_token_hash_hash_idx;
DROP INDEX IF EXISTS auth.one_time_tokens_relates_to_hash_idx;
DROP INDEX IF EXISTS auth.mfa_factors_user_id_idx;
DROP INDEX IF EXISTS auth.mfa_factors_user_friendly_name_unique;
DROP INDEX IF EXISTS auth.mfa_challenge_created_at_idx;
DROP INDEX IF EXISTS auth.idx_user_id_auth_method;
DROP INDEX IF EXISTS auth.idx_auth_code;
DROP INDEX IF EXISTS auth.identities_user_id_idx;
DROP INDEX IF EXISTS auth.identities_email_idx;
DROP INDEX IF EXISTS auth.flow_state_created_at_idx;
DROP INDEX IF EXISTS auth.factor_id_created_at_idx;
DROP INDEX IF EXISTS auth.email_change_token_new_idx;
DROP INDEX IF EXISTS auth.email_change_token_current_idx;
DROP INDEX IF EXISTS auth.confirmation_token_idx;
DROP INDEX IF EXISTS auth.audit_logs_instance_id_idx;
DROP INDEX IF EXISTS _realtime.tenants_external_id_index;
DROP INDEX IF EXISTS _realtime.extensions_tenant_external_id_type_index;
ALTER TABLE IF EXISTS ONLY supabase_migrations.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY supabase_functions.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY supabase_functions.hooks DROP CONSTRAINT IF EXISTS hooks_pkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads DROP CONSTRAINT IF EXISTS s3_multipart_uploads_pkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_pkey;
ALTER TABLE IF EXISTS ONLY storage.objects DROP CONSTRAINT IF EXISTS objects_pkey;
ALTER TABLE IF EXISTS ONLY storage.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY storage.migrations DROP CONSTRAINT IF EXISTS migrations_name_key;
ALTER TABLE IF EXISTS ONLY storage.buckets DROP CONSTRAINT IF EXISTS buckets_pkey;
ALTER TABLE IF EXISTS ONLY realtime.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY realtime.subscription DROP CONSTRAINT IF EXISTS pk_subscription;
ALTER TABLE IF EXISTS ONLY realtime.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY public.workspaces DROP CONSTRAINT IF EXISTS workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.tools DROP CONSTRAINT IF EXISTS tools_pkey;
ALTER TABLE IF EXISTS ONLY public.tool_workspaces DROP CONSTRAINT IF EXISTS tool_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.prompts DROP CONSTRAINT IF EXISTS prompts_pkey;
ALTER TABLE IF EXISTS ONLY public.prompt_workspaces DROP CONSTRAINT IF EXISTS prompt_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_username_key;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_user_id_key;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.presets DROP CONSTRAINT IF EXISTS presets_pkey;
ALTER TABLE IF EXISTS ONLY public.preset_workspaces DROP CONSTRAINT IF EXISTS preset_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.models DROP CONSTRAINT IF EXISTS models_pkey;
ALTER TABLE IF EXISTS ONLY public.model_workspaces DROP CONSTRAINT IF EXISTS model_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY public.message_file_items DROP CONSTRAINT IF EXISTS message_file_items_pkey;
ALTER TABLE IF EXISTS ONLY public.folders DROP CONSTRAINT IF EXISTS folders_pkey;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_pkey;
ALTER TABLE IF EXISTS ONLY public.file_workspaces DROP CONSTRAINT IF EXISTS file_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.file_items DROP CONSTRAINT IF EXISTS file_items_pkey;
ALTER TABLE IF EXISTS ONLY public.collections DROP CONSTRAINT IF EXISTS collections_pkey;
ALTER TABLE IF EXISTS ONLY public.collection_workspaces DROP CONSTRAINT IF EXISTS collection_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.collection_files DROP CONSTRAINT IF EXISTS collection_files_pkey;
ALTER TABLE IF EXISTS ONLY public.chats DROP CONSTRAINT IF EXISTS chats_pkey;
ALTER TABLE IF EXISTS ONLY public.chat_files DROP CONSTRAINT IF EXISTS chat_files_pkey;
ALTER TABLE IF EXISTS ONLY public.assistants DROP CONSTRAINT IF EXISTS assistants_pkey;
ALTER TABLE IF EXISTS ONLY public.assistant_workspaces DROP CONSTRAINT IF EXISTS assistant_workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.assistant_tools DROP CONSTRAINT IF EXISTS assistant_tools_pkey;
ALTER TABLE IF EXISTS ONLY public.assistant_files DROP CONSTRAINT IF EXISTS assistant_files_pkey;
ALTER TABLE IF EXISTS ONLY public.assistant_collections DROP CONSTRAINT IF EXISTS assistant_collections_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_phone_key;
ALTER TABLE IF EXISTS ONLY auth.sso_providers DROP CONSTRAINT IF EXISTS sso_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.sso_domains DROP CONSTRAINT IF EXISTS sso_domains_pkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY auth.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_entity_id_key;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_token_unique;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.one_time_tokens DROP CONSTRAINT IF EXISTS one_time_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_challenges DROP CONSTRAINT IF EXISTS mfa_challenges_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS mfa_amr_claims_session_id_authentication_method_pkey;
ALTER TABLE IF EXISTS ONLY auth.instances DROP CONSTRAINT IF EXISTS instances_pkey;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_provider_id_provider_unique;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_pkey;
ALTER TABLE IF EXISTS ONLY auth.flow_state DROP CONSTRAINT IF EXISTS flow_state_pkey;
ALTER TABLE IF EXISTS ONLY auth.audit_log_entries DROP CONSTRAINT IF EXISTS audit_log_entries_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS amr_id_pk;
ALTER TABLE IF EXISTS ONLY _realtime.tenants DROP CONSTRAINT IF EXISTS tenants_pkey;
ALTER TABLE IF EXISTS ONLY _realtime.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY _realtime.extensions DROP CONSTRAINT IF EXISTS extensions_pkey;
ALTER TABLE IF EXISTS supabase_functions.hooks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS realtime.messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
DROP VIEW IF EXISTS vault.decrypted_secrets;
DROP TABLE IF EXISTS supabase_migrations.schema_migrations;
DROP TABLE IF EXISTS supabase_functions.migrations;
DROP SEQUENCE IF EXISTS supabase_functions.hooks_id_seq;
DROP TABLE IF EXISTS supabase_functions.hooks;
DROP TABLE IF EXISTS storage.s3_multipart_uploads_parts;
DROP TABLE IF EXISTS storage.s3_multipart_uploads;
DROP TABLE IF EXISTS storage.objects;
DROP TABLE IF EXISTS storage.migrations;
DROP TABLE IF EXISTS storage.buckets;
DROP TABLE IF EXISTS realtime.subscription;
DROP TABLE IF EXISTS realtime.schema_migrations;
DROP SEQUENCE IF EXISTS realtime.messages_id_seq;
DROP TABLE IF EXISTS realtime.messages;
DROP TABLE IF EXISTS public.workspaces;
DROP TABLE IF EXISTS public.tools;
DROP TABLE IF EXISTS public.tool_workspaces;
DROP TABLE IF EXISTS public.prompts;
DROP TABLE IF EXISTS public.prompt_workspaces;
DROP TABLE IF EXISTS public.profiles;
DROP TABLE IF EXISTS public.presets;
DROP TABLE IF EXISTS public.preset_workspaces;
DROP TABLE IF EXISTS public.models;
DROP TABLE IF EXISTS public.model_workspaces;
DROP TABLE IF EXISTS public.messages;
DROP TABLE IF EXISTS public.message_file_items;
DROP TABLE IF EXISTS public.folders;
DROP TABLE IF EXISTS public.files;
DROP TABLE IF EXISTS public.file_workspaces;
DROP TABLE IF EXISTS public.file_items;
DROP TABLE IF EXISTS public.collections;
DROP TABLE IF EXISTS public.collection_workspaces;
DROP TABLE IF EXISTS public.collection_files;
DROP TABLE IF EXISTS public.chats;
DROP TABLE IF EXISTS public.chat_files;
DROP TABLE IF EXISTS public.assistants;
DROP TABLE IF EXISTS public.assistant_workspaces;
DROP TABLE IF EXISTS public.assistant_tools;
DROP TABLE IF EXISTS public.assistant_files;
DROP TABLE IF EXISTS public.assistant_collections;
DROP TABLE IF EXISTS auth.users;
DROP TABLE IF EXISTS auth.sso_providers;
DROP TABLE IF EXISTS auth.sso_domains;
DROP TABLE IF EXISTS auth.sessions;
DROP TABLE IF EXISTS auth.schema_migrations;
DROP TABLE IF EXISTS auth.saml_relay_states;
DROP TABLE IF EXISTS auth.saml_providers;
DROP SEQUENCE IF EXISTS auth.refresh_tokens_id_seq;
DROP TABLE IF EXISTS auth.refresh_tokens;
DROP TABLE IF EXISTS auth.one_time_tokens;
DROP TABLE IF EXISTS auth.mfa_factors;
DROP TABLE IF EXISTS auth.mfa_challenges;
DROP TABLE IF EXISTS auth.mfa_amr_claims;
DROP TABLE IF EXISTS auth.instances;
DROP TABLE IF EXISTS auth.identities;
DROP TABLE IF EXISTS auth.flow_state;
DROP TABLE IF EXISTS auth.audit_log_entries;
DROP TABLE IF EXISTS _realtime.tenants;
DROP TABLE IF EXISTS _realtime.schema_migrations;
DROP TABLE IF EXISTS _realtime.extensions;
DROP FUNCTION IF EXISTS vault.secrets_encrypt_secret_secret();
DROP FUNCTION IF EXISTS supabase_functions.http_request();
DROP FUNCTION IF EXISTS storage.update_updated_at_column();
DROP FUNCTION IF EXISTS storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION IF EXISTS storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text);
DROP FUNCTION IF EXISTS storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
DROP FUNCTION IF EXISTS storage.get_size_by_bucket();
DROP FUNCTION IF EXISTS storage.foldername(name text);
DROP FUNCTION IF EXISTS storage.filename(name text);
DROP FUNCTION IF EXISTS storage.extension(name text);
DROP FUNCTION IF EXISTS storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
DROP FUNCTION IF EXISTS realtime.topic();
DROP FUNCTION IF EXISTS realtime.to_regrole(role_name text);
DROP FUNCTION IF EXISTS realtime.subscription_check_filters();
DROP FUNCTION IF EXISTS realtime.quote_wal2json(entity regclass);
DROP FUNCTION IF EXISTS realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
DROP FUNCTION IF EXISTS realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
DROP FUNCTION IF EXISTS realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
DROP FUNCTION IF EXISTS realtime."cast"(val text, type_ regtype);
DROP FUNCTION IF EXISTS realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
DROP FUNCTION IF EXISTS realtime.apply_rls(wal jsonb, max_record_bytes integer);
DROP FUNCTION IF EXISTS public.update_updated_at_column();
DROP FUNCTION IF EXISTS public.prevent_home_workspace_deletion();
DROP FUNCTION IF EXISTS public.prevent_home_field_update();
DROP FUNCTION IF EXISTS public.non_private_workspace_exists(p_name text);
DROP FUNCTION IF EXISTS public.non_private_file_exists(p_name text);
DROP FUNCTION IF EXISTS public.non_private_assistant_exists(p_name text);
DROP FUNCTION IF EXISTS public.match_file_items_openai(query_embedding extensions.vector, match_count integer, file_ids uuid[]);
DROP FUNCTION IF EXISTS public.match_file_items_local(query_embedding extensions.vector, match_count integer, file_ids uuid[]);
DROP FUNCTION IF EXISTS public.delete_storage_object_from_bucket(bucket_name text, object_path text, OUT status integer, OUT content text);
DROP FUNCTION IF EXISTS public.delete_storage_object(bucket text, object text, OUT status integer, OUT content text);
DROP FUNCTION IF EXISTS public.delete_old_workspace_image();
DROP FUNCTION IF EXISTS public.delete_old_profile_image();
DROP FUNCTION IF EXISTS public.delete_old_message_images();
DROP FUNCTION IF EXISTS public.delete_old_file();
DROP FUNCTION IF EXISTS public.delete_old_assistant_image();
DROP FUNCTION IF EXISTS public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer);
DROP FUNCTION IF EXISTS public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer);
DROP FUNCTION IF EXISTS public.create_profile_and_workspace();
DROP FUNCTION IF EXISTS public.create_duplicate_messages_for_new_chat(old_chat_id uuid, new_chat_id uuid, new_user_id uuid);
DROP FUNCTION IF EXISTS pgbouncer.get_auth(p_usename text);
DROP FUNCTION IF EXISTS extensions.set_graphql_placeholder();
DROP FUNCTION IF EXISTS extensions.pgrst_drop_watch();
DROP FUNCTION IF EXISTS extensions.pgrst_ddl_watch();
DROP FUNCTION IF EXISTS extensions.grant_pg_net_access();
DROP FUNCTION IF EXISTS extensions.grant_pg_graphql_access();
DROP FUNCTION IF EXISTS extensions.grant_pg_cron_access();
DROP FUNCTION IF EXISTS auth.uid();
DROP FUNCTION IF EXISTS auth.role();
DROP FUNCTION IF EXISTS auth.jwt();
DROP FUNCTION IF EXISTS auth.email();
DROP TYPE IF EXISTS realtime.wal_rls;
DROP TYPE IF EXISTS realtime.wal_column;
DROP TYPE IF EXISTS realtime.user_defined_filter;
DROP TYPE IF EXISTS realtime.equality_op;
DROP TYPE IF EXISTS realtime.action;
DROP TYPE IF EXISTS auth.one_time_token_type;
DROP TYPE IF EXISTS auth.factor_type;
DROP TYPE IF EXISTS auth.factor_status;
DROP TYPE IF EXISTS auth.code_challenge_method;
DROP TYPE IF EXISTS auth.aal_level;
DROP EXTENSION IF EXISTS vector;
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS supabase_vault;
DROP EXTENSION IF EXISTS pgjwt;
DROP EXTENSION IF EXISTS pgcrypto;
DROP EXTENSION IF EXISTS pg_stat_statements;
DROP EXTENSION IF EXISTS pg_graphql;
DROP EXTENSION IF EXISTS http;
DROP SCHEMA IF EXISTS vault;
DROP SCHEMA IF EXISTS supabase_migrations;
DROP SCHEMA IF EXISTS supabase_functions;
DROP SCHEMA IF EXISTS storage;
DROP SCHEMA IF EXISTS realtime;
DROP EXTENSION IF EXISTS pgsodium;
DROP SCHEMA IF EXISTS pgsodium;
DROP SCHEMA IF EXISTS pgbouncer;
DROP EXTENSION IF EXISTS pg_net;
DROP SCHEMA IF EXISTS graphql_public;
DROP SCHEMA IF EXISTS graphql;
DROP SCHEMA IF EXISTS extensions;
DROP SCHEMA IF EXISTS auth;
DROP SCHEMA IF EXISTS _supavisor;
DROP SCHEMA IF EXISTS _realtime;
DROP SCHEMA IF EXISTS _analytics;
--
-- Name: _analytics; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA _analytics;


--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA _realtime;


--
-- Name: _supavisor; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA _supavisor;


--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgsodium;


--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA supabase_functions;


--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA supabase_migrations;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: http; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS http WITH SCHEMA extensions;


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA extensions;


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
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


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
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


--
-- Name: create_duplicate_messages_for_new_chat(uuid, uuid, uuid); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: create_profile_and_workspace(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_message_including_and_after(uuid, uuid, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_message_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM messages 
    WHERE user_id = p_user_id AND chat_id = p_chat_id AND sequence_number >= p_sequence_number;
END;
$$;


--
-- Name: delete_messages_including_and_after(uuid, uuid, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_messages_including_and_after(p_user_id uuid, p_chat_id uuid, p_sequence_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM messages 
    WHERE user_id = p_user_id AND chat_id = p_chat_id AND sequence_number >= p_sequence_number;
END;
$$;


--
-- Name: delete_old_assistant_image(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_old_file(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_old_message_images(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_old_profile_image(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_old_workspace_image(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_storage_object(text, text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_storage_object_from_bucket(text, text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: match_file_items_local(extensions.vector, integer, uuid[]); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: match_file_items_openai(extensions.vector, integer, uuid[]); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: non_private_assistant_exists(text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: non_private_file_exists(text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: non_private_workspace_exists(text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: prevent_home_field_update(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: prevent_home_workspace_deletion(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now(); 
    RETURN NEW; 
END;
$$;


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: -
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


--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: -
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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: -
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: -
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: -
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


--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: assistant_collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assistant_collections (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: assistant_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assistant_files (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    file_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: assistant_tools; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assistant_tools (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    tool_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: assistant_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assistant_workspaces (
    user_id uuid NOT NULL,
    assistant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: assistants; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: chat_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_files (
    user_id uuid NOT NULL,
    chat_id uuid NOT NULL,
    file_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: chats; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: collection_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_files (
    user_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    file_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: collection_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_workspaces (
    user_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: collections; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: file_items; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: file_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.file_workspaces (
    user_id uuid NOT NULL,
    file_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: files; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: folders; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: message_file_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.message_file_items (
    user_id uuid NOT NULL,
    message_id uuid NOT NULL,
    file_item_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: model_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.model_workspaces (
    user_id uuid NOT NULL,
    model_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: models; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: preset_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preset_workspaces (
    user_id uuid NOT NULL,
    preset_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: presets; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: prompt_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_workspaces (
    user_id uuid NOT NULL,
    prompt_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: prompts; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: tool_workspaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tool_workspaces (
    user_id uuid NOT NULL,
    tool_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: tools; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: -
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
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
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: -
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: -
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: -
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: -
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: -
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: -
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


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: -
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
543c1c3c-d261-4992-bfb2-c49cbc599a5f	postgres_cdc_rls	{"region": "us-east-1", "db_host": "y5EcfJ3m9TqyMR1Xd0fWRJyrV7flSHLpo0VWz1Cc/2k=", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "+enMDFi1J/3IrrquHHwUmA==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "sWBpZNdjggEPTQVlI52Zfw==", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2024-08-07 18:33:33	2024-08-07 18:33:33
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: -
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
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: -
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks) FROM stdin;
a8a608ce-8cf7-4fc9-8f77-71b30609f3d2	realtime-dev	realtime-dev	iNjicxc4+llvc9wovDvqymwfnj9teWMlyOIbJ8Fh6j2WNU8CIJ2ZgjR6MUIKqSmeDmvpsKLsZ9jgXJmQPpwL8w==	200	2024-08-07 18:33:33	2024-08-07 18:33:33	100	postgres_cdc_rls	100000	100	100	f	\N
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	5ed80451-8d3e-43dc-97ec-9d0b1b89c186	{"action":"user_signedup","actor_id":"3062b58b-4812-4afc-a7e2-9e798456626d","actor_username":"ryandonofrio3@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-08-07 18:34:29.4173+00	
00000000-0000-0000-0000-000000000000	c0582743-efc2-4259-b96f-a3a9523185e4	{"action":"login","actor_id":"3062b58b-4812-4afc-a7e2-9e798456626d","actor_username":"ryandonofrio3@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-07 18:34:29.418928+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
3062b58b-4812-4afc-a7e2-9e798456626d	3062b58b-4812-4afc-a7e2-9e798456626d	{"sub": "3062b58b-4812-4afc-a7e2-9e798456626d", "email": "ryandonofrio3@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-08-07 18:34:29.415854+00	2024-08-07 18:34:29.415876+00	2024-08-07 18:34:29.415876+00	b9ca8996-ef5b-43bc-90ec-6030bc937ada
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
a1496e09-d9df-4a92-b36e-d442d148e3b9	2024-08-07 18:34:29.420333+00	2024-08-07 18:34:29.420333+00	password	2204d100-3875-4ce4-99b2-b9a7fe83af11
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	1	wXKCcHhxDb_mT2CUupHTmA	3062b58b-4812-4afc-a7e2-9e798456626d	f	2024-08-07 18:34:29.419694+00	2024-08-07 18:34:29.419694+00	\N	a1496e09-d9df-4a92-b36e-d442d148e3b9
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
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
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
a1496e09-d9df-4a92-b36e-d442d148e3b9	3062b58b-4812-4afc-a7e2-9e798456626d	2024-08-07 18:34:29.419206+00	2024-08-07 18:34:29.419206+00	\N	aal1	\N	\N	node	192.168.65.1	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	authenticated	authenticated	test@test.com	$2a$06$wulthq2GdTD1imVjf1ZiKuEAfhOGLEtKwH5IFUgkhNNwMHvg8LFc2	2023-02-18 23:31:13.017218+00	\N		2023-02-18 23:31:12.757017+00		\N			\N	2023-02-18 23:31:13.01781+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-02-18 23:31:12.752281+00	2023-02-18 23:31:13.019418+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3062b58b-4812-4afc-a7e2-9e798456626d	authenticated	authenticated	ryandonofrio3@gmail.com	$2a$10$FlNMSQAbv0U4umifThDiPuaaMecWUJbyvzn.OPvKl9a7gNsfIT9jG	2024-08-07 18:34:29.417773+00	\N		\N		\N			\N	2024-08-07 18:34:29.419177+00	{"provider": "email", "providers": ["email"]}	{"sub": "3062b58b-4812-4afc-a7e2-9e798456626d", "email": "ryandonofrio3@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-08-07 18:34:29.412937+00	2024-08-07 18:34:29.4202+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: -
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: assistant_collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assistant_collections (user_id, assistant_id, collection_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assistant_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assistant_files (user_id, assistant_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assistant_tools; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assistant_tools (user_id, assistant_id, tool_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assistant_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assistant_workspaces (user_id, assistant_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	49be665a-603b-4c59-a165-8e41e7d440e9	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: assistants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assistants (id, user_id, folder_id, created_at, updated_at, sharing, context_length, description, embeddings_provider, include_profile_context, include_workspace_instructions, model, name, image_path, prompt, temperature) FROM stdin;
49be665a-603b-4c59-a165-8e41e7d440e9	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	\N	private	4000	This is an Albert Einstein assistant.	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Albert Einstein		You are Albert Einstein.	0.5
\.


--
-- Data for Name: chat_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chat_files (user_id, chat_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chats (id, user_id, workspace_id, assistant_id, folder_id, created_at, updated_at, sharing, context_length, embeddings_provider, include_profile_context, include_workspace_instructions, model, name, prompt, temperature) FROM stdin;
2181ae60-bedb-4520-b1aa-e2200fb2a524	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	e87480d3-eca9-4350-9989-f4da7dbcb127	\N	\N	2024-08-07 18:33:31.46209+00	\N	private	4000	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Chat 1	You are an assistant.	0.5
2cf723e5-13c4-44e9-bca0-cdf4c374e054	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	e87480d3-eca9-4350-9989-f4da7dbcb127	\N	6541804d-0585-4f38-9e63-e65c2575fbbe	2024-08-07 18:33:31.46209+00	\N	private	4000	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Chat 4	You are an assistant.	0.5
\.


--
-- Data for Name: collection_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collection_files (user_id, collection_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: collection_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collection_workspaces (user_id, collection_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	d7a72b05-8e9a-4834-964b-55d557f13554	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collections (id, user_id, folder_id, created_at, updated_at, sharing, description, name) FROM stdin;
d7a72b05-8e9a-4834-964b-55d557f13554	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	This is a description for Collection 1	Collection 1
\.


--
-- Data for Name: file_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.file_items (id, file_id, user_id, created_at, updated_at, sharing, content, local_embedding, openai_embedding, tokens) FROM stdin;
\.


--
-- Data for Name: file_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.file_workspaces (user_id, file_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	9d3fa05e-a151-4af2-98e5-7899042d8a2c	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files (id, user_id, folder_id, created_at, updated_at, sharing, description, file_path, name, size, tokens, type) FROM stdin;
9d3fa05e-a151-4af2-98e5-7899042d8a2c	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	\N	private	This is a file for testing	https://example.com/file1	File 1	1000000	250	pdf
\.


--
-- Data for Name: folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.folders (id, user_id, workspace_id, created_at, updated_at, name, description, type) FROM stdin;
6541804d-0585-4f38-9e63-e65c2575fbbe	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N	Chat Folder 1	This is a folder for chats	chats
\.


--
-- Data for Name: message_file_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.message_file_items (user_id, message_id, file_item_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: model_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.model_workspaces (user_id, model_id, workspace_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.models (id, user_id, folder_id, created_at, updated_at, sharing, api_key, base_url, description, model_id, name, context_length) FROM stdin;
\.


--
-- Data for Name: preset_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.preset_workspaces (user_id, preset_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	d20a6912-bbb3-4949-bb31-eba87b179c2d	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: presets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.presets (id, user_id, folder_id, created_at, updated_at, sharing, context_length, description, embeddings_provider, include_profile_context, include_workspace_instructions, model, name, prompt, temperature) FROM stdin;
d20a6912-bbb3-4949-bb31-eba87b179c2d	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	4000	Description for Preset 1	openai	t	t	anthropic.claude-3-5-sonnet-20240620-v1:0	Preset 1	Prompt 1	0.5
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profiles (id, user_id, created_at, updated_at, bio, has_onboarded, image_url, image_path, profile_context, display_name, use_azure_openai, username, anthropic_api_key, azure_openai_35_turbo_id, azure_openai_45_turbo_id, azure_openai_45_vision_id, azure_openai_api_key, azure_openai_endpoint, google_gemini_api_key, mistral_api_key, openai_api_key, openai_organization_id, perplexity_api_key, openrouter_api_key, azure_openai_embeddings_id, groq_api_key) FROM stdin;
27d79441-7b8d-492c-8d39-f3217c49c478	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N		f					f	userb0864775a15f47ea												\N	\N	\N
31843e0c-68ca-42cc-8d8e-af7c70b68a84	3062b58b-4812-4afc-a7e2-9e798456626d	2024-08-07 18:34:29.41269+00	2024-08-07 18:34:34.769151+00		t					f	useree3f95530e0e4f80												\N	\N	\N
\.


--
-- Data for Name: prompt_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prompt_workspaces (user_id, prompt_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	9dc7baf3-2e0e-44cd-8c2b-d049d1ee2b9b	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prompts (id, user_id, folder_id, created_at, updated_at, sharing, content, name) FROM stdin;
9dc7baf3-2e0e-44cd-8c2b-d049d1ee2b9b	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	I want you to act as a storyteller. You will come up with entertaining stories that are engaging, imaginative and captivating for the audience. It can be fairy tales, educational stories or any other type of stories which has the potential to capture people's attention and imagination. Depending on the target audience, you may choose specific themes or topics for your storytelling session e.g., if it’s children then you can talk about animals; If it’s adults then history-based tales might engage them better etc. My first request is 'I need an interesting story on perseverance.'	Storyteller
\.


--
-- Data for Name: tool_workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tool_workspaces (user_id, tool_id, workspace_id, created_at, updated_at) FROM stdin;
e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	bdfe86ca-3c1d-4147-bbc6-a675a723c9ab	e87480d3-eca9-4350-9989-f4da7dbcb127	2024-08-07 18:33:31.46209+00	\N
\.


--
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tools (id, user_id, folder_id, created_at, updated_at, sharing, description, name, schema, url, custom_headers) FROM stdin;
bdfe86ca-3c1d-4147-bbc6-a675a723c9ab	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	\N	2024-08-07 18:33:31.46209+00	2024-08-07 18:33:31.46209+00	private	This is a description for Tool 1	Tool 1	{}	http://example.com	{}
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workspaces (id, user_id, created_at, updated_at, sharing, default_context_length, default_model, default_prompt, default_temperature, description, embeddings_provider, include_profile_context, include_workspace_instructions, instructions, is_home, name, image_path) FROM stdin;
e87480d3-eca9-4350-9989-f4da7dbcb127	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	private	4096	anthropic.claude-3-5-sonnet-20240620-v1:0	You are a friendly, helpful AI assistant.	0.5	My home workspace.	openai	t	t		t	Home	
fabdc90d-9eaa-4f42-905f-2a5649e33675	e9fc7e46-a8a5-4fd4-8ba7-af485013e6fa	2024-08-07 18:33:31.46209+00	\N	private	4000	anthropic.claude-3-5-sonnet-20240620-v1:0	You are an assistant.	0.5	This is for testing.	openai	t	t	These are the instructions.	f	Workspace 1	
eaf4630d-acac-471c-84f2-2463ad1865ce	3062b58b-4812-4afc-a7e2-9e798456626d	2024-08-07 18:34:29.41269+00	\N	private	4096	anthropic.claude-3-5-sonnet-20240620-v1:0	You are a friendly, helpful AI assistant.	0.5	My home workspace.	openai	t	t		t	Home	
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
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
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
profile_images	profile_images	\N	2024-08-07 18:33:31.330403+00	2024-08-07 18:33:31.330403+00	t	f	\N	\N	\N
files	files	\N	2024-08-07 18:33:31.352008+00	2024-08-07 18:33:31.352008+00	f	f	\N	\N	\N
assistant_images	assistant_images	\N	2024-08-07 18:33:31.374742+00	2024-08-07 18:33:31.374742+00	f	f	\N	\N	\N
message_images	message_images	\N	2024-08-07 18:33:31.388531+00	2024-08-07 18:33:31.388531+00	f	f	\N	\N	\N
workspace_images	workspace_images	\N	2024-08-07 18:33:31.447374+00	2024-08-07 18:33:31.447374+00	f	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
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
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: -
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: -
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2024-08-07 18:33:19.582844+00
20210809183423_update_grants	2024-08-07 18:33:19.582844+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: -
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
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: -
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: -
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: assistant_collections assistant_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_pkey PRIMARY KEY (assistant_id, collection_id);


--
-- Name: assistant_files assistant_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_pkey PRIMARY KEY (assistant_id, file_id);


--
-- Name: assistant_tools assistant_tools_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_pkey PRIMARY KEY (assistant_id, tool_id);


--
-- Name: assistant_workspaces assistant_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_pkey PRIMARY KEY (assistant_id, workspace_id);


--
-- Name: assistants assistants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_pkey PRIMARY KEY (id);


--
-- Name: chat_files chat_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_pkey PRIMARY KEY (chat_id, file_id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: collection_files collection_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_pkey PRIMARY KEY (collection_id, file_id);


--
-- Name: collection_workspaces collection_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_pkey PRIMARY KEY (collection_id, workspace_id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: file_items file_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_items
    ADD CONSTRAINT file_items_pkey PRIMARY KEY (id);


--
-- Name: file_workspaces file_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_pkey PRIMARY KEY (file_id, workspace_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: folders folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- Name: message_file_items message_file_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_pkey PRIMARY KEY (message_id, file_item_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: model_workspaces model_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_pkey PRIMARY KEY (model_id, workspace_id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: preset_workspaces preset_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_pkey PRIMARY KEY (preset_id, workspace_id);


--
-- Name: presets presets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.presets
    ADD CONSTRAINT presets_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_key UNIQUE (user_id);


--
-- Name: profiles profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);


--
-- Name: prompt_workspaces prompt_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_pkey PRIMARY KEY (prompt_id, workspace_id);


--
-- Name: prompts prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_pkey PRIMARY KEY (id);


--
-- Name: tool_workspaces tool_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_pkey PRIMARY KEY (tool_id, workspace_id);


--
-- Name: tools tools_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (id);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: -
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: -
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: -
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: assistant_collections_assistant_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_collections_assistant_id_idx ON public.assistant_collections USING btree (assistant_id);


--
-- Name: assistant_collections_collection_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_collections_collection_id_idx ON public.assistant_collections USING btree (collection_id);


--
-- Name: assistant_collections_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_collections_user_id_idx ON public.assistant_collections USING btree (user_id);


--
-- Name: assistant_files_assistant_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_files_assistant_id_idx ON public.assistant_files USING btree (assistant_id);


--
-- Name: assistant_files_file_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_files_file_id_idx ON public.assistant_files USING btree (file_id);


--
-- Name: assistant_files_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_files_user_id_idx ON public.assistant_files USING btree (user_id);


--
-- Name: assistant_tools_assistant_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_tools_assistant_id_idx ON public.assistant_tools USING btree (assistant_id);


--
-- Name: assistant_tools_tool_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_tools_tool_id_idx ON public.assistant_tools USING btree (tool_id);


--
-- Name: assistant_tools_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_tools_user_id_idx ON public.assistant_tools USING btree (user_id);


--
-- Name: assistant_workspaces_assistant_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_workspaces_assistant_id_idx ON public.assistant_workspaces USING btree (assistant_id);


--
-- Name: assistant_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_workspaces_user_id_idx ON public.assistant_workspaces USING btree (user_id);


--
-- Name: assistant_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistant_workspaces_workspace_id_idx ON public.assistant_workspaces USING btree (workspace_id);


--
-- Name: assistants_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX assistants_user_id_idx ON public.assistants USING btree (user_id);


--
-- Name: collection_workspaces_collection_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX collection_workspaces_collection_id_idx ON public.collection_workspaces USING btree (collection_id);


--
-- Name: collection_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX collection_workspaces_user_id_idx ON public.collection_workspaces USING btree (user_id);


--
-- Name: collection_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX collection_workspaces_workspace_id_idx ON public.collection_workspaces USING btree (workspace_id);


--
-- Name: collections_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX collections_user_id_idx ON public.collections USING btree (user_id);


--
-- Name: file_items_embedding_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_items_embedding_idx ON public.file_items USING hnsw (openai_embedding extensions.vector_cosine_ops);


--
-- Name: file_items_file_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_items_file_id_idx ON public.file_items USING btree (file_id);


--
-- Name: file_items_local_embedding_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_items_local_embedding_idx ON public.file_items USING hnsw (local_embedding extensions.vector_cosine_ops);


--
-- Name: file_workspaces_file_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_workspaces_file_id_idx ON public.file_workspaces USING btree (file_id);


--
-- Name: file_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_workspaces_user_id_idx ON public.file_workspaces USING btree (user_id);


--
-- Name: file_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX file_workspaces_workspace_id_idx ON public.file_workspaces USING btree (workspace_id);


--
-- Name: files_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_user_id_idx ON public.files USING btree (user_id);


--
-- Name: folders_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX folders_user_id_idx ON public.folders USING btree (user_id);


--
-- Name: folders_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX folders_workspace_id_idx ON public.folders USING btree (workspace_id);


--
-- Name: idx_chat_files_chat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_chat_files_chat_id ON public.chat_files USING btree (chat_id);


--
-- Name: idx_chats_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_chats_user_id ON public.chats USING btree (user_id);


--
-- Name: idx_chats_workspace_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_chats_workspace_id ON public.chats USING btree (workspace_id);


--
-- Name: idx_collection_files_collection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_files_collection_id ON public.collection_files USING btree (collection_id);


--
-- Name: idx_collection_files_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_files_file_id ON public.collection_files USING btree (file_id);


--
-- Name: idx_message_file_items_message_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_message_file_items_message_id ON public.message_file_items USING btree (message_id);


--
-- Name: idx_messages_chat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_messages_chat_id ON public.messages USING btree (chat_id);


--
-- Name: idx_profiles_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_profiles_user_id ON public.profiles USING btree (user_id);


--
-- Name: idx_unique_home_workspace_per_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_home_workspace_per_user ON public.workspaces USING btree (user_id) WHERE is_home;


--
-- Name: idx_workspaces_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_workspaces_user_id ON public.workspaces USING btree (user_id);


--
-- Name: model_workspaces_model_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_workspaces_model_id_idx ON public.model_workspaces USING btree (model_id);


--
-- Name: model_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_workspaces_user_id_idx ON public.model_workspaces USING btree (user_id);


--
-- Name: model_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_workspaces_workspace_id_idx ON public.model_workspaces USING btree (workspace_id);


--
-- Name: models_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX models_user_id_idx ON public.models USING btree (user_id);


--
-- Name: preset_workspaces_preset_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX preset_workspaces_preset_id_idx ON public.preset_workspaces USING btree (preset_id);


--
-- Name: preset_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX preset_workspaces_user_id_idx ON public.preset_workspaces USING btree (user_id);


--
-- Name: preset_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX preset_workspaces_workspace_id_idx ON public.preset_workspaces USING btree (workspace_id);


--
-- Name: presets_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX presets_user_id_idx ON public.presets USING btree (user_id);


--
-- Name: prompt_workspaces_prompt_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prompt_workspaces_prompt_id_idx ON public.prompt_workspaces USING btree (prompt_id);


--
-- Name: prompt_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prompt_workspaces_user_id_idx ON public.prompt_workspaces USING btree (user_id);


--
-- Name: prompt_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prompt_workspaces_workspace_id_idx ON public.prompt_workspaces USING btree (workspace_id);


--
-- Name: prompts_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prompts_user_id_idx ON public.prompts USING btree (user_id);


--
-- Name: tool_workspaces_tool_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tool_workspaces_tool_id_idx ON public.tool_workspaces USING btree (tool_id);


--
-- Name: tool_workspaces_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tool_workspaces_user_id_idx ON public.tool_workspaces USING btree (user_id);


--
-- Name: tool_workspaces_workspace_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tool_workspaces_workspace_id_idx ON public.tool_workspaces USING btree (workspace_id);


--
-- Name: tools_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tools_user_id_idx ON public.tools USING btree (user_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: -
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: -
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: users create_profile_and_workspace_trigger; Type: TRIGGER; Schema: auth; Owner: -
--

CREATE TRIGGER create_profile_and_workspace_trigger AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.create_profile_and_workspace();


--
-- Name: assistants delete_old_assistant_image; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER delete_old_assistant_image AFTER DELETE ON public.assistants FOR EACH ROW EXECUTE FUNCTION public.delete_old_assistant_image();


--
-- Name: files delete_old_file; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER delete_old_file BEFORE DELETE ON public.files FOR EACH ROW EXECUTE FUNCTION public.delete_old_file();


--
-- Name: messages delete_old_message_images; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER delete_old_message_images AFTER DELETE ON public.messages FOR EACH ROW EXECUTE FUNCTION public.delete_old_message_images();


--
-- Name: profiles delete_old_profile_image; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER delete_old_profile_image AFTER DELETE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.delete_old_profile_image();


--
-- Name: workspaces delete_old_workspace_image; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER delete_old_workspace_image AFTER DELETE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.delete_old_workspace_image();


--
-- Name: workspaces prevent_update_of_home_field; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER prevent_update_of_home_field BEFORE UPDATE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.prevent_home_field_update();


--
-- Name: assistant_collections update_assistant_collections_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_assistant_collections_updated_at BEFORE UPDATE ON public.assistant_collections FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistant_files update_assistant_files_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_assistant_files_updated_at BEFORE UPDATE ON public.assistant_files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistant_tools update_assistant_tools_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_assistant_tools_updated_at BEFORE UPDATE ON public.assistant_tools FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistant_workspaces update_assistant_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_assistant_workspaces_updated_at BEFORE UPDATE ON public.assistant_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: assistants update_assistants_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_assistants_updated_at BEFORE UPDATE ON public.assistants FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: chat_files update_chat_files_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_chat_files_updated_at BEFORE UPDATE ON public.chat_files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: chats update_chats_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_chats_updated_at BEFORE UPDATE ON public.chats FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: collection_files update_collection_files_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_collection_files_updated_at BEFORE UPDATE ON public.collection_files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: collection_workspaces update_collection_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_collection_workspaces_updated_at BEFORE UPDATE ON public.collection_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: collections update_collections_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_collections_updated_at BEFORE UPDATE ON public.collections FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: file_workspaces update_file_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_file_workspaces_updated_at BEFORE UPDATE ON public.file_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: files update_files_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_files_updated_at BEFORE UPDATE ON public.files FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: folders update_folders_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_folders_updated_at BEFORE UPDATE ON public.folders FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: message_file_items update_message_file_items_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_message_file_items_updated_at BEFORE UPDATE ON public.message_file_items FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: messages update_messages_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_messages_updated_at BEFORE UPDATE ON public.messages FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: model_workspaces update_model_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_model_workspaces_updated_at BEFORE UPDATE ON public.model_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: models update_models_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_models_updated_at BEFORE UPDATE ON public.models FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: preset_workspaces update_preset_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_preset_workspaces_updated_at BEFORE UPDATE ON public.preset_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: presets update_presets_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_presets_updated_at BEFORE UPDATE ON public.presets FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: file_items update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.file_items FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: profiles update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: prompt_workspaces update_prompt_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_prompt_workspaces_updated_at BEFORE UPDATE ON public.prompt_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: prompts update_prompts_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_prompts_updated_at BEFORE UPDATE ON public.prompts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: tool_workspaces update_tool_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tool_workspaces_updated_at BEFORE UPDATE ON public.tool_workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: tools update_tools_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tools_updated_at BEFORE UPDATE ON public.tools FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: workspaces update_workspaces_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_workspaces_updated_at BEFORE UPDATE ON public.workspaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: assistant_collections assistant_collections_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_collections assistant_collections_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON DELETE CASCADE;


--
-- Name: assistant_collections assistant_collections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_collections
    ADD CONSTRAINT assistant_collections_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_files assistant_files_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_files assistant_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: assistant_files assistant_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_files
    ADD CONSTRAINT assistant_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_tools assistant_tools_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_tools assistant_tools_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tools(id) ON DELETE CASCADE;


--
-- Name: assistant_tools assistant_tools_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_tools
    ADD CONSTRAINT assistant_tools_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_workspaces assistant_workspaces_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: assistant_workspaces assistant_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: assistant_workspaces assistant_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistant_workspaces
    ADD CONSTRAINT assistant_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: assistants assistants_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: assistants assistants_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chat_files chat_files_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_files chat_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: chat_files chat_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_files
    ADD CONSTRAINT chat_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chats chats_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: chats chats_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: chats chats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chats chats_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: collection_files collection_files_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON DELETE CASCADE;


--
-- Name: collection_files collection_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: collection_files collection_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_files
    ADD CONSTRAINT collection_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: collection_workspaces collection_workspaces_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON DELETE CASCADE;


--
-- Name: collection_workspaces collection_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: collection_workspaces collection_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_workspaces
    ADD CONSTRAINT collection_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: collections collections_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: collections collections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: file_items file_items_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_items
    ADD CONSTRAINT file_items_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: file_items file_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_items
    ADD CONSTRAINT file_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: file_workspaces file_workspaces_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: file_workspaces file_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: file_workspaces file_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_workspaces
    ADD CONSTRAINT file_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: files files_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: files files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: folders folders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: folders folders_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: message_file_items message_file_items_file_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_file_item_id_fkey FOREIGN KEY (file_item_id) REFERENCES public.file_items(id) ON DELETE CASCADE;


--
-- Name: message_file_items message_file_items_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: message_file_items message_file_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_file_items
    ADD CONSTRAINT message_file_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_assistant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES public.assistants(id) ON DELETE CASCADE;


--
-- Name: messages messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: model_workspaces model_workspaces_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- Name: model_workspaces model_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: model_workspaces model_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_workspaces
    ADD CONSTRAINT model_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: models models_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: models models_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: preset_workspaces preset_workspaces_preset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_preset_id_fkey FOREIGN KEY (preset_id) REFERENCES public.presets(id) ON DELETE CASCADE;


--
-- Name: preset_workspaces preset_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: preset_workspaces preset_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preset_workspaces
    ADD CONSTRAINT preset_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: presets presets_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.presets
    ADD CONSTRAINT presets_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: presets presets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.presets
    ADD CONSTRAINT presets_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: prompt_workspaces prompt_workspaces_prompt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_prompt_id_fkey FOREIGN KEY (prompt_id) REFERENCES public.prompts(id) ON DELETE CASCADE;


--
-- Name: prompt_workspaces prompt_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: prompt_workspaces prompt_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_workspaces
    ADD CONSTRAINT prompt_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: prompts prompts_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: prompts prompts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: tool_workspaces tool_workspaces_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tools(id) ON DELETE CASCADE;


--
-- Name: tool_workspaces tool_workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: tool_workspaces tool_workspaces_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tool_workspaces
    ADD CONSTRAINT tool_workspaces_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: tools tools_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE SET NULL;


--
-- Name: tools tools_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: workspaces workspaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: assistant_collections Allow full access to own assistant_collections; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own assistant_collections" ON public.assistant_collections USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistant_files Allow full access to own assistant_files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own assistant_files" ON public.assistant_files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistant_tools Allow full access to own assistant_tools; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own assistant_tools" ON public.assistant_tools USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistant_workspaces Allow full access to own assistant_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own assistant_workspaces" ON public.assistant_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: assistants Allow full access to own assistants; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own assistants" ON public.assistants USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: chat_files Allow full access to own chat_files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own chat_files" ON public.chat_files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: chats Allow full access to own chats; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own chats" ON public.chats USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collection_files Allow full access to own collection_files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own collection_files" ON public.collection_files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collection_workspaces Allow full access to own collection_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own collection_workspaces" ON public.collection_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collections Allow full access to own collections; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own collections" ON public.collections USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: file_items Allow full access to own file items; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own file items" ON public.file_items USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: file_workspaces Allow full access to own file_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own file_workspaces" ON public.file_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: files Allow full access to own files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own files" ON public.files USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: folders Allow full access to own folders; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own folders" ON public.folders USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: message_file_items Allow full access to own message_file_items; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own message_file_items" ON public.message_file_items USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: messages Allow full access to own messages; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own messages" ON public.messages USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: model_workspaces Allow full access to own model_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own model_workspaces" ON public.model_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: models Allow full access to own models; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own models" ON public.models USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: preset_workspaces Allow full access to own preset_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own preset_workspaces" ON public.preset_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: presets Allow full access to own presets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own presets" ON public.presets USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: profiles Allow full access to own profiles; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own profiles" ON public.profiles USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: prompt_workspaces Allow full access to own prompt_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own prompt_workspaces" ON public.prompt_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: prompts Allow full access to own prompts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own prompts" ON public.prompts USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: tool_workspaces Allow full access to own tool_workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own tool_workspaces" ON public.tool_workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: tools Allow full access to own tools; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own tools" ON public.tools USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: workspaces Allow full access to own workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow full access to own workspaces" ON public.workspaces USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: collection_files Allow view access to collection files for non-private collectio; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to collection files for non-private collectio" ON public.collection_files FOR SELECT USING ((collection_id IN ( SELECT collections.id
   FROM public.collections
  WHERE (collections.sharing <> 'private'::text))));


--
-- Name: files Allow view access to files for non-private collections; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to files for non-private collections" ON public.files FOR SELECT USING ((id IN ( SELECT collection_files.file_id
   FROM public.collection_files
  WHERE (collection_files.collection_id IN ( SELECT collections.id
           FROM public.collections
          WHERE (collections.sharing <> 'private'::text))))));


--
-- Name: messages Allow view access to messages for non-private chats; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to messages for non-private chats" ON public.messages FOR SELECT USING ((chat_id IN ( SELECT chats.id
   FROM public.chats
  WHERE (chats.sharing <> 'private'::text))));


--
-- Name: assistants Allow view access to non-private assistants; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private assistants" ON public.assistants FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: chats Allow view access to non-private chats; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private chats" ON public.chats FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: collections Allow view access to non-private collections; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private collections" ON public.collections FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: file_items Allow view access to non-private file items; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private file items" ON public.file_items FOR SELECT USING ((file_id IN ( SELECT files.id
   FROM public.files
  WHERE (files.sharing <> 'private'::text))));


--
-- Name: files Allow view access to non-private files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private files" ON public.files FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: models Allow view access to non-private models; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private models" ON public.models FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: presets Allow view access to non-private presets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private presets" ON public.presets FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: prompts Allow view access to non-private prompts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private prompts" ON public.prompts FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: tools Allow view access to non-private tools; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private tools" ON public.tools FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: workspaces Allow view access to non-private workspaces; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow view access to non-private workspaces" ON public.workspaces FOR SELECT USING ((sharing <> 'private'::text));


--
-- Name: assistant_collections; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.assistant_collections ENABLE ROW LEVEL SECURITY;

--
-- Name: assistant_files; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.assistant_files ENABLE ROW LEVEL SECURITY;

--
-- Name: assistant_tools; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.assistant_tools ENABLE ROW LEVEL SECURITY;

--
-- Name: assistant_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.assistant_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: assistants; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.assistants ENABLE ROW LEVEL SECURITY;

--
-- Name: chat_files; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.chat_files ENABLE ROW LEVEL SECURITY;

--
-- Name: chats; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.chats ENABLE ROW LEVEL SECURITY;

--
-- Name: collection_files; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.collection_files ENABLE ROW LEVEL SECURITY;

--
-- Name: collection_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.collection_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: collections; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.collections ENABLE ROW LEVEL SECURITY;

--
-- Name: file_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.file_items ENABLE ROW LEVEL SECURITY;

--
-- Name: file_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.file_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: files; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.files ENABLE ROW LEVEL SECURITY;

--
-- Name: folders; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.folders ENABLE ROW LEVEL SECURITY;

--
-- Name: message_file_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.message_file_items ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: model_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.model_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: models; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.models ENABLE ROW LEVEL SECURITY;

--
-- Name: preset_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.preset_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: presets; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.presets ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: prompt_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.prompt_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: prompts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.prompts ENABLE ROW LEVEL SECURITY;

--
-- Name: tool_workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tool_workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: tools; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tools ENABLE ROW LEVEL SECURITY;

--
-- Name: workspaces; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.workspaces ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow authenticated delete access to own file; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated delete access to own file" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'files'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated delete access to own profile images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated delete access to own profile images" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'profile_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated insert access to own file; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated insert access to own file" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'files'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated insert access to own profile images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated insert access to own profile images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'profile_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated update access to own file; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated update access to own file" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'files'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow authenticated update access to own profile images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated update access to own profile images" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'profile_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow delete access to own assistant images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow delete access to own assistant images" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'assistant_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow delete access to own message images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow delete access to own message images" ON storage.objects FOR DELETE USING (((bucket_id = 'message_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow delete access to own workspace images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow delete access to own workspace images" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'workspace_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow insert access to own assistant images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow insert access to own assistant images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'assistant_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow insert access to own message images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow insert access to own message images" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'message_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow insert access to own workspace images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow insert access to own workspace images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'workspace_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow public read access on non-private assistant images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public read access on non-private assistant images" ON storage.objects FOR SELECT USING (((bucket_id = 'assistant_images'::text) AND public.non_private_assistant_exists(name)));


--
-- Name: objects Allow public read access on non-private files; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public read access on non-private files" ON storage.objects FOR SELECT USING (((bucket_id = 'files'::text) AND public.non_private_file_exists(name)));


--
-- Name: objects Allow public read access on non-private workspace images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public read access on non-private workspace images" ON storage.objects FOR SELECT USING (((bucket_id = 'workspace_images'::text) AND public.non_private_workspace_exists(name)));


--
-- Name: objects Allow public read access on profile images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public read access on profile images" ON storage.objects FOR SELECT USING ((bucket_id = 'profile_images'::text));


--
-- Name: objects Allow read access to own message images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow read access to own message images" ON storage.objects FOR SELECT USING (((bucket_id = 'message_images'::text) AND (((storage.foldername(name))[1] = (auth.uid())::text) OR (EXISTS ( SELECT 1
   FROM public.chats
  WHERE ((chats.id = ( SELECT messages.chat_id
           FROM public.messages
          WHERE (messages.id = ((storage.foldername(chats.name))[2])::uuid))) AND (chats.sharing <> 'private'::text)))))));


--
-- Name: objects Allow update access to own assistant images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow update access to own assistant images" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'assistant_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow update access to own message images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow update access to own message images" ON storage.objects FOR UPDATE USING (((bucket_id = 'message_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow update access to own workspace images; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow update access to own workspace images" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'workspace_images'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Allow users to read their own files; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow users to read their own files" ON storage.objects FOR SELECT TO authenticated USING (((auth.uid())::text = owner_id));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--

