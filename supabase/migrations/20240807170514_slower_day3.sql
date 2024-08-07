-- drop trigger if exists "update_assistant_collections_updated_at" on "public"."assistant_collections";

-- drop trigger if exists "update_assistant_files_updated_at" on "public"."assistant_files";

-- drop trigger if exists "update_assistant_tools_updated_at" on "public"."assistant_tools";

-- drop trigger if exists "update_chat_files_updated_at" on "public"."chat_files";

-- drop trigger if exists "update_message_file_items_updated_at" on "public"."message_file_items";

-- drop trigger if exists "update_model_workspaces_updated_at" on "public"."model_workspaces";

-- drop trigger if exists "update_models_updated_at" on "public"."models";

-- drop policy "Allow full access to own assistant_collections" on "public"."assistant_collections";

-- drop policy "Allow full access to own assistant_files" on "public"."assistant_files";

-- drop policy "Allow full access to own assistant_tools" on "public"."assistant_tools";

-- drop policy "Allow full access to own chat_files" on "public"."chat_files";

-- drop policy "Allow full access to own message_file_items" on "public"."message_file_items";

-- drop policy "Allow full access to own model_workspaces" on "public"."model_workspaces";

-- drop policy "Allow full access to own models" on "public"."models";

-- drop policy "Allow view access to non-private models" on "public"."models";

-- revoke delete on table "public"."assistant_collections" from "anon";

-- revoke insert on table "public"."assistant_collections" from "anon";

-- revoke references on table "public"."assistant_collections" from "anon";

-- revoke select on table "public"."assistant_collections" from "anon";

-- revoke trigger on table "public"."assistant_collections" from "anon";

-- revoke truncate on table "public"."assistant_collections" from "anon";

-- revoke update on table "public"."assistant_collections" from "anon";

-- revoke delete on table "public"."assistant_collections" from "authenticated";

-- revoke insert on table "public"."assistant_collections" from "authenticated";

-- revoke references on table "public"."assistant_collections" from "authenticated";

-- revoke select on table "public"."assistant_collections" from "authenticated";

-- revoke trigger on table "public"."assistant_collections" from "authenticated";

-- revoke truncate on table "public"."assistant_collections" from "authenticated";

-- revoke update on table "public"."assistant_collections" from "authenticated";

-- revoke delete on table "public"."assistant_collections" from "service_role";

-- revoke insert on table "public"."assistant_collections" from "service_role";

-- revoke references on table "public"."assistant_collections" from "service_role";

-- revoke select on table "public"."assistant_collections" from "service_role";

-- revoke trigger on table "public"."assistant_collections" from "service_role";

-- revoke truncate on table "public"."assistant_collections" from "service_role";

-- revoke update on table "public"."assistant_collections" from "service_role";

-- revoke delete on table "public"."assistant_files" from "anon";

-- revoke insert on table "public"."assistant_files" from "anon";

-- revoke references on table "public"."assistant_files" from "anon";

-- revoke select on table "public"."assistant_files" from "anon";

-- revoke trigger on table "public"."assistant_files" from "anon";

-- revoke truncate on table "public"."assistant_files" from "anon";

-- revoke update on table "public"."assistant_files" from "anon";

-- revoke delete on table "public"."assistant_files" from "authenticated";

-- revoke insert on table "public"."assistant_files" from "authenticated";

-- revoke references on table "public"."assistant_files" from "authenticated";

-- revoke select on table "public"."assistant_files" from "authenticated";

-- revoke trigger on table "public"."assistant_files" from "authenticated";

-- revoke truncate on table "public"."assistant_files" from "authenticated";

-- revoke update on table "public"."assistant_files" from "authenticated";

-- revoke delete on table "public"."assistant_files" from "service_role";

-- revoke insert on table "public"."assistant_files" from "service_role";

-- revoke references on table "public"."assistant_files" from "service_role";

-- revoke select on table "public"."assistant_files" from "service_role";

-- revoke trigger on table "public"."assistant_files" from "service_role";

-- revoke truncate on table "public"."assistant_files" from "service_role";

-- revoke update on table "public"."assistant_files" from "service_role";

-- revoke delete on table "public"."assistant_tools" from "anon";

-- revoke insert on table "public"."assistant_tools" from "anon";

-- revoke references on table "public"."assistant_tools" from "anon";

-- revoke select on table "public"."assistant_tools" from "anon";

-- revoke trigger on table "public"."assistant_tools" from "anon";

-- revoke truncate on table "public"."assistant_tools" from "anon";

-- revoke update on table "public"."assistant_tools" from "anon";

-- revoke delete on table "public"."assistant_tools" from "authenticated";

-- revoke insert on table "public"."assistant_tools" from "authenticated";

-- revoke references on table "public"."assistant_tools" from "authenticated";

-- revoke select on table "public"."assistant_tools" from "authenticated";

-- revoke trigger on table "public"."assistant_tools" from "authenticated";

-- revoke truncate on table "public"."assistant_tools" from "authenticated";

-- revoke update on table "public"."assistant_tools" from "authenticated";

