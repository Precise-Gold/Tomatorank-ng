import {NextResponse} from 'next/server';import {supabaseServer} from '../../../lib/supabase';
export async function GET(){const {data,error}=await supabaseServer().from('rankings').select('*,products(*)').order('overall_score',{ascending:false});if(error)return NextResponse.json({error:error.message},{status:500});return NextResponse.json(data)}
