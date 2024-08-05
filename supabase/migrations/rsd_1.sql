-- Drop unnecessary tables
DROP TABLE IF EXISTS assistant_tools;
DROP TABLE IF EXISTS assistant_files;
DROP TABLE IF EXISTS assistant_workspaces;
DROP TABLE IF EXISTS assistants;
DROP TABLE IF EXISTS tools;
DROP TABLE IF EXISTS model_workspaces;
DROP TABLE IF EXISTS models;
DROP TABLE IF EXISTS preset_workspaces;
DROP TABLE IF EXISTS presets;
DROP TABLE IF EXISTS file_items;
DROP TABLE IF EXISTS files;

-- Simplify profiles table
ALTER TABLE profiles
DROP COLUMN anthropic_api_key,
DROP COLUMN azure_openai_35_turbo_id,
DROP COLUMN azure_openai_45_turbo_id,
DROP COLUMN azure_openai_45_vision_id,
DROP COLUMN azure_openai_api_key,
DROP COLUMN azure_openai_endpoint,
DROP COLUMN google_gemini_api_key,
DROP COLUMN mistral_api_key,
DROP COLUMN openai_api_key,
DROP COLUMN openai_organization_id,
DROP COLUMN perplexity_api_key,
DROP COLUMN use_azure_openai;

-- Simplify workspaces table
ALTER TABLE workspaces
DROP COLUMN default_context_length,
DROP COLUMN default_model,
DROP COLUMN embeddings_provider,
DROP COLUMN include_profile_context,
DROP COLUMN include_workspace_instructions;

-- Update chats table
ALTER TABLE chats
DROP COLUMN model,
ADD COLUMN model TEXT NOT NULL DEFAULT 'claude-3-sonnet-20240229';

-- Update messages table
ALTER TABLE messages
DROP COLUMN model,
ADD COLUMN model TEXT NOT NULL DEFAULT 'claude-3-sonnet-20240229';