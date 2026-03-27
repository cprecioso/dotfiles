---
name: create-presentation
description: Create a polished, code-forward presentation from scratch. Interviews you about your content, generates a Preact+Vite slide deck with Shiki syntax highlighting, then iterates on visual polish. Use when user wants to create a presentation, build slides, or prepare a talk.
---

You are creating a presentation for the user. Follow these phases in order.

## Phase 1: Intake

Ask the user: **What are you presenting?**

## Phase 2: Content interview

Follow the interview process in [references/grill-me.md](references/grill-me.md). Your job is to help the user find the story in their content - not just what they want to say, but the narrative that makes it land.

## Phase 3: Slide outline

Produce a table of slides:

| # | Title | Content summary |
|---|-------|----------------|

Ask the user to approve, adjust, or reorder before proceeding.

## Phase 4: Scaffold

Run these commands to pull the template and install dependencies:

```bash
npx giget@latest gh:infomiho/present ./<presentation-name>
cd <presentation-name>
npm install
```

Use a short, descriptive directory name based on the topic (e.g., `ts-config-talk`, `q3-roadmap`).

## Phase 5: Generate slides

Edit `src/slides.tsx` to create the presentation content. Key guidelines:

- **Read the existing template files first.** Understand the available components by reading `src/components/index.ts` and the individual component files.
- **Use the component library:** `Slide`, `Code`, `Compare`, `PointList`, `QuestionList`, `ForkGrid`/`ForkCard`, `FileTree`/`Folder`/`File`. See `src/components/` for the full API.
- **Code is Shiki-powered.** Use the `Code` component with the `lang` prop. Languages are loaded on demand. Use `lineNumbers` for line numbers and `highlight="3-5, 8"` for line highlighting (accent border + tint, rest dims).
- **Sub-steps** for progressive reveal: `<Slide subSteps={N}>{(step) => ...}</Slide>`. Components like `PointList` and `QuestionList` accept a `step` prop to control visible items. `ForkCard` accepts `highlighted` and `dimmed` for decision resolution.
- **Custom components** are encouraged. If a slide needs a visualization that doesn't fit the existing components, create it directly in `src/slides.tsx` or as a new component in `src/components/`.
- **Branding** is controlled by CSS variables in `src/styles.css`. The template ships a dark, code-forward theme. Adjust `--accent`, `--accent-rgb`, and related variables to match the user's brand if they ask.
- Keep slide content focused. One idea per slide.
- Use `className="centered"` on `Slide` for title/section slides.
- Use `<div class="slide-label">Label</div>` for the small label at the top of content slides.

## Phase 6: Review loop

Start the dev server:

```bash
npm run dev
```

Then tell the user:

> The presentation is running. Check it in your browser and send me screenshots of anything you want adjusted - layout, spacing, contrast, content, whatever. We'll iterate until you're happy.

For each piece of feedback:
1. Identify the specific file and CSS/component to change
2. Make the fix
3. Confirm what changed

Repeat until the user is satisfied.
