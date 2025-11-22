#!/bin/bash
# (C) 2025 Benjamin Steenkamer
# Preform optical character recognition (OCR) on an input image or PDF
# Outputs text to console

DPI=300
tesseract --dpi=$DPI "$1" stdout
