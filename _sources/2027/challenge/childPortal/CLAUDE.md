# Child Portal — Penguins FLL 2027

Home page for the kids (age ~10, Hebrew speakers) of team **הפינגוינים** (Herzog, grade 4),
FLL Challenge 2027. Kids save it as a bookmark / home-screen icon on laptops and phones.

- Live URL: https://robfll.github.io/2027/challenge/childPortal/
- Repo: `robFLL/robfll.github.io` (GitHub Pages, served from `main`, no build step)

## Files
- `readme.md` — the list of links as written by the coach (source of truth for content).
- `index.html` — the rendered portal. Single self-contained file (inline CSS/JS/SVG, only external
  resource is the Google Font "Rubik").
- `CLAUDE.md` — this file.

## How to update links (the common task)
1. Update `readme.md` with the new/changed link (keep its sections: משחק הרובוט / פרויקט החדשנות / ערכי ליבה).
2. In `index.html`, edit **only** the `SECTIONS` array at the top of the `<script>` block
   (marked `PORTAL CONTENT`). Each link is:
   ```js
   { title: "שם בעברית", url: "https://...", emoji: "🎯", type: "video" }
   ```
   `type` is one of `video | pdf | tool | learn | page | image` (controls the small tag on the card;
   labels live in `TYPE_LABELS`). Pick a fitting emoji.
3. A new section = new object in `SECTIONS` with `id`, `title`, `desc`, `icon`, `color`, `links`.
   Add a matching color variable in `:root` (CSS) if you want a new accent.
4. Keep `readme.md` and `SECTIONS` in sync — same links, same order.
5. Commit and push to `main`; GitHub Pages redeploys automatically.

## Design rules (keep these)
- **Everything visible is in Hebrew** (titles, tags, nav, footer, meta description) — no English labels
  (e.g. PDF → "מסמך", FLL Challenge → "פירסט לגו ליג צ׳אלנג׳"). `dir="rtl"`. Simple words — readers are 10.
- Theme: robotics + penguins (robot-penguin SVG mascot, ice/sea colors, snowflakes).
  Section accents: robot = orange, project = green, core values = purple.
- Mobile-first: cards collapse to one column under 520px; big tap targets; sticky jump nav.
- All links open in a new tab (`target="_blank" rel="noopener"`).
- No build tools, no frameworks, no extra dependencies — it must stay one file editable by hand.
- Respect `prefers-reduced-motion` (animations off).

## Preview locally
```bash
cd 2027/challenge/childPortal && python3 -m http.server 8000
# open http://localhost:8000
```
