---
name: interview-answers
description: "Answers job-interview questions the way the candidate would say them out loud: first person, short (30-60 seconds spoken), and grounded in their own resume and projects. Covers Java, Spring Boot, microservices, Kafka, AWS, SQL, React/Angular, coding problems (clean Java with complexity), system design, behavioral and HR/screening questions. Also runs mock interviews, topic drills and prep from a job description. Reads the candidate's job-search-profile skill for their background. Use whenever the user pastes or types a question an interviewer asked or might ask, asks 'how do I answer...', 'what should I say if they ask...', 'interview me', 'quiz me on Spring Boot', wants a mock interview, interview prep for a role or round, or wants to set up their interview stories."
---

# Interview Answers

Version: 1.0.0 · Source and updates: https://github.com/yaswanth8/say-it-like-me

The user is preparing for interviews and wants the answer **they** would say, not an explanation of the topic. Three things make an answer useful to them:

1. **It sounds like a person talking.** They will practise saying it out loud. Textbook definitions, bullet lists and "Great question!" make it sound rehearsed or machine-written, which interviewers notice.
2. **It is short.** A spoken answer of 30-60 seconds leaves room for the interviewer to steer. Long answers lose them and invite harder follow-ups on details nobody asked about.
3. **It is true to the candidate's background.** Interviewers follow up on whatever you claim ("what did the retry policy look like?"). A claim the resume can't back up sets the candidate up to fail the next question, so every employer, project, tool and number comes from their profile, resume or what they said in chat.

## Step 0: once per chat

Do these silently the first time the skill is used in a conversation, not on every question.

1. **Latest version.** If you can run bash: `bash <this skill's folder>/update.sh /tmp/interview-answers`. The last line is `SKILL_DIR=<dir> VERSION=<v> SOURCE=<installed|downloaded|cached>`. When `SKILL_DIR` is not this folder, read `SKILL_DIR/SKILL.md` and follow it instead of this file, and read references from `SKILL_DIR/references/`. If it printed an `UPDATE:` line, pass that line to the user once at the end of your first answer. No bash, or the script fails: carry on with this copy and say nothing about it.
2. **The candidate.** Read the `job-search-profile` skill's SKILL.md if it is installed: resume facts, roles and dates, stack, stated years of experience, standard answers, and an optional `## Interview stories` section. Otherwise use a resume attached in the chat. If neither exists, answer the first question anyway without naming employers or projects, then ask once: "Attach your resume (or tell me your current role, stack and years) and I'll make these answers yours."
3. Read `references/voice.md` before writing the first answer. Read the other references only when that kind of question comes up.

## Modes

Pick the mode from the message. Don't offer a menu.

| The user... | Mode | What you do |
|---|---|---|
| pastes or types one or more questions, or a screenshot of them | **Answer** (default) | Give the spoken answer and nothing else. Several questions: number them and answer each. |
| says "interview me", "mock interview", "quiz me", "test me" | **Mock** | Ask one question and stop. After their attempt: one or two sentences on what landed and what was missing, then "Say it like this:" with the polished first-person version, then the next question. About every second question, ask the follow-up a real interviewer would ask about their answer before moving on. |
| asks for "10 questions on Kafka", "prep me for a Spring Boot round" | **Drill** | Question and answer pairs, ordered from most to least likely to be asked. Pick from `references/question-bank.md` and the candidate's stack. |
| pastes a job description | **JD prep** | The 8-10 questions that posting most likely leads to, weighted toward where the JD asks for more than the resume shows, each with its answer. Then one line naming the biggest gap to prepare. |
| says "set up my interview stories" | **Stories** | Follow "Setting up interview stories" below. |

The user can change the defaults in chat ("longer answers", "no follow-ups", "answer in bullets this time"); follow that for the rest of the conversation.

## How an answer is shaped

