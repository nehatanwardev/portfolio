#!/bin/bash

# Build the Flutter web app
echo "Building Flutter web app..."
flutter build web --release

# Check if Python is available
if command -v python3 &>/dev/null; then
  echo "Serving web app using Python HTTP server..."
  cd build/web && python3 -m http.server 8000
elif command -v python &>/dev/null; then
  echo "Serving web app using Python HTTP server..."
  cd build/web && python -m SimpleHTTPServer 8000
else
  echo "Python not found. Please install Python or use another HTTP server to serve the web app."
  echo "The build files are located in the 'build/web' directory."
  exit 1
fi

echo "Web app is running at http://localhost:8000" 