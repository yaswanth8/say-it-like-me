# Setup: "Set up my interview profile"

Goal: a saved profile good enough that every later answer sounds like this person, after one round of questions. Takes a couple of minutes for the user.

If an Interview Profile dashboard already exists (profile-store.md, "Find it"), update that one instead of creating a second: show what would change and save after the user confirms.

## 1. Get the facts

In this order, using the first that exists:
1. A resume attached in this chat (PDF, Word or pasted text). Read all of it.
2. The `job-search-profile` skill, if installed (it already holds resume facts, years, targets and screening answers). Import from it and tell the user in one line.
3. Neither: ask for the resume and stop until it arrives. ("Attach your resume, or paste it, and I'll set this up.")

From it, draft: name, current title, location, total years, roles (company, client if any, title, dates, 2-5 highlights in the resume's own terms), skills with years worked out from role dates, education, certifications, domains.

## 2. Ask the basic questions, once

One message, numbered, with what the resume suggests already filled in, so the user only corrects or confirms. Keep it to these:

1. **Target roles and level.** "From your resume: Senior Python Developer / Backend Engineer. Right?"
2. **Years per main skill.** Show the 5-8 main skills with the years the resume dates support. "Change any number you put on applications; I'll use yours."
3. **Anything to keep modest?** Skills on the resume you've only used lightly, so answers don't oversell them.
4. **Screening answers.** Work authorization (and sponsorship if relevant), notice period or earliest start, where you'll work (remote, hybrid, on-site, relocation), salary expectation (optional; "skip" is fine).
5. **Answer style.** Short (30-60 seconds, the default), standard (about 90 seconds) or detailed; follow-up line after answers on or off; which language for coding questions.

Where a question-picker tool is available, it may carry the multiple-choice parts (5, and yes/no confirmations); the free-text parts stay in the message. Never ask the same thing twice: whatever the resume or the job-search-profile already answers is shown for confirmation, not asked open-ended.

"Use the defaults" or "looks good" means: keep the drafts, short answers, follow-ups on, main language for code, and leave unanswered screening items as "Not set".

## 3. Save and show

1. Create the dashboard and write the profile (`references/profile-store.md`, "Create it").
2. Reply with: one line saying it's saved with the link, a 3-4 line summary (role, years, top skills, anything left "Not set"), and one offer: "Want to set up 4-6 interview stories next? It makes behavioral answers much better."

## Stories ("Set up my interview stories")

1. From the roles and highlights, suggest 5-7 stories, each mapped to the questions it can answer: hardest technical problem, production incident or crisis, disagreement with a lead or teammate, tight deadline, a mistake and what changed, improving something nobody asked for, mentoring or knowledge transfer, learning something fast.
2. Ask for the real details of the ones the user picks in one message: what was going on, what they personally did, how it ended, any real numbers.
3. Write each as `{title, situation, action, result, useFor}` using only their details, and save each to `stories/<id>`. Show the titles in a short list with the dashboard link.

## Updates later

"Update my interview profile: notice period is 30 days", "add Terraform, 2 years", "I got the AWS certification": change only those fields (profile-store.md, "Update a field") and confirm in one line. A new resume: redo step 1, show what changed in a few lines, and save after the user confirms.
