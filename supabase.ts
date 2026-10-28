import { createClient } from '@supabase/supabase-js';
export function supabasePublic(){return createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!,process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!)}
export function supabaseServer(){return createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!,process.env.SUPABASE_SECRET_KEY!,{auth:{autoRefreshToken:false,persistSession:false}})}
