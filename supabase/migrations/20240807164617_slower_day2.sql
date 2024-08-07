-- drop trigger if exists "update_assistant_collections_updated_at" on "public"."assistant_collections";

-- drop trigger if exists "update_assistant_files_updated_at" on "public"."assistant_files";

-- drop trigger if exists "update_assistant_tools_updated_at" on "public"."assistant_tools";

-- drop trigger if exists "update_chat_files_updated_at" on "public"."chat_files";

-- drop trigger if exists "update_file_workspaces_updated_at" on "public"."file_workspaces";

-- drop trigger if exists "update_tool_workspaces_updated_at" on "public"."tool_workspaces";

-- drop trigger if exists "update_tools_updated_at" on "public"."tools";

-- drop policy "Allow full access to own assistant_collections" on "public"."assistant_collections";

-- drop policy "Allow full access to own assistant_files" on "public"."assistant_files";

-- drop policy "Allow full access to own assistant_tools" on "public"."assistant_tools";

-- drop policy "Allow full access to own chat_files" on "public"."chat_files";

-- drop policy "Allow full access to own file_workspaces" on "public"."file_workspaces";

-- drop policy "Allow full access to own tool_workspaces" on "public"."tool_workspaces";

-- drop policy "Allow full access to own tools" on "public"."tools";

-- drop policy "Allow view access to non-private tools" on "public"."tools";

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

-- revoke delete on table "public"."file_workspaces" from "anon";

-- revoke insert on table "public"."file_workspaces" from "anon";

-- revoke references on table "public"."file_workspaces" from "anon";

-- revoke select on table "public"."file_workspaces" from "anon";

-- revoke trigger on table "public"."file_workspaces" from "anon";

-- revoke truncate on table "public"."file_workspaces" from "anon";

-- revoke update on table "public"."file_workspaces" from "anon";

-- revoke delete on table "public"."file_workspaces" from "authenticated";

-- revoke insert on table "public"."file_workspaces" from "authenticated";

-- revoke references on table "public"."file_workspaces" from "authenticated";

-- revoke select on table "public"."file_workspaces" from "authenticated";

-- revoke trigger on table "public"."file_workspaces" from "authenticated";

-- revoke truncate on table "public"."file_workspaces" from "authenticated";

-- revoke update on table "public"."file_workspaces" from "authenticated";

-- revoke delete on table "public"."file_workspaces" from "service_role";

-- revoke insert on table "public"."file_workspaces" from "service_role";

-- revoke references on table "public"."file_workspaces" from "service_role";

-- revoke select on table "public"."file_workspaces" from "service_role";

-- revoke trigger on table "public"."file_workspaces" from "service_role";

-- revoke truncate on table "public"."file_workspaces" from "service_role";

-- revoke update on table "public"."file_workspaces" from "service_role";

-- revoke delete on table "public"."tool_workspaces" from "anon";

-- revoke insert on table "public"."tool_workspaces" from "anon";

-- revoke references on table "public"."tool_workspaces" from "anon";

-- revoke select on table "public"."tool_workspaces" from "anon";

-- revoke trigger on table "public"."tool_workspaces" from "anon";

-- revoke truncate on table "public"."tool_workspaces" from "anon";

-- revoke update on table "public"."tool_workspaces" from "anon";

-- revoke delete on table "public"."tool_workspaces" from "authenticated";

-- revoke insert on table "public"."tool_workspaces" from "authenticated";

-- revoke references on table "public"."tool_workspaces" from "authenticated";

-- revoke select on table "public"."tool_workspaces" from "authenticated";

-- revoke trigger on table "public"."tool_workspaces" from "authenticated";

-- revoke truncate on table "public"."tool_workspaces" from "authenticated";

-- revoke update on table "public"."tool_workspaces" from "authenticated";

-- revoke delete on table "public"."tool_workspaces" from "service_role";

-- revoke insert on table "public"."tool_workspaces" from "service_role";

-- revoke references on table "public"."tool_workspaces" from "service_role";

