# LODE Media Website - Project Guide

## What This Is
Static brochure website for **Lode Media Ltd**, a social media content management agency founded by Logan Deyong. Multi-page HTML/CSS/JS — no frameworks, no build step.

## Live URLs
- **GitHub Pages:** https://dandeyong.github.io/lode-media-website/ (auto-deploys on push to `main`)
- **Netlify preview:** https://lode-media-preview.netlify.app
- **Custom domain (target):** lodemedia.co.uk — `CNAME` file in repo, DNS still needs configuring at registrar
- **To preview locally:** `npx http-server . -p 8080 -c-1` then open http://localhost:8080

## File Structure
```
index.html          — Homepage
about.html          — Founder story + video
services.html       — What Lode does
work.html           — Featured reels showcase
contact.html        — Form (FormSubmit.co)
privacy / terms / cookies.html — Legal pages
css/style.css       — All styles (dark navy theme, responsive)
js/main.js          — Animations, mobile nav, form handling, counters
assets/images/      — Logos + brand logos (real PNGs, not SVG text)
assets/video/       — Page hero MP4s (hero/about/services/work/contact-bg.mp4)
CNAME               — GH Pages custom domain target
```

## Design System
- **Primary colour:** `#0A0F1C` (very dark navy)
- **Accent blue:** `#3B7BF6`
- **Accent teal:** `#00C2FF`
- **Heading font:** Space Grotesk (Google Fonts)
- **Body font:** Inter (Google Fonts)
- **Style:** Clean, modern, editorial/agency feel. Minimal borders, lots of whitespace.

## Page sections
- **Header** — Fixed nav, logo, scroll-to-white-background
- **Hero** — Video-background headline (each page has its own `*-bg.mp4`)
- **About** — Founder story (Golf Content Strategist positioning) + founder video
- **Services** — 6 cards
- **Work** — Featured reels showcase (self-hosted-ready cards, see below)
- **Clients** — Scrolling brand logos (real PNGs for Puma, Sky, LIV, PGA, UPS, H&B, DP World; only SENTE GOLF still SVG text)
- **Contact** — FormSubmit.co form → info@lodemedia.co.uk
- **Footer** — Nav, IG + TikTok + LinkedIn icons (all → @logandeyonggolf / Logan Deyong), legal links

## Work page architecture (important)
The Work page does NOT use Instagram embeds — those are too brittle. Instead, each reel is a `.work-card` containing a self-hosted `<video>` element with a poster frame. **On desktop hover the muted reel autoplays in the card; on click the user is sent to Instagram in a new tab** so they see the real engagement (likes, comments, follows).

Files per reel:
- MP4 at `assets/video/work/<slug>.mp4` — re-encoded h264 540p, audio stripped (`-an`), `+faststart` for instant streaming. Source MP4s pulled with `yt-dlp -f 1` or `-f 3` from the IG permalink, then optimised with ffmpeg
- Poster at `assets/images/work/<slug>.jpg` — extracted with `ffmpeg -ss 00:00:01 -frames:v 1`

To add a new reel: copy an existing `<a class="work-card">` block, swap the `poster=`/`src=` paths, brand logo, title, view count, IG permalink. Hover-autoplay is wired up automatically by `js/main.js` for any `.work-card video`.

## Outstanding tasks (truly remaining)
- [ ] **Domain → live:** add DNS records at IONOS to point `www.lodemedia.co.uk` at GH Pages. Canonical is `www.` (set in `CNAME` file — GH redirects apex to www automatically once configured). Records to add in IONOS DNS panel:

  | Type  | Host name | Value / Target                      |
  |-------|-----------|-------------------------------------|
  | A     | @         | `185.199.108.153`                   |
  | A     | @         | `185.199.109.153`                   |
  | A     | @         | `185.199.110.153`                   |
  | A     | @         | `185.199.111.153`                   |
  | CNAME | www       | `dandeyong.github.io.`              |

  How to do it in IONOS:
  1. Log in → **Domains & SSL** → click `lodemedia.co.uk` → **DNS**
  2. Delete any existing A records on `@` and CNAME on `www` (if pointing elsewhere)
  3. Add the 5 records above (TTL = 1 hour is fine)
  4. Wait 10–60 min for propagation. Check with `dig www.lodemedia.co.uk` — should resolve to one of the GH Pages IPs
  5. In GitHub repo → **Settings** → **Pages** → "Custom domain" should show `www.lodemedia.co.uk` (read from CNAME file). Tick **Enforce HTTPS** once available
- [ ] **Founder photo** on the About page (currently uses founder video; a still might be useful)
- [ ] **Sente Golf logo** PNG (only remaining SVG-text brand)
- [ ] **More reels** — currently 2 (Jon Rahm, Guess The Tracer). Logan can send IG permalinks and we add them via the yt-dlp + ffmpeg pipeline above

## Deploying
Push to `main` deploys automatically to GitHub Pages. Netlify is a redundant preview that also tracks `main`.
```
git add -A
git commit -m "description of what changed"
git push
```

## Contact info on the site
- **Email:** info@lodemedia.co.uk (FormSubmit forwards here)
- **LinkedIn:** https://www.linkedin.com/in/logan-deyong-38a0991ba/
- **Instagram:** @logandeyonggolf (Logan's personal — may want a Lode-specific account)
- **Based:** United Kingdom (no street address shown)
