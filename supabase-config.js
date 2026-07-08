// ==========================================
// SUPABASE CONFIGURATION
// ==========================================
// INSTRUCTIONS:
// 1. Go to your Supabase Project Settings (Gear Icon) -> API.
// 2. Your Project URL is already set below.
// 3. Copy the "anon public" API key and paste it as `supabaseKey` below.

const supabaseUrl = "https://slwagfxehkstiayhnhli.supabase.co";
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNsd2FnZnhlaGtzdGlheWhuaGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM1MjM1MjksImV4cCI6MjA5OTA5OTUyOX0.9hgTp897x-pdQdzH3ljMb0ZbDDAOAnsSiyqkXjO0GDQ";

// Initialize Supabase Client
let supabaseClient = null;

if (typeof supabase !== 'undefined' && supabaseUrl && supabaseUrl !== "YOUR_SUPABASE_URL" && supabaseKey && supabaseKey !== "YOUR_SUPABASE_ANON_KEY") {
    supabaseClient = supabase.createClient(supabaseUrl, supabaseKey);
}
