# Bakes of the Floor

A playful, hand-drawn style portfolio site for a pastry baker. Features a gallery with modal popups, contact page, and CV.

## Live Site

[bakesofthefloor.amsterdam](https://bakesofthefloor.amsterdam)

## Structure

```
├── index.html        # Redirects to contact.html
├── contact.html      # Landing page with about info and contact links
├── gallery.html      # Portfolio gallery with modal popups
├── cv.html           # CV/resume page
├── data.json         # Gallery item data (see below)
├── logo_with_text.png
├── images/           # Gallery images
│   ├── floor-square.jpeg
│   ├── pastry1.jpeg, pastry1-square.png
│   └── ...
└── favicon/          # Favicon files
```

## Configuring Gallery Items

All gallery content is configured in `data.json`. Each item in the `items` array represents one portfolio piece:

```json
{
  "items": [
    {
      "id": 1,
      "title": "Item Title",
      "shortDescription": "Brief tagline shown in grid (optional, currently hidden)",
      "fullDescription": "Full description shown in modal popup.\n\nUse \\n for line breaks between paragraphs.",
      "thumbnail": "images/item-square.png",
      "image": "images/item.jpeg",
      "aspectRatio": 0.75
    }
  ]
}
```

### Field Reference

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique numeric identifier |
| `title` | Yes | Display name shown in grid and modal |
| `shortDescription` | No | Brief description (currently hidden in grid view) |
| `fullDescription` | Yes | Full text shown in modal. Use `\n` for line breaks |
| `thumbnail` | Yes | Path to square thumbnail image for grid |
| `image` | Yes | Path to full image shown in modal |
| `aspectRatio` | Yes | Width divided by height (e.g., 0.75 for 3:4 portrait). Used to pre-size modal before image loads |

### Image Requirements

**Thumbnails** (`thumbnail` field):
- Square format (1:1 aspect ratio)
- Recommended: PNG with transparent or styled background
- Used in the gallery grid

**Full Images** (`image` field):
- Any aspect ratio (specify in `aspectRatio` field)
- Recommended: JPEG for photographs
- Shown in modal popup

### Calculating Aspect Ratio

```
aspectRatio = image width / image height
```

Examples:
- Portrait 3:4 → `0.75`
- Square 1:1 → `1.0`
- Landscape 4:3 → `1.33`
- Landscape 16:9 → `1.78`

### Adding a New Item

1. Add images to the `images/` folder:
   - Square thumbnail: `images/newitem-square.png`
   - Full image: `images/newitem.jpeg`

2. Get the aspect ratio of your full image:
   ```bash
   # Using ImageMagick
   identify -format "%w/%h\n" images/newitem.jpeg | bc -l
   ```

3. Add entry to `data.json`:
   ```json
   {
     "id": 9,
     "title": "New Creation",
     "shortDescription": "Brief tagline",
     "fullDescription": "Detailed description of this piece.\n\nSecond paragraph here.",
     "thumbnail": "images/newitem-square.png",
     "image": "images/newitem.jpeg",
     "aspectRatio": 0.75
   }
   ```

4. Items display in the order they appear in the array

## Customizing Contact Info

Edit `contact.html` directly to update:
- About text
- Email address
- Instagram handle
- Order form link

Edit `cv.html` to update CV content.

## Hosting

Designed for GitHub Pages:

1. Push to GitHub repository
2. Settings → Pages → Source: main branch
3. Optionally configure custom domain via `CNAME` file

## Tech Stack

- Pure HTML, CSS, vanilla JavaScript
- No build step or dependencies
- Self-contained (all styles inline)
- CSS Grid layout with scroll container architecture

## License

Code is open source. Images and content are not licensed for reuse.
