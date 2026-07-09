-- =========================================================================
-- SUPABASE SYSTEM SETTINGS FUNCTION
-- Run this script in your Supabase SQL Editor to support the start/stop voting toggle
-- =========================================================================

CREATE OR REPLACE FUNCTION set_voting_status(active_state boolean)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER -- Bypasses Row Level Security (RLS) policies
AS $$
BEGIN
    -- Check if the SystemSettings record already exists
    IF NOT EXISTS (SELECT 1 FROM candidates WHERE "Position" = 'SystemSettings') THEN
        -- Insert a dedicated settings row with a fixed UUID
        INSERT INTO candidates (id, "Name", "Position", "Grade", "voteCount")
        VALUES ('00000000-0000-0000-0000-000000000000', 'SystemSettings', 'SystemSettings', '1.0', CASE WHEN active_state THEN 1 ELSE 0 END);
    ELSE
        -- Update the existing settings row
        UPDATE candidates
        SET "voteCount" = CASE WHEN active_state THEN 1 ELSE 0 END
        WHERE "Position" = 'SystemSettings';
    END IF;
    
    RETURN true;
END;
$$;

-- Explicitly grant execute permission to anon, authenticated, and public roles
GRANT EXECUTE ON FUNCTION set_voting_status(boolean) TO anon;
GRANT EXECUTE ON FUNCTION set_voting_status(boolean) TO authenticated;
GRANT EXECUTE ON FUNCTION set_voting_status(boolean) TO public;