-- revoke select on table "public"."tool_workspaces" from "service_role";

-- revoke trigger on table "public"."tool_workspaces" from "service_role";

-- revoke truncate on table "public"."tool_workspaces" from "service_role";

-- revoke update on table "public"."tool_workspaces" from "service_role";

-- revoke delete on table "public"."tools" from "anon";

-- revoke insert on table "public"."tools" from "anon";

-- revoke references on table "public"."tools" from "anon";

-- revoke select on table "public"."tools" from "anon";

-- revoke trigger on table "public"."tools" from "anon";

-- revoke truncate on table "public"."tools" from "anon";

-- revoke update on table "public"."tools" from "anon";

-- revoke delete on table "public"."tools" from "authenticated";

-- revoke insert on table "public"."tools" from "authenticated";

-- revoke references on table "public"."tools" from "authenticated";

-- revoke select on table "public"."tools" from "authenticated";

-- revoke trigger on table "public"."tools" from "authenticated";

-- revoke truncate on table "public"."tools" from "authenticated";

-- revoke update on table "public"."tools" from "authenticated";

-- revoke delete on table "public"."tools" from "service_role";

-- revoke insert on table "public"."tools" from "service_role";

-- revoke references on table "public"."tools" from "service_role";

-- revoke select on table "public"."tools" from "service_role";

-- revoke trigger on table "public"."tools" from "service_role";

-- revoke truncate on table "public"."tools" from "service_role";

-- revoke update on table "public"."tools" from "service_role";

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

-- alter table "public"."file_workspaces" drop constraint "file_workspaces_file_id_fkey";

-- alter table "public"."file_workspaces" drop constraint "file_workspaces_user_id_fkey";

-- alter table "public"."file_workspaces" drop constraint "file_workspaces_workspace_id_fkey";

-- alter table "public"."tool_workspaces" drop constraint "tool_workspaces_tool_id_fkey";

-- alter table "public"."tool_workspaces" drop constraint "tool_workspaces_user_id_fkey";

-- alter table "public"."tool_workspaces" drop constraint "tool_workspaces_workspace_id_fkey";

-- alter table "public"."tools" drop constraint "tools_description_check";

-- alter table "public"."tools" drop constraint "tools_folder_id_fkey";

-- alter table "public"."tools" drop constraint "tools_name_check";

-- alter table "public"."tools" drop constraint "tools_url_check";

-- alter table "public"."tools" drop constraint "tools_user_id_fkey";

-- alter table "public"."assistant_collections" drop constraint "assistant_collections_pkey";

-- alter table "public"."assistant_files" drop constraint "assistant_files_pkey";

-- alter table "public"."assistant_tools" drop constraint "assistant_tools_pkey";

-- alter table "public"."chat_files" drop constraint "chat_files_pkey";

-- alter table "public"."file_workspaces" drop constraint "file_workspaces_pkey";

-- alter table "public"."tool_workspaces" drop constraint "tool_workspaces_pkey";

-- alter table "public"."tools" drop constraint "tools_pkey";

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

-- drop index if exists "public"."file_workspaces_file_id_idx";

-- drop index if exists "public"."file_workspaces_pkey";

-- drop index if exists "public"."file_workspaces_user_id_idx";

-- drop index if exists "public"."file_workspaces_workspace_id_idx";

-- drop index if exists "public"."idx_chat_files_chat_id";

-- drop index if exists "public"."tool_workspaces_pkey";

-- drop index if exists "public"."tool_workspaces_tool_id_idx";

-- drop index if exists "public"."tool_workspaces_user_id_idx";

-- drop index if exists "public"."tool_workspaces_workspace_id_idx";

-- drop index if exists "public"."tools_pkey";

-- drop index if exists "public"."tools_user_id_idx";

-- drop table "public"."assistant_collections";

-- drop table "public"."assistant_files";

-- drop table "public"."assistant_tools";

-- drop table "public"."chat_files";

-- drop table "public"."file_workspaces";

-- drop table "public"."tool_workspaces";

-- drop table "public"."tools";


