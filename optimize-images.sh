#!/bin/bash
# Script to optimize images for web performance

# Create optimized directories if they don't exist
mkdir -p img/optimized/png
mkdir -p img/optimized/jpg

# Optimize main images (PNG)
for img in img/pastry*.png; do
  filename=$(basename "$img")
  echo "Optimizing PNG: $filename..."
  convert "$img" -strip -resize 800x800\> -quality 85 "img/optimized/png/$filename"
  
  # Create JPG version (without .png extension)
  jpgname="${filename%.png}.jpg"
  echo "Creating JPG: $jpgname..."
  convert "$img" -strip -resize 800x800\> -quality 85 -background white -flatten "img/optimized/jpg/$jpgname"
done

# Optimize thumbnails (PNG)
for img in img/square/pastry*-square.png; do
  filename=$(basename "$img")
  echo "Optimizing thumbnail PNG: $filename..."
  convert "$img" -strip -resize 300x300\> -quality 85 "img/optimized/png/$filename"
  
  # Create JPG version (without .png extension)
  jpgname="${filename%.png}.jpg"
  echo "Creating thumbnail JPG: $jpgname..."
  convert "$img" -strip -resize 300x300\> -quality 85 -background white -flatten "img/optimized/jpg/$jpgname"
done

echo "Optimization complete!"