#!/bin/bash
# (C) 2025 Benjamin Steenkamer
# Perform optical character recognition (OCR) on an input image or PDF
# Outputs text to console
DPI=300
tesseract "$1" stdout --dpi $DPI
