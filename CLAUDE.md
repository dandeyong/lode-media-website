# LODE Media Website - Project Guide

## What This Is
Static brochure website for **Lode Media Ltd**, a social media content management agency founded by Logan Deyong. The site is a single-page HTML/CSS/JS site — no frameworks, no build step.

## Live Preview
- **Live URL:** https://lode-media-preview.netlify.app
- **To preview locally:** run `npx http-server . -p 8080 -c-1` from this folder, then open http://localhost:8080

## File Structure
```
index.html          — The entire website (single page, all sections)
css/style.css       — All styles (dark navy theme, responsive)
js/main.js          — Animations, mobile nav, form handling, counters
assets/images/      — Logo files
```

## Design System
- **Primary colour:** `#0A0F1C` (very dark navy)
- **Accent blue:** `#3B7BF6`
- **Accent teal:** `#00C2FF`
- **Heading font:** Space Grotesk (Google Fonts)
- **Body font:** Inter (Google Fonts)
- **Style:** Clean, modern, editorial/agency feel. Minimal borders, lots of whitespace.

## Sections (in order)
1. **Header** — Fixed nav with logo, scrolls to white background
2. **Hero** — Centered headline with animated gradient blobs background
3. **About** — Company intro with stats (20M+ reach, 50+ brands, etc.)
4. **Services** — 6 cards in a seamless grid with 1px dividers
5. **Work** — 3 video placeholder cards (need real content from Logan)
6. **Clients** — Scrolling brand logos (currently SVG text approximations)
7. **Packages** — 3 pricing tiers (Starter £500, Growth £1,500, Enterprise £3,000+)
8. **Contact** — Form (Formspree) + email/phone/LinkedIn info
9. **Footer** — Links, social icons, copyright

## Outstanding Tasks (things that still need doing)
- [ ] Replace `YOUR_FORM_ID` in the contact form action URL with an actual Formspree form ID (sign up free at formspree.io)
- [ ] Replace the 3 work/portfolio video placeholders with real social media video links and thumbnails
- [ ] Replace SVG text brand logos with actual brand logo files (PNG or SVG from press kits)
- [ ] Add a real team/founder photo to the about section
- [ ] Update Instagram and TikTok URLs in the footer with real profile links
- [ ] Connect lodemedia.co.uk domain to Netlify

## How to Deploy Changes
After making changes, deploy to the live preview with:
```
npx netlify-cli deploy --dir=. --prod --no-build --site lode-media-preview
```

Or just push to GitHub and ask Dan to deploy:
```
git add -A
git commit -m "description of what changed"
git push
```

## Contact Info Used on Site
- **Email:** info@lodemedia.co.uk
- **Phone:** +44 7XXX XXXXXX (placeholder)
- **LinkedIn:** https://www.linkedin.com/in/logan-deyong-38a0991ba/
- **Address:** Manchester, UK
