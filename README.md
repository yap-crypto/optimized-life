# Optimized Life

A personal study OS: daily task planning, spaced-repetition recall, week-by-week test plans, quick notes, and a day-by-day history of everything you've done.

**Live app:** deploy this repo to Vercel (it's a single static `index.html` — zero config).

## Privacy model

All data is stored in the browser's `localStorage`, namespaced per profile. Nothing is ever sent to a server — the site is static. That means:

- Your tasks, notes and history are **private to your device and browser**.
- Use **Profile menu → Export my data** to download a JSON backup.
- Clearing site data in the browser clears the app's data too, so export occasionally.

## Features

- **Tasks** — plan tonight for tomorrow, drag to complete, carried-over tracking, weekly dashboard with completion chart and gauges.
- **Recall** — spaced repetition (1 / 3 / 7 / 14 / 30 days) with self-testing prompts and optional browser notifications on revision days.
- **Tests** — countdown and week-by-week study plan per exam.
- **Notes** — quick color-coded notes with pinning.
- **History** — a day-by-day log of completed tasks, study sessions, recall results, and notes.
- **Profiles** — sign in with name + email (local only). Google sign-in is wired via Google Identity Services: paste an OAuth client ID into `GOOGLE_CLIENT_ID` at the top of the script in `index.html`.

## Development

No build step. Serve the folder with any static server:

```bash
python3 -m http.server 8642
```

## Deploy

1. Push this repo to GitHub.
2. In [Vercel](https://vercel.com/new), import the repo — framework preset "Other", no build command, output directory left empty.
3. Every push to `main` redeploys automatically.
