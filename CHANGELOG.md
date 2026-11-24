# Changelog

Newest first. Each entry is `## <skill> <version>`; `tools/build.py` checks that the entry exists.

## interview-answers 1.3.0

- On only where you call it: the skill switches on when you call it by name in a chat (/interview-answers, "use interview-answers", "interview mode", "say it like me") and stays on for the rest of that chat. Other chats answer normally, even for interview-style questions. "Stop interview mode" turns it off. Setup and dashboard requests still work in any chat.

## interview-answers 1.2.0

Faster and lighter.
- The first question in a chat needs two quick rounds before the answer (update check and dashboard lookup together, then the profile) instead of four; later questions need none.
- Stories are read only for behavioral questions.
- Voice rules and the example now live in SKILL.md, which is about 40% shorter; `references/voice.md` is gone.
- The update check gives up after a few seconds when GitHub is slow, so it never holds up an answer.

## interview-answers 1.1.0

For everyone, not just one stack.
- **Interview Profile dashboard**: "Set up my interview profile" reads your resume, asks five basic questions in one message (target roles, years per skill, skills to keep modest, screening answers, answer style) and saves them to a private dashboard with its own database. Every chat reads it; you can check or edit it any time.
- Stories and saved answers live on the dashboard too ("Set up my interview stories", "save this answer"); "update my interview profile: ..." changes a field.
- Role- and language-neutral: coding answers in your language, examples across roles, a question bank covering Java, Python, JavaScript, .NET, front end, cloud/DevOps, QA, data, ML and product.
- README: setup table and first prompts.

## interview-answers 1.0.0

First release.
- Answers interview questions in the candidate's own voice: first person, 30-60 seconds spoken, no bullets or filler.
- Grounded in the `job-search-profile` skill (or an attached resume): employers, projects and years come only from there; no invented numbers.
- Modes: Answer (default), Mock interview, Drill, JD prep, and Stories setup for behavioral questions.
- References for coding (Java 17+, SQL, React, Angular), system design, behavioral and HR answers, plus a question bank.
- `update.sh` checks this repo's VERSION once per chat and uses the newer copy when there is one.
