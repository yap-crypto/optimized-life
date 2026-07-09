# Optimized Life

A personal study OS: daily task planning, spaced-repetition recall, week-by-week test plans, quick notes, and a day-by-day history of everything you've done.

**Live app:** deploy this repo to Vercel (it's a single static `index.html` — zero config).

## Data & privacy

The app has two modes:

**Local-only mode** (default, zero setup) — all data lives in the browser's `localStorage`, namespaced per profile. Nothing is sent anywhere.

**Cloud mode** (free, via [Supabase](https://supabase.com)) — real accounts with email + password (with confirmation emails) or Google sign-in. Data is stored in a Postgres database protected by row-level security, so each user can only ever read their own row. Log in from any device and your data appears. localStorage doubles as an offline cache.

### Enabling cloud mode (~5 minutes, free)

1. Sign up at [supabase.com](https://supabase.com) (GitHub login works) and create a project.
2. In the project: **SQL Editor → New query**, paste the contents of [`supabase-setup.sql`](supabase-setup.sql), Run.
3. **Settings → API**: copy the **Project URL** and **anon public** key into `SUPABASE_URL` / `SUPABASE_ANON_KEY` at the top of the script in `index.html`. (The anon key is safe to publish.)
4. **Authentication → URL Configuration**: set the Site URL to your deployed URL (e.g. `https://yap-crypto.github.io/optimized-life/`) and add it to the redirect list.
5. Optional, for Google sign-in: **Authentication → Providers → Google** — follow Supabase's inline guide to create a Google OAuth client and paste its ID/secret.
6. Commit and push — done. Email signups now get a confirmation link before they can log in.

Either mode: **Profile menu → Export my data** downloads a JSON backup.

## Features

- **Tasks** — plan tonight for tomorrow, drag to complete, carried-over tracking, weekly dashboard with completion chart and gauges.
- **Recall** — spaced repetition (1 / 3 / 7 / 14 / 30 days) with self-testing prompts and optional browser notifications on revision days.
- **Tests** — countdown and week-by-week study plan per exam.
- **Notes** — quick color-coded notes with pinning.
- **History** — a day-by-day log of completed tasks, study sessions, recall results, and notes.
- **Profiles** — local name + email profiles out of the box; real accounts (email confirmation + Google sign-in + cross-device sync) when cloud mode is enabled — see below.

## Development

No build step. Serve the folder with any static server:

```bash
python3 -m http.server 8642
```

## Deploy

1. Push this repo to GitHub.
2. In [Vercel](https://vercel.com/new), import the repo — framework preset "Other", no build command, output directory left empty.
3. Every push to `main` redeploys automatically.
