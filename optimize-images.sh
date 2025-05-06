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
  # Subtle downsample to JPG - maintain good quality (90)
  convert "$img" -strip -resize 800x800\> -quality 90 -background white -flatten "img/optimized/jpg/${filename%.png}.jpg"
done

# ========= Square thumbnail images =========
echo "===== Processing square thumbnails ====="
# For square thumbnails - we'll use high compression PNG to maintain transparency
for img in img/square/pastry*-square.png; do
  filename=$(basename "$img")
  echo "Optimizing square thumbnail $filename..."
  # Smaller downsample with high PNG compression (9)
  convert "$img" -strip -resize 250x250\> -quality 90 -define png:compression-level=9 "img/optimized/png/$filename"
done

# ========= Other images remain unchanged =========
echo "Optimization complete!"