-- revoke delete on table "public"."assistant_tools" from "service_role";

-- revoke insert on table "public"."assistant_tools" from "service_role";

-- revoke references on table "public"."assistant_tools" from "service_role";

-- revoke select on table "public"."assistant_tools" from "service_role";

-- revoke trigger on table "public"."assistant_tools" from "service_role";

-- revoke truncate on table "public"."assistant_tools" from "service_role";

-- revoke update on table "public"."assistant_tools" from "service_role";

-- revoke delete on table "public"."chat_files" from "anon";

-- revoke insert on table "public"."chat_files" from "anon";

-- revoke references on table "public"."chat_files" from "anon";

-- revoke select on table "public"."chat_files" from "anon";

-- revoke trigger on table "public"."chat_files" from "anon";

-- revoke truncate on table "public"."chat_files" from "anon";

-- revoke update on table "public"."chat_files" from "anon";

-- revoke delete on table "public"."chat_files" from "authenticated";

-- revoke insert on table "public"."chat_files" from "authenticated";

-- revoke references on table "public"."chat_files" from "authenticated";

-- revoke select on table "public"."chat_files" from "authenticated";

-- revoke trigger on table "public"."chat_files" from "authenticated";

-- revoke truncate on table "public"."chat_files" from "authenticated";

-- revoke update on table "public"."chat_files" from "authenticated";

-- revoke delete on table "public"."chat_files" from "service_role";

-- revoke insert on table "public"."chat_files" from "service_role";

-- revoke references on table "public"."chat_files" from "service_role";

-- revoke select on table "public"."chat_files" from "service_role";

-- revoke trigger on table "public"."chat_files" from "service_role";

-- revoke truncate on table "public"."chat_files" from "service_role";

-- revoke update on table "public"."chat_files" from "service_role";

-- revoke delete on table "public"."message_file_items" from "anon";

-- revoke insert on table "public"."message_file_items" from "anon";

-- revoke references on table "public"."message_file_items" from "anon";

-- revoke select on table "public"."message_file_items" from "anon";

-- revoke trigger on table "public"."message_file_items" from "anon";

-- revoke truncate on table "public"."message_file_items" from "anon";

-- revoke update on table "public"."message_file_items" from "anon";

-- revoke delete on table "public"."message_file_items" from "authenticated";

-- revoke insert on table "public"."message_file_items" from "authenticated";

-- revoke references on table "public"."message_file_items" from "authenticated";

-- revoke select on table "public"."message_file_items" from "authenticated";

-- revoke trigger on table "public"."message_file_items" from "authenticated";

-- revoke truncate on table "public"."message_file_items" from "authenticated";

-- revoke update on table "public"."message_file_items" from "authenticated";

-- revoke delete on table "public"."message_file_items" from "service_role";

-- revoke insert on table "public"."message_file_items" from "service_role";

-- revoke references on table "public"."message_file_items" from "service_role";

-- revoke select on table "public"."message_file_items" from "service_role";

-- revoke trigger on table "public"."message_file_items" from "service_role";

-- revoke truncate on table "public"."message_file_items" from "service_role";

-- revoke update on table "public"."message_file_items" from "service_role";

-- revoke delete on table "public"."model_workspaces" from "anon";

-- revoke insert on table "public"."model_workspaces" from "anon";

-- revoke references on table "public"."model_workspaces" from "anon";

-- revoke select on table "public"."model_workspaces" from "anon";

-- revoke trigger on table "public"."model_workspaces" from "anon";

-- revoke truncate on table "public"."model_workspaces" from "anon";

-- revoke update on table "public"."model_workspaces" from "anon";

-- revoke delete on table "public"."model_workspaces" from "authenticated";

-- revoke insert on table "public"."model_workspaces" from "authenticated";

-- revoke references on table "public"."model_workspaces" from "authenticated";

-- revoke select on table "public"."model_workspaces" from "authenticated";

-- revoke trigger on table "public"."model_workspaces" from "authenticated";

-- revoke truncate on table "public"."model_workspaces" from "authenticated";

-- revoke update on table "public"."model_workspaces" from "authenticated";

-- revoke delete on table "public"."model_workspaces" from "service_role";

-- revoke insert on table "public"."model_workspaces" from "service_role";

-- revoke references on table "public"."model_workspaces" from "service_role";

-- revoke select on table "public"."model_workspaces" from "service_role";

-- revoke trigger on table "public"."model_workspaces" from "service_role";

-- revoke truncate on table "public"."model_workspaces" from "service_role";

-- revoke update on table "public"."model_workspaces" from "service_role";

-- revoke delete on table "public"."models" from "anon";

-- revoke insert on table "public"."models" from "anon";

-- revoke references on table "public"."models" from "anon";

-- revoke select on table "public"."models" from "anon";

-- revoke trigger on table "public"."models" from "anon";

-- revoke truncate on table "public"."models" from "anon";

-- revoke update on table "public"."models" from "anon";

-- revoke delete on table "public"."models" from "authenticated";

-- revoke insert on table "public"."models" from "authenticated";

