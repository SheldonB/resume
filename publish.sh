#!/bin/bash

rm -rf output/*
mkdir -p output

PANDOC=$(which pandoc)

$PANDOC resume.md -o output/resume.html -t html5 \
  -f markdown+smart \
  --standalone \
  --email-obfuscation=references \
  --data-dir=_pandoc \
  --include-in-header=_pandoc/header_styles.html \
  --include-before-body=_pandoc/header.html \
  --include-after-body=_pandoc/footer.html \
  --variable="pagetitle:Resume :: Sheldon Burks"

google-chrome-stable --headless --no-sandbox --disable-gpu --no-pdf-header-footer --print-to-pdf=output/resume.pdf output/resume.html