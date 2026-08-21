# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Static replacement for the old WordPress site `www.palenicabrestov.sk` (Pálenica Brestov — a fruit-distillery in Brestov, SK). Pure hand-written HTML + one CSS file + inline vanilla JS. No build step, no framework, no dependencies, no backend. Deployed on GitHub Pages via the `CNAME` file. All user-facing content is in Slovak and was taken 1:1 from the original WordPress site — do not rewrite copy unless asked.

## Commands

```bash
# Serve locally (no build step exists)
python3 -m http.server 8000     # then open http://localhost:8000

# Download the real images from the live WP site into assets/img/
# Must run on a machine with network access to palenicabrestov.sk (not the sandbox)
chmod +x download-images.sh && ./download-images.sh
```

There is no lint, test, or build tooling. Verifying a change means opening the affected page in a browser.

## Architecture

- **Five standalone pages** — `index.html`, `sluzby.html`, `cennik.html`, `fotogaleria.html`, `kontakt.html`. There is no templating or includes: the `<header class="site">` nav block and `<footer class="site">` block are **duplicated verbatim in every page**. When changing nav links, the brand, or the footer, edit all five files and keep them identical. The current page is marked with `aria-current="page"` on its own nav link.

- **`css/style.css`** is the single source of styling for every page, organized into commented sections (design tokens → header/nav → hero → sections → gallery → lightbox → contact → footer). The top-of-file comment documents the palette intent: amber/copper distillate tones on a dark plum background, driven by CSS custom properties in `:root` (`--plum-*`, `--copper`, `--amber*`, `--parchment`). Use these tokens rather than hardcoding colors. Fonts (Fraunces / Work Sans / IBM Plex Mono) load from Google Fonts via `@import`.

- **Gallery + lightbox** — `fotogaleria.html` holds the full 18-image grid; its inline `<script>` at the bottom builds a lightbox (prev/next, arrow keys, Esc, swipe, counter) by reading every `.gallery-grid a`. Each grid item is `<a href="…-full.jpg"><img src="…thumbnail.jpg"></a>`; the anchor `href` is the large image the lightbox shows, so the anchor-with-full-image-href pattern must be preserved and it degrades gracefully to a plain link if JS fails. `index.html` has a smaller teaser grid whose links point to `fotogaleria.html` (not to images) — that one is intentionally not a lightbox.

- **Images** — live under `assets/img/` and `assets/img/gallery/`. Filenames are a fixed contract with `download-images.sh`, which maps live WP upload URLs to local names (`gXX-<id>.jpg` thumbnail + `gXX-<id>-full.jpg` full size). If you add or rename gallery images, update both the HTML and `download-images.sh` so the two stay in sync.

## Deployment notes

Hosted on GitHub Pages from `main` at repo root; custom domain is set by the `CNAME` file. DNS lives at Websupport (CNAME for `www`, ANAME for the apex). Full deployment and domain-migration steps are documented in `README.md`.
