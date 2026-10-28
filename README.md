# TomatoRank Nigeria — Full-stack starter

This is a deployable Next.js + Supabase foundation for the TomatoRank product-ranking site.

## What works now
- Responsive public website
- Supabase/Postgres schema
- Product/ranking database
- Live database-driven homepage
- Community voting API
- Basic admin dashboard scaffold
- Seed products and demo rankings
- API route for rankings

## Setup
1. Create a Supabase project.
2. Open SQL Editor and run `supabase/schema.sql`, then `supabase/seed.sql`.
3. Create `.env.local` from `.env.example`.
4. Put your Supabase URL, publishable key, and server secret key in `.env.local`.
5. Run `npm install` then `npm run dev`.
6. Deploy to Vercel and add the same environment variables.

## Social data
Do not put social API secrets in browser code. Add connectors as server-side scheduled jobs/Edge Functions. The project intentionally does not bypass platform restrictions.

- X: use the current official X API and account/project access you are entitled to.
- Instagram/Meta: use the current Meta/Instagram APIs and permissions available to your app.
- TikTok: use an approved commercial/research product that fits your use case. TikTok Research Tools have eligibility/approval restrictions; commercial projects should not assume Research API access.

## Production security
- Replace the demo admin gate with Supabase Auth.
- Keep the secret key server-side only.
- Enable RLS on every public table and add least-privilege policies.
- Add rate limiting/CAPTCHA to public voting.
- Store only permitted data and follow each platform's terms.
- Add a moderation workflow before reviews become ranking inputs.

## Ranking engine
Recommended production formula:
30% approved consumer reviews + 25% social sentiment + 15% trend momentum + 15% value + 10% cooking/performance + 5% availability.

The database already contains the fields needed for this formula. A scheduled worker can recompute rankings after each data ingestion run.
