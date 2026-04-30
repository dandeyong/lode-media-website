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
- **Footer** — Nav, IG + LinkedIn icons, legal links

## Work page architecture (important)
The Work page does NOT use Instagram embeds — those are too brittle. Instead, each reel is a `.work-card` that LOOKS like a video preview (9:16 aspect, gradient backdrop, brand logo, view count, play icon) and clicks out to Instagram in a new tab. **Outbound IG links never break; embeds do.**

When Logan supplies real MP4s + posters:
1. Drop the MP4 at `assets/video/work/<slug>.mp4` and poster at `assets/images/work/<slug>.jpg`
2. Replace the `.work-card-bg` div with `<img src="assets/images/work/<slug>.jpg" class="work-card-poster">` and add a `<video>` element + lightbox open behaviour
3. The card structure is already designed around this swap

## Outstanding tasks (truly remaining)
- [ ] **Domain:** point `lodemedia.co.uk` DNS at GH Pages (registrar TBC). `CNAME` file already in repo. Records needed:
  - Apex `A` records → `185.199.108.153 / .109.153 / .110.153 / .111.153`
  - `www` `CNAME` → `dandeyong.github.io`
  - Then enable HTTPS in GH Pages settings
- [ ] **Real reel MP4s + posters** for the Work page (Logan to supply)
- [ ] **Founder photo** on the About page (currently uses founder video; a still might be useful)
- [ ] **TikTok footer link** — confirm with Logan whether Lode has a TikTok account
- [ ] **Sente Golf logo** PNG (only remaining SVG-text brand)

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
