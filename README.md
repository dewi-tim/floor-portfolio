# Baker's Portfolio Menu

A static, self-contained single-page site designed to showcase a baker's portfolio in the style of an elegant printed menu. This site is designed to be hosted on GitHub Pages.

## Features

- Responsive design that works on mobile and desktop displays
- Elegant menu-style layout with a 4x2 grid (on desktop, 2x4 on mobile)
- Item details displayed in a pop-up modal when selected
- No dependencies - pure HTML, CSS, and vanilla JavaScript

## Structure

- `index.html` - The main HTML file
- `css/styles.css` - All styling for the site
- `js/script.js` - JavaScript for interaction and data loading
- `data.json` - Contains all the menu item data
- `img/` - Directory for images
  - Expected image files: 
    - `pastry1.png` through `pastry8.png` (full size images)
    - `pastry1-thumb.png` through `pastry8-thumb.png` (thumbnail images)

## Hosting on GitHub Pages

1. Create a GitHub repository
2. Upload all files to the repository
3. Go to repository Settings → Pages
4. Set the Source to "main" branch and save

## Customization

To customize the content, edit the `data.json` file. Each item has:

- `id` - Unique identifier
- `title` - Name of the pastry
- `thumbnail` - Path to the thumbnail image (recommended: square watercolor-style images)
- `image` - Path to the full-size image (real photograph)
- `shortDescription` - Brief menu-style description shown in the grid
- `fullDescription` - Detailed description shown in the modal

To customize the styling, edit `css/styles.css`. The design uses a paper-like background color with elegant typography and thin borders.

## Image Requirements

- Thumbnails: Square format, watercolor-styled images of each pastry
- Full images: Photographs of the actual pastries

## License

Open source - free to use and modify