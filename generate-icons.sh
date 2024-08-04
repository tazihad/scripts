#!/bin/bash

# Check if the input image file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input-image-file>"
  exit 1
fi

INPUT_IMAGE=$1
OUTPUT_DIR="icons"
DIMENSIONS=(16 32 48 64 128 256 512)

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Convert image to PNG in exact specified dimensions
for DIM in "${DIMENSIONS[@]}"; do
  OUTPUT_PNG="$OUTPUT_DIR/${DIM}x${DIM}.png"
  magick convert "$INPUT_IMAGE" -resize "${DIM}x${DIM}"^ -gravity center -extent "${DIM}x${DIM}" "$OUTPUT_PNG"
  echo "Created $OUTPUT_PNG"
done

echo "All icons created in $OUTPUT_DIR"
