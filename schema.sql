create extension if not exists pgcrypto;
create table if not exists products (id uuid primary key default gen_random_uuid(), brand text not null, product_name text not null, size_g integer, image_url text, active boolean default true, created_at timestamptz default now());
create table if not exists social_mentions (id uuid primary key default gen_random_uuid(), product_id uuid references products(id) on delete cascade, platform text not null, external_id text, post_url text, text_content text, likes integer default 0, comments integer default 0, views integer default 0, sentiment numeric(5,2), topic_scores jsonb default '{}'::jsonb, published_at timestamptz, collected_at timestamptz default now(), unique(platform,external_id));
create table if not exists reviews (id uuid primary key default gen_random_uuid(), product_id uuid references products(id) on delete cascade, rating numeric(3,1) not null, review_text text, source text default 'community', approved boolean default false, created_at timestamptz default now());
create table if not exists prices (id uuid primary key default gen_random_uuid(), product_id uuid references products(id) on delete cascade, retailer text not null, price_ngn numeric(12,2) not null, url text, recorded_at timestamptz default now());
create table if not exists votes (id uuid primary key default gen_random_uuid(), product_id uuid references products(id) on delete cascade, vote_type text default 'jollof', created_at timestamptz default now());
create table if not exists rankings (product_id uuid primary key references products(id) on delete cascade, social_score numeric(5,2) default 0, review_score numeric(5,2) default 0, trend_score numeric(5,2) default 0, value_score numeric(5,2) default 0, performance_score numeric(5,2) default 0, availability_score numeric(5,2) default 0, overall_score numeric(5,2) default 0, confidence numeric(5,2) default 0, updated_at timestamptz default now());
create table if not exists data_sources (id uuid primary key default gen_random_uuid(), platform text not null, status text default 'not_connected', last_sync timestamptz, notes text);

alter table products enable row level security; alter table rankings enable row level security; alter table reviews enable row level security; alter table votes enable row level security;
create policy "public read active products" on products for select using (active=true);
create policy "public read rankings" on rankings for select using (true);
create policy "public read approved reviews" on reviews for select using (approved=true);
create policy "public insert votes" on votes for insert with check (true);

insert into products (brand,product_name,size_g) values ('Gino','Gino Tomato Paste',70),('De Rica','De Rica Tomato Paste',70),('Tasty Tom','Tasty Tom Tomato Paste',70),('Sonia','Sonia Tomato Paste',70),('Ric-Giko','Ric-Giko Tomato Paste',70) on conflict do nothing;
