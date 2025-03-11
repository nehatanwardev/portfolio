#!/bin/bash

# Check if wkhtmltopdf is installed
if command -v wkhtmltopdf &>/dev/null; then
    echo "Converting HTML resume to PDF..."
    wkhtmltopdf assets/resume/resume.html assets/resume/Neha_Tanwar_Resume.pdf
    echo "PDF resume created at assets/resume/Neha_Tanwar_Resume.pdf"
else
    echo "wkhtmltopdf is not installed. Please install it to convert HTML to PDF."
    echo "You can install it using one of the following commands:"
    echo "  - macOS: brew install wkhtmltopdf"
    echo "  - Ubuntu/Debian: sudo apt-get install wkhtmltopdf"
    echo "  - Windows: Download from https://wkhtmltopdf.org/downloads.html"
    echo ""
    echo "Alternatively, you can open the HTML file in a browser and use the browser's print function to save as PDF:"
    echo "1. Open assets/resume/resume.html in your browser"
    echo "2. Press Ctrl+P (or Cmd+P on Mac)"
    echo "3. Select 'Save as PDF' and save to assets/resume/Neha_Tanwar_Resume.pdf"
fi 