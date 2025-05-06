#!/bin/bash

# Create square versions of all pastry thumbs
# This script crops images to 1:1 ratio while keeping the bounding box intact
# It uses the largest dimension and centers the content

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
        # Center the image vertically
        offset_x=0
        offset_y=$(( (width - height) / 2 ))
    else
        size=$height
        # Center the image horizontally
        offset_x=$(( (height - width) / 2 ))
        offset_y=0
    fi
    
    # Create a square canvas with transparent background
    convert -size "${size}x${size}" xc:none "$output_img"
    
    # Composite the original image onto the square canvas
    convert "$output_img" "$input_img" -geometry "+${offset_x}+${offset_y}" -composite "$output_img"
    
    echo "Created square image: $output_img"
done

echo "All images have been converted to square format."