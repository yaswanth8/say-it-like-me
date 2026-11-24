# The Interview Profile: where the candidate's details live

Each person's details live in **their own private artifact**, "<Name>'s Interview Profile": a small dashboard with a database. Claude reads it at the start of a chat and writes to it when the user sets up or changes something. The user opens it any time to check or edit their details. Nothing personal is ever written into the skill or the repo.

## The database

| Path | Holds |
|---|---|
| `profile/main` | Everything about the candidate (fields below) |
| `stories/<id>` | One behavioral story: `{title, situation, action, result, useFor: [..], updatedAt}`. Id: `s-` plus a short slug of the title |
| `answers/<id>` | One saved answer: `{question, answer, topic, savedAt}`. Id: `a-` plus YYYYMMDD plus a short slug |
| `meta/dashboard` | `{template: <n>}`: which `assets/dashboard.html` template the page was published from |

`profile/main` fields (leave a field out rather than guess it):

| Field | Example |
|---|---|
| name, headline, currentTitle, location | "Priya Sharma", "Senior Python Developer · 7 years · Austin, TX" |
| totalYears | 7 (number) |
| targetRoles | ["Backend Engineer", "Senior Python Developer"] |
| skills | [{name: "Python", years: 7}, ...] sorted by importance; years as the user states them |
| keepModest | ["Kubernetes: deploys only", "Go: side projects only"]: skills to claim only at this level |
| roles | [{company, client, title, start: "2022-03", end: "present", highlights: ["Owns the refunds service", ...]}] newest first, 2-5 highlights each, from the resume |
| education, certifications, domains | lists of short strings |
| quick | [{q: "Work authorization", a: "..."}, {q: "Notice period", a: "2 weeks"}, ...]: screening answers in the user's words |
| style | {length: "short (30-60 seconds)" or "standard (about 90 seconds)" or "detailed", followUps: true, codeLanguage: "Python", notes: ""} |
| source, updatedAt | "resume" or "job-search-profile"; YYYY-MM-DD |

## Tools

The artifact tool differs by app. On claude.ai the built-in **Artifact** tool has actions such as `list`, `publish`, `read_db` and `write_db`. Elsewhere the same work is done by `list_artifacts`, `publish_files` / `publish_version`, `declare_capabilities`, `db_get`, `db_list` and `db_write`. Use whichever is present (search the tool list once if neither is loaded). Every write to a doc that already exists needs its current version (`ifVersion`): read it first.

## Recipes

**Find it (each chat, once).** List the user's own artifacts with the query "Interview Profile" and take the one that is theirs. Then read `profile/main` and list `stories`. Don't list `answers` unless the user asks about saved answers.

**Create it (setup).**
1. Copy `assets/dashboard.html`, replace `{{TITLE}}` with "<First name>'s Interview Profile".
2. Publish it as a new artifact with that title and icon "profile".
3. Declare its capabilities: `{db: {rules: [{path: "", read: "view", write: "admin"}]}, user: {}}`. (On claude.ai's Artifact tool, pass the same declaration with the publish.)
4. Write `profile/main` (set), each story (set), and `meta/dashboard` `{template: <assets/dashboard.version>}` in one write call.
5. Give the user the link in one line. It is private to them until they share it.

**Update a field.** Read `profile/main`, then `update` only the changed fields plus `updatedAt`, with `ifVersion`. Confirm in one short line ("Notice period is now 30 days."). A version mismatch means the user edited the dashboard meanwhile: read again and redo the change on top of theirs.

**Save an answer.** "Save this answer" / "save that": `set answers/<id>` with the question, the answer text exactly as given, a one- or two-word topic and today's date. Confirm in a few words.

**Refresh the page.** When `assets/dashboard.version` is higher than `meta/dashboard.template` (or that doc is missing), offer once to refresh the dashboard's design. On yes: republish the new template to the same artifact (same title), keep the declaration, set `meta/dashboard`. The data is untouched; it lives in the database.

## When there is no artifact tool

Some apps can't publish artifacts. Then keep the profile in the chat: after setup, give the user the profile as a compact block titled "My interview profile" to keep and paste at the start of future chats, and say once that the dashboard needs the Claude app or claude.ai with artifacts.
