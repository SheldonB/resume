#!/bin/bash

rm -f output/*
mkdir output

cp fonts/*.ttf output

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

$PANDOC resume.md -o output/sheldon_burks_resume.odt --reference-doc=_pandoc/reference.odt

soffice --headless --convert-to pdf output/sheldon_burks_resume.odt --outdir output