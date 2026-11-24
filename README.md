# say-it-like-me

A Claude skill that answers interview questions the way **you** would say them: first person, 30-60 seconds out loud, and built from your own resume, not textbook definitions.

Paste a question an interviewer asked (or might ask) and you get back the answer to practise saying. It also runs mock interviews, drills a topic, and preps you from a job description.

> **Q:** How do you handle a downstream service that's slow or down?
>
> The first thing I set is a timeout, because without one a slow dependency ties up our threads and takes us down with it. Then I put a Resilience4j circuit breaker around the call, with a small retry and backoff, but only when the call is idempotent. On our notifications service, when the SMS provider got slow we dropped the message on a Kafka topic to retry later, so the customer's request still went through. And I alert on the breaker opening, so we hear about it before customers do.
>
> Follow-up they may ask: How do you make the retried call idempotent?

Nothing personal lives in this repo. Your background comes from your own `job-search-profile` skill or a resume you attach in the chat.

## What it covers

| Kind of question | What you get |
|---|---|
| Java, Spring Boot, microservices, Kafka, Redis, SQL, AWS, Docker/Kubernetes, React, Angular | 3-5 spoken sentences: the answer, how you use it, one trade-off |
| Coding (DSA, SQL, Spring, React) | One line of approach, clean Java 17+ (about 20 lines), the key step, time and space complexity |
| System design | An 8-12 sentence spoken walk-through using your stack |
| Behavioral ("tell me about a time...") | A 60-second story from your real experience, no STAR labels |
| HR and screening (visa, notice period, relocation, salary) | One or two sentences from your profile's standard answers |

It never invents employers, projects or numbers. When a question is about something your resume doesn't show, it answers honestly and bridges to your closest real experience, because that is what survives the interviewer's follow-up.

## Install

1. Download [`dist/interview-answers.zip`](dist/interview-answers.zip).
2. In Claude, open **Customize > Skills** and upload the zip as it is.
3. Give it your background, one of these:
   - **Best:** the `job-search-profile` skill from [job-search-skills](https://github.com/yaswanth8/job-search-skills), filled in from your resume. This skill reads it automatically.
   - Or attach your resume at the start of a chat.
4. Optional but worth it: say **"Set up my interview stories."** Claude suggests stories from your resume, asks you for the real details, and saves them so behavioral answers sound like you.

Works on any Claude plan that has skills. Code execution is only used for the update check.

## Prompts

| Say | What happens |
|---|---|
| *"How do I answer: what's the difference between @Transactional REQUIRED and REQUIRES_NEW?"* or just paste the question | The spoken answer (default mode) |
| Paste several questions, or a screenshot of them | Each one numbered and answered |
| *"Interview me for a senior Java role"* | Mock interview: one question at a time, feedback on your answer, then "Say it like this:" with the polished version |
| *"Give me 10 Kafka questions with answers"* | Drill: question and answer pairs, most likely first |
| Paste a job description | The 8-10 questions it most likely leads to, with answers, and the biggest gap to prepare |
| *"Set up my interview stories"* | Builds your story list for behavioral questions |

Change the style any time in the chat: *"longer answers"*, *"no follow-ups"*, *"use bullets this time"*.

## Getting updates

You don't have to do anything. The first time the skill runs in a chat it checks this repo's version (a few bytes). When there's a newer one, that chat uses it and tells you once:

> UPDATE: your installed interview-answers skill is 1.0.0 and the latest is 1.1.0; this chat uses 1.1.0. ...

To stop the download in every chat, download [`dist/interview-answers.zip`](dist/interview-answers.zip) again and upload it in Customize > Skills, replacing the old one. If GitHub can't be reached, your installed copy is used. To allow updates, keep `github.com`, `raw.githubusercontent.com` and `codeload.github.com` allowed in Claude's code-execution network settings.

## Making a change (maintainer)

1. Edit files under `skills/interview-answers/` (add questions to `references/question-bank.md`, tune `references/voice.md`, and so on).
2. Bump `skills/interview-answers/VERSION` and the `Version:` line in its SKILL.md to the same value (1.0.0 → 1.0.1 for small fixes, 1.1.0 for new features).
3. Add a `## interview-answers <version>` entry at the top of `CHANGELOG.md`.
4. Run `python3 tools/build.py`. It checks the versions match and rebuilds `dist/interview-answers.zip`.
5. Commit and push to `main`. Friends get it in their next chat.

## Layout

```
skills/interview-answers/
  SKILL.md            the instructions: modes, answer shapes, voice and honesty rules
  VERSION             compared with the installed copy by update.sh
  update.sh           once per chat: uses the newest version from this repo
  references/
    voice.md          good vs bad answers; the style to match
    coding.md         coding answer template and Java / SQL / React / Angular style
    behavioral.md     stories, "tell me about yourself", HR and screening answers
    system-design.md  spoken design walk-through and frequent prompts
    question-bank.md  questions by topic for mocks and drills
  evals/evals.json    test prompts (not shipped in the zip)
dist/interview-answers.zip   what friends install
tools/build.py               checks + zip build
```
