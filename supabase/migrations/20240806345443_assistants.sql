-- -- Recreate the assistants table
-- CREATE TABLE IF NOT EXISTS public.assistants (
--     id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
--     user_id UUID NOT NULL REFERENCES auth.users(id),
--     folder_id UUID REFERENCES public.folders(id),
--     name TEXT NOT NULL,
--     description TEXT NOT NULL,
--     model TEXT NOT NULL,
--     prompt TEXT NOT NULL,
--     temperature NUMERIC NOT NULL,
--     context_length INTEGER NOT NULL,
--     embeddings_provider TEXT NOT NULL,
--     image_path TEXT NOT NULL,
--     include_profile_context BOOLEAN NOT NULL,
--     include_workspace_instructions BOOLEAN NOT NULL,
--     sharing TEXT NOT NULL DEFAULT 'private',
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP WITH TIME ZONE
-- );

-- -- Add indexes
-- -- CREATE INDEX assistants_user_id_idx ON public.assistants (user_id);
-- -- CREATE INDEX assistants_folder_id_idx ON public.assistants (folder_id);

-- -- Add RLS policies
-- ALTER TABLE public.assistants ENABLE ROW LEVEL SECURITY;

-- CREATE POLICY "Users can create their own assistants"
-- ON public.assistants FOR INSERT
-- TO authenticated
-- WITH CHECK (auth.uid() = user_id);

-- CREATE POLICY "Users can view their own assistants"
-- ON public.assistants FOR SELECT
-- TO authenticated
-- USING (auth.uid() = user_id);

-- CREATE POLICY "Users can update their own assistants"
-- ON public.assistants FOR UPDATE
-- TO authenticated
-- USING (auth.uid() = user_id);

-- CREATE POLICY "Users can delete their own assistants"
-- ON public.assistants FOR DELETE
-- TO authenticated
-- USING (auth.uid() = user_id);

-- -- Add assistant_id to messages table
-- -- ALTER TABLE public.messages
-- -- ADD COLUMN assistant_id UUID REFERENCES public.assistants(id);

-- -- Create index on assistant_id in messages table
-- CREATE INDEX messages_assistant_id_idx ON public.messages (assistant_id);

-- -- Add trigger for updated_at
-- -- CREATE TRIGGER set_updated_at
-- -- BEFORE UPDATE ON public.assistants
-- -- FOR EACH ROW
-- -- EXECUTE FUNCTION public.set_updated_at();

-- -- Grant permissions
-- GRANT ALL ON public.assistants TO authenticated;
-- GRANT ALL ON public.assistants TO service_role;