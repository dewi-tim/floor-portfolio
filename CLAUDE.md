# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A portfolio website for a pastry baker. Static HTML/CSS/JS with no build process or dependencies.

**Live site:** [bakesofthefloor.amsterdam](https://bakesofthefloor.amsterdam)

## Development

No build step required. Open any HTML file directly in a browser or use a local server:

```bash
python3 -m http.server 8000
```

## Architecture

### Page Structure
- `index.html` - Redirects to contact.html
- `contact.html` - Landing page with about info and contact links
- `gallery.html` - Portfolio grid with modal popups (loads from data.json)
- `cv.html` - CV/resume page

### Data
- `data.json` - Gallery items with id, title, descriptions, image paths, and aspectRatio

### Shared Visual Elements
All pages share these inline CSS/JS patterns:
- **Stars background** - Randomly positioned SVG stars with twinkle animation
- **Stripe overlay** - Subtle vertical lines
- **Paper grain** - SVG noise texture overlay
- **Wobbly borders** - Procedurally generated hand-drawn style borders using seeded random
- **Torn paper edges** - Jagged SVG paths for modal backgrounds

### Key CSS Variables
```css
--cream: #FFF8F0;      --pink: #FC2847;       --cyan: #00B7EB;
--yellow: #FCD667;     --green: #00A86B;      --brown: #9C6B30;
```

### Layout Pattern
Pages use a fixed header with scroll container architecture:
```css
body { display: grid; grid-template-rows: auto 1fr; }
.site-header { max-height: 33vh; }
.scroll-container { overflow-y: auto; }
```

## Adding Gallery Items

1. Add images to `images/`:
   - Square thumbnail: `images/item-square.png`
   - Full image: `images/item.jpeg`

2. Get aspect ratio: `identify -format "%w/%h\n" images/item.jpeg | bc -l`

3. Add entry to `data.json`:
```json
{
  "id": 9,
  "title": "Item Name",
  "shortDescription": "Brief tagline",
  "fullDescription": "Full description.\n\nUse \\n for paragraphs.",
  "thumbnail": "images/item-square.png",
  "image": "images/item.jpeg",
  "aspectRatio": 0.75
}
```

## Hosting

Designed for GitHub Pages. Push to main branch with Pages enabled.
