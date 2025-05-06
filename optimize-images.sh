#!/bin/bash
# Script to optimize images for web performance with different strategies

# Create optimized directories if they don't exist
mkdir -p img/optimized/jpg
mkdir -p img/optimized/png

# ========= Main pastry images =========
echo "===== Processing main pastry images ====="
# For main images (pastry1.png through pastry8.png) - subtle downsample to JPG
for img in img/pastry[1-8].png; do
  filename=$(basename "$img")
  echo "Creating JPG version of $filename..."
  # Simple conversion for photographs - maintain aspect ratio
  convert "$img" -strip -resize "800x800>" -quality 90 "img/optimized/jpg/${filename%.png}.jpg"
done

# ========= Square thumbnail images =========
echo "===== Processing square thumbnails ====="
# For square thumbnails - we'll use optimized PNG to maintain transparency
for img in img/square/pastry*-square.png; do
  filename=$(basename "$img")
  echo "Optimizing square thumbnail $filename..."
  # Smaller downsample with high PNG compression - maintain aspect ratio
  convert "$img" -strip -resize "250x250>" -quality 90 -define png:compression-level=9 "img/optimized/png/$filename"
done

echo "Optimization complete!"