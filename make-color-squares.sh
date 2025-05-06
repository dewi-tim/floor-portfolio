#!/bin/bash

# Create square versions of all pastry thumbs
# This script crops images to 1:1 ratio while keeping the bounding box intact
# It uses the largest dimension and centers the content
# Ensures color is maintained throughout the process

cd "$(dirname "$0")"
mkdir -p img/square

for i in {1..8}; do
    input_img="img/cropped/pastry${i}-thumb-padded.png"
    output_img="img/square/pastry${i}-square.png"
    
    # Get image dimensions
    dimensions=$(identify -format "%w %h" "$input_img")
    width=$(echo $dimensions | cut -d' ' -f1)
    height=$(echo $dimensions | cut -d' ' -f2)
    
    # Calculate the size for the square (use the larger dimension)
    if (( width > height )); then
        size=$width
        # Use extent to create a square image with the original centered
        convert "$input_img" -background transparent -gravity center -extent "${size}x${size}" "$output_img"
    else
        size=$height
        # Use extent to create a square image with the original centered
        convert "$input_img" -background transparent -gravity center -extent "${size}x${size}" "$output_img"
    fi
    
    echo "Created square image: $output_img"
done

echo "All images have been converted to square format."