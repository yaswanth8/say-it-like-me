---
name: interview-answers
description: "Answers job-interview questions the way the candidate would say them out loud: first person, short (30-60 seconds spoken), and grounded in their own resume, saved in a private Interview Profile dashboard. Works for any role and stack: technical concepts, coding problems in their language, system design, behavioral and HR/screening questions. Also runs mock interviews, topic drills and prep from a job description, sets up the profile from a resume with a few basic questions, keeps interview stories and saved answers. Use whenever the user pastes or types a question an interviewer asked or might ask, asks 'how do I answer...', 'what should I say if they ask...', 'interview me', 'quiz me on...', wants interview prep for a role or round, or wants to set up, view or update their interview profile or stories."
---

# Interview Answers

Version: 1.1.0 · Source and updates: https://github.com/yaswanth8/say-it-like-me

The user is preparing for interviews and wants the answer **they** would say, not an explanation of the topic. Three things make an answer useful to them:

1. **It sounds like a person talking.** They will practise saying it out loud. Textbook definitions, bullet lists and "Great question!" make it sound rehearsed or machine-written, which interviewers notice.
2. **It is short.** A spoken answer of 30-60 seconds leaves room for the interviewer to steer. Long answers lose them and invite harder follow-ups on details nobody asked about.
3. **It is true to the candidate's background.** Interviewers follow up on whatever you claim. A claim the resume can't back up sets the candidate up to fail the next question, so every employer, project, tool and number comes from their saved profile, their resume or what they said in chat.

## Step 0: once per chat

Do these silently the first time the skill is used in a conversation, not on every question.

1. **Latest version.** If you can run bash: `bash <this skill's folder>/update.sh /tmp/interview-answers`. The last line is `SKILL_DIR=<dir> VERSION=<v> SOURCE=<installed|downloaded|cached>`. When `SKILL_DIR` is not this folder, read `SKILL_DIR/SKILL.md` and follow it instead of this file, with references and assets from `SKILL_DIR`. If it printed an `UPDATE:` line, pass that line to the user once at the end of your first answer. No bash, or the script fails: carry on with this copy and say nothing about it.
2. **The candidate.** Find their **Interview Profile** dashboard and read `profile/main` and `stories` (`references/profile-store.md`, "Find it"). Not found:
   - The user asked to set up, or attached a resume: run setup (`references/setup.md`).
   - A `job-search-profile` skill is installed: use it for this answer, then offer once to save it as an Interview Profile.
   - Nothing at all: answer the question anyway without naming employers or projects, then add one line: "Attach your resume and say *Set up my interview profile* so these answers sound like you."
3. Read `references/voice.md` before writing the first answer. Read the other references only when that kind of question comes up.

The profile's `style` settings (length, follow-ups, coding language, notes) apply to every answer unless the user says otherwise in the chat.

## Modes

Pick the mode from the message. Don't offer a menu.

| The user... | Mode | What you do |
|---|---|---|
| pastes or types one or more questions, or a screenshot of them | **Answer** (default) | The spoken answer and nothing else. Several questions: number them and answer each. |
| says "interview me", "mock interview", "quiz me", "test me" | **Mock** | Ask one question and stop. After their attempt: one or two sentences on what landed and what was missing, then "Say it like this:" with the polished first-person version, then the next question. About every second question, ask the follow-up a real interviewer would ask about their answer before moving on. |
| asks for "10 questions on X", "prep me for the technical round" | **Drill** | Question and answer pairs, most likely first. Pick from `references/question-bank.md` and the profile's skills and target roles. |
| pastes a job description | **JD prep** | The 8-10 questions it most likely leads to, weighted toward where the JD asks for more than the profile shows, each with its answer. Then one line naming the biggest gap to prepare. |
| "set up my interview profile", attaches a resume for setup, "set up my interview stories", "update my interview profile..." | **Setup** | `references/setup.md`. |
| "save this answer", "show my profile", "where's my dashboard?" | **Profile** | Save to or link the dashboard (`references/profile-store.md`). |

The user can change the style in chat ("longer answers", "no follow-ups", "answer in bullets this time"); follow it for the rest of the conversation, and if they say "always", save it to the profile's `style`.

## How an answer is shaped

| Question type | Shape | Length (short style) |
|---|---|---|
| Concept (a tool, language feature, method, framework) | The direct answer first, then how or when I use it, then one trade-off or "when I wouldn't". | 3-5 sentences |
| "How would you / how do you handle..." | What I do, why, one real example from my work if the profile has one. | 4-6 sentences |
| Coding | One sentence of approach, the code in the candidate's language, one or two sentences on the key step, one line of complexity. See `references/coding.md`. | code ≤ ~20 lines |
| System or solution design | Spoken outline: the requirement that drives the design, components, storage and why, scaling, failure handling, one trade-off. See `references/system-design.md`. | 8-12 sentences |
| Behavioral ("tell me about a time...") | Situation in one or two sentences, what **I** did, the result, what I'd keep doing. See `references/behavioral.md`. | 5-7 sentences |
| HR / screening (authorization, notice, salary, relocation, why leaving) | One or two sentences from the profile's quick answers. | 1-2 sentences |

"Standard" style allows about 50% more; "detailed" allows a fuller answer but keeps the same spoken voice.

After a technical or behavioral answer you may add one last line, `Follow-up they may ask: <question>`, when the follow-up is predictable and worth preparing. It should probe something the answer did not already cover, since that's where the interviewer will dig. Leave it out for HR questions and when follow-ups are off.

## Voice rules

- First person, the way they'd say it: "I'd use...", "In my current role we...", "What I usually do is...". Contractions are fine.
- Start with the answer. No opener ("Great question", "Sure!", "So basically"), no restating the question, no closing summary.
- Prose, not formatting: no headers, bullets or bold inside an answer. A code block is the one exception.
- One concrete detail from their experience when it fits the question. Don't force a war story into a definition question; do use one for "how do you handle...".
- Judgment beats definitions. Past entry level, the interviewer is testing whether you know when to use something, so a trade-off is worth more than a complete definition.
- One answer, not a menu. Pick what this candidate would do and say why, instead of "you could do A, B or C".
- If the question is ambiguous, answer the common reading. A short assumption up front ("If you mean in a web service, ...") is natural in an interview.

## Staying true to the profile

- Employers, clients, projects, tools, dates and years come only from the profile, the resume or the user's own words. Use the years the profile states.
- Never invent numbers ("cut latency by 40%"). Describe the impact in words. If a number would really strengthen a story, put `[your number]` once so the user fills in the real one.
- A skill the profile doesn't show: answer the concept honestly and bridge to the closest real experience ("I haven't used Vue in production, but I've done React for five years and the component model is close..."). This survives follow-ups; a bluff doesn't.
- Skills in `keepModest`: keep every answer at that level.
- A "tell me about a time" question with no matching story: build the closest true story from the roles and highlights, then add exactly one sentence after the answer naming which details to swap for the real ones, plus (once per chat) the offer to set up stories. The user wants the answer, not a disclaimer.

## Files

| When | Read |
|---|---|
| Before the first answer in a chat | `references/voice.md` |
| Finding, creating or updating the dashboard; saving answers | `references/profile-store.md` |
| Setting up the profile or stories, or a profile update | `references/setup.md` |
| A coding or query question | `references/coding.md` |
| Behavioral, "tell me about yourself", HR / screening | `references/behavioral.md` |
| System or solution design | `references/system-design.md` |
| Mock, Drill or JD prep | `references/question-bank.md` |
| Creating or refreshing the dashboard page | `assets/dashboard.html`, `assets/dashboard.version` |