-- revoke references on table "public"."models" from "authenticated";

-- revoke select on table "public"."models" from "authenticated";

-- revoke trigger on table "public"."models" from "authenticated";

-- revoke truncate on table "public"."models" from "authenticated";

-- revoke update on table "public"."models" from "authenticated";

-- revoke delete on table "public"."models" from "service_role";

-- revoke insert on table "public"."models" from "service_role";

-- revoke references on table "public"."models" from "service_role";

-- revoke select on table "public"."models" from "service_role";

-- revoke trigger on table "public"."models" from "service_role";

-- revoke truncate on table "public"."models" from "service_role";

-- revoke update on table "public"."models" from "service_role";

-- alter table "public"."assistant_collections" drop constraint "assistant_collections_assistant_id_fkey";

-- alter table "public"."assistant_collections" drop constraint "assistant_collections_collection_id_fkey";

-- alter table "public"."assistant_collections" drop constraint "assistant_collections_user_id_fkey";

-- alter table "public"."assistant_files" drop constraint "assistant_files_assistant_id_fkey";

-- alter table "public"."assistant_files" drop constraint "assistant_files_file_id_fkey";

-- alter table "public"."assistant_files" drop constraint "assistant_files_user_id_fkey";

-- alter table "public"."assistant_tools" drop constraint "assistant_tools_assistant_id_fkey";

-- alter table "public"."assistant_tools" drop constraint "assistant_tools_tool_id_fkey";

-- alter table "public"."assistant_tools" drop constraint "assistant_tools_user_id_fkey";

-- alter table "public"."chat_files" drop constraint "chat_files_chat_id_fkey";

-- alter table "public"."chat_files" drop constraint "chat_files_file_id_fkey";

-- alter table "public"."chat_files" drop constraint "chat_files_user_id_fkey";

-- alter table "public"."message_file_items" drop constraint "message_file_items_file_item_id_fkey";

-- alter table "public"."message_file_items" drop constraint "message_file_items_message_id_fkey";

-- alter table "public"."message_file_items" drop constraint "message_file_items_user_id_fkey";

-- alter table "public"."model_workspaces" drop constraint "model_workspaces_model_id_fkey";

-- alter table "public"."model_workspaces" drop constraint "model_workspaces_user_id_fkey";

-- alter table "public"."model_workspaces" drop constraint "model_workspaces_workspace_id_fkey";

-- alter table "public"."models" drop constraint "models_api_key_check";

-- alter table "public"."models" drop constraint "models_base_url_check";

-- alter table "public"."models" drop constraint "models_description_check";

-- alter table "public"."models" drop constraint "models_folder_id_fkey";

-- alter table "public"."models" drop constraint "models_model_id_check";

-- alter table "public"."models" drop constraint "models_name_check";

-- alter table "public"."models" drop constraint "models_user_id_fkey";

-- alter table "public"."assistant_collections" drop constraint "assistant_collections_pkey";

-- alter table "public"."assistant_files" drop constraint "assistant_files_pkey";

-- alter table "public"."assistant_tools" drop constraint "assistant_tools_pkey";

-- alter table "public"."chat_files" drop constraint "chat_files_pkey";

-- alter table "public"."message_file_items" drop constraint "message_file_items_pkey";

-- alter table "public"."model_workspaces" drop constraint "model_workspaces_pkey";

-- alter table "public"."models" drop constraint "models_pkey";

-- drop index if exists "public"."assistant_collections_assistant_id_idx";

-- drop index if exists "public"."assistant_collections_collection_id_idx";

-- drop index if exists "public"."assistant_collections_pkey";

-- drop index if exists "public"."assistant_collections_user_id_idx";

-- drop index if exists "public"."assistant_files_assistant_id_idx";

-- drop index if exists "public"."assistant_files_file_id_idx";

-- drop index if exists "public"."assistant_files_pkey";

-- drop index if exists "public"."assistant_files_user_id_idx";

-- drop index if exists "public"."assistant_tools_assistant_id_idx";

-- drop index if exists "public"."assistant_tools_pkey";

-- drop index if exists "public"."assistant_tools_tool_id_idx";

-- drop index if exists "public"."assistant_tools_user_id_idx";

-- drop index if exists "public"."chat_files_pkey";

-- drop index if exists "public"."idx_chat_files_chat_id";

-- drop index if exists "public"."idx_message_file_items_message_id";

-- drop index if exists "public"."message_file_items_pkey";

-- drop index if exists "public"."model_workspaces_model_id_idx";

-- drop index if exists "public"."model_workspaces_pkey";

-- drop index if exists "public"."model_workspaces_user_id_idx";

-- drop index if exists "public"."model_workspaces_workspace_id_idx";

-- drop index if exists "public"."models_pkey";

-- drop index if exists "public"."models_user_id_idx";

-- drop table "public"."assistant_collections";

-- drop table "public"."assistant_files";

-- drop table "public"."assistant_tools";

-- drop table "public"."chat_files";

-- drop table "public"."message_file_items";

-- drop table "public"."model_workspaces";

-- drop table "public"."models";


