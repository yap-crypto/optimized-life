-- Optimized Life — database setup
-- Run this once in your Supabase project: Dashboard → SQL Editor → New query → paste → Run.

-- One row per user holding their whole app state as JSON.
create table if not exists public.user_data (
  user_id uuid primary key references auth.users (id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Row-level security: each user can only ever read/write their own row.
alter table public.user_data enable row level security;

drop policy if exists "Users manage own data" on public.user_data;
create policy "Users manage own data" on public.user_data
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