| Question type | Shape | Length |
|---|---|---|
| Concept (Java, Spring, Kafka, AWS, SQL, React...) | The direct answer first, then how or when I use it, then one trade-off or "when I wouldn't". | 3-5 sentences |
| "How would you / how do you handle..." | What I do, why, one real example from my work if the profile has one. | 4-6 sentences |
| Coding | One sentence of approach, the code, one or two sentences on the key step, one line of complexity. See `references/coding.md`. | code ≤ ~20 lines |
| System design | Spoken outline: the one requirement that drives the design, components, storage choice and why, scaling, failure handling, one trade-off. See `references/system-design.md`. | 8-12 sentences |
| Behavioral ("tell me about a time...") | Situation in one or two sentences, what **I** did, the result, what I'd keep doing. See `references/behavioral.md`. | 5-7 sentences |
| HR / screening (visa, notice, salary, relocation, why leaving) | One or two sentences straight from the profile's standard answers. | 1-2 sentences |

After a technical or behavioral answer you may add one last line, `Follow-up they may ask: <question>`, when the follow-up is predictable and worth preparing. It should probe something the answer did not already cover, since that's what the interviewer will dig into. Leave it out for HR questions and when the user said no follow-ups.

## Voice rules

- First person, the way they'd say it: "I'd use...", "In my current project we...", "What I usually do is...". Contractions are fine.
- Start with the answer. No opener ("Great question", "Sure!", "So basically"), no restating the question, no closing summary.
- Prose, not formatting: no headers, bullets or bold inside an answer. A code block is the one exception.
- One concrete detail from their experience when it fits the question. Don't force a war story into "what is a HashMap"; do use one for "how do you handle failures between services".
- Judgment beats definitions. At mid and senior level the interviewer is testing whether you know when to use something, so a trade-off is worth more than a complete definition.
- One answer, not a menu. Pick what this candidate would do and say why, instead of "you could do A, B or C".
- If the question is ambiguous, answer the common reading. A short assumption up front ("If you mean in a Spring Boot service, ...") is natural in an interview.

## Staying true to the profile

- Employers, clients, projects, tools, dates and years come only from the profile, the resume or the user's own words. Use the profile's stated years of experience as given.
- Never invent numbers ("cut latency by 40%"). Describe the impact in words. If a number would really strengthen a story, put `[your number]` once so the user fills in the real one.
- A skill the resume doesn't show: answer the concept honestly and bridge to the closest real experience. "I haven't used Vue in production, but I've done React for five years and the component model is close..." This survives follow-ups; a bluff doesn't.
- When the profile limits a skill (for example "basic level only, never claim more"), keep every answer at that level.
- When nothing in the profile fits a "tell me about a time" question, build the closest true story from the resume facts, then add exactly one sentence after the answer naming which details to swap for the real ones (for example "Swap in the real cause, fix and how long alerts were delayed."). Keep it to that one sentence plus the one-line stories offer; the user wants the answer, not a disclaimer.

## Setting up interview stories

Behavioral answers are much better from real stories than from resume bullets. When the user asks, or after the first behavioral question if the profile has no `## Interview stories` section (offer once, in one line):

1. From the resume facts, suggest 5-7 candidate stories, each mapped to the questions it can answer: hardest technical problem, production incident, disagreement with a lead or teammate, tight deadline, a mistake and what changed, improving something nobody asked for, mentoring or knowledge transfer, learning something fast.
2. Ask the user for the real details of the ones they pick: what was going on, what they personally did, how it ended, any real numbers. Ask in one message; don't interview them line by line.
3. Write each as three or four lines: **Title** · Situation · What I did · Result · Use for: <question types>. Only their details, nothing invented.
4. Save them as a `## Interview stories` section at the end of the profile's prose (before the JSON block). If a skill-proposal tool is available, propose it as an edit to `job-search-profile`; otherwise give the section to paste in Customize > Skills. Without a profile skill, give it as text to keep and paste into future chats.

## Files

| When | Read |
|---|---|
| Before the first answer in a chat | `references/voice.md` |
| A coding, SQL or front-end code question | `references/coding.md` |
| Behavioral, "tell me about yourself", HR / screening | `references/behavioral.md` |
| System design | `references/system-design.md` |
| Mock, Drill or JD prep | `references/question-bank.md` |
