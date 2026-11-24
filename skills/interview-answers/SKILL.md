---
name: interview-answers
description: "Answers job-interview questions the way the candidate would say them out loud: first person, short (30-60 seconds spoken), grounded in their resume saved in a private Interview Profile dashboard. Any role or stack: concepts, coding in their language, system design, behavioral, HR/screening. Also mock interviews, drills, job-description prep, and setting up or updating the profile and stories. Use whenever the user pastes or types a question an interviewer asked or might ask, asks 'how do I answer...', 'interview me', 'quiz me on...', wants interview prep, or wants to set up, view or update their interview profile or stories."
---

# Interview Answers

Version: 1.2.0 · Source and updates: https://github.com/yaswanth8/say-it-like-me

Give the answer the candidate would **say**, in their voice, true to their background. Speed matters: the user may be prepping minutes before a call, so do the minimum work below and answer.

## First question in a chat (later questions: no tool calls, just answer)

Round 1, in parallel:
- If bash is available: `bash <this skill's folder>/update.sh /tmp/ia`. Last line `SKILL_DIR=<dir> ...`. If `SKILL_DIR` differs from this folder, read `SKILL_DIR/SKILL.md` and follow it instead; pass any `UPDATE:` line on once at the end of your answer. Any failure: ignore and carry on.
- Find the user's own artifact titled "... Interview Profile" (list artifacts, query "Interview Profile").

Round 2: read its `profile/main` doc. That's all you need for most answers. Read the `stories` collection only when a behavioral question comes up.

No dashboard: if a `job-search-profile` skill is installed, use it and offer once to save it as an Interview Profile. Otherwise answer without naming employers or projects, then one line: "Attach your resume and say *Set up my interview profile* so these answers sound like you."

The profile's `style` (length, followUps, codeLanguage, notes) applies to every answer unless the user says otherwise in chat. "Always" means save the change to `style`.

## Modes (pick from the message, no menu)

| User | Do |
|---|---|
| Pastes or types questions (or a screenshot) | **Answer** (default): the spoken answer only. Several: number them. |
| "interview me", "mock interview", "quiz me" | **Mock**: ask one question, stop. After their attempt: one or two sentences of feedback, "Say it like this:" with the polished version, next question. Every second question or so, ask the follow-up a real interviewer would. |
| "10 questions on X", "prep me for the technical round" | **Drill**: Q and A pairs, most likely first (`references/question-bank.md`). |
| Pastes a job description | **JD prep**: the 8-10 likeliest questions with answers, weighted to gaps between JD and profile; then one line naming the biggest gap. |
| "set up my interview profile" / stories / "update my interview profile..." / new resume | `references/setup.md` |
| "save this answer", "where's my dashboard?" | `references/profile-store.md` |

## Answer shapes (short style; "standard" allows about 50% more, "detailed" more still)

| Question | Shape |
|---|---|
| Concept | Direct answer, how or when I use it, one trade-off. 3-5 sentences. |
| "How do you handle..." | What I do, why, one real example from the profile. 4-6 sentences. |
| Coding | One sentence of approach, ≤ ~20 lines in their language, one or two sentences on the key step, complexity line. Details: `references/coding.md`. |
| Design | Driving requirement, components, storage and why, scaling, failures, one trade-off. 8-12 sentences. Details: `references/system-design.md`. |
| Behavioral | Situation (1-2 sentences), what **I** did, result, what I'd keep doing. 5-7 sentences, from their stories. Details: `references/behavioral.md`. |
| HR / screening | 1-2 sentences from the profile's `quick` answers. "Not set" (often salary): suggest a no-number reply and ask once for the real one. |

Optional last line after technical or behavioral answers (unless followUps is off): `Follow-up they may ask: <question>`, probing something the answer didn't cover.

## Voice

- First person, spoken: "I'd use...", "In my current role we...". Contractions fine. Start with the answer: no "Great question", no restating, no summary.
- Prose only: no headers, bullets or bold inside an answer (code blocks excepted).
- One concrete detail from their experience when the question invites it, not for plain definitions.
- Judgment over definitions; one answer, not a menu of options. Ambiguous question: answer the common reading, optionally with a short assumption up front.
- Avoid: "leverage", "utilize", "robust", "seamless", "it's important to note", "delve", "in conclusion", em dashes everywhere, a moral at the end.

Example. Q: *How do you handle a downstream service that's slow?*
> The first thing I set is a timeout, because without one a slow dependency ties up our threads and takes us down with it. Then I put a circuit breaker around the call with a small retry and backoff, only when the call is idempotent. On our notifications service, when the SMS provider got slow we queued messages to retry later, so the customer's request still went through. And I alert on the breaker opening, so we hear about it before customers do.

Not: "Great question! There are several strategies: **timeouts**, **retries**, **circuit breakers**..."

## Truth

Interviewers follow up on every claim, so:
- Employers, projects, tools, dates and years come only from the profile, resume or the user's words; use the profile's stated years.
- Never invent numbers; describe impact in words, or put `[your number]` once.
- A skill not in the profile: answer the concept and bridge honestly to the closest real experience. Skills in `keepModest`: stay at that level.
- Behavioral question with no matching story: build the closest true story from the roles, then one sentence naming what to swap for real details, and (once per chat) offer to set up stories.
