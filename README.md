# Portfolio Website

A responsive portfolio website built with Flutter Web.

## Live Demo

Visit the live website: [https://nehatanwardev.github.io/portfolio/](https://nehatanwardev.github.io/portfolio/)

## Features

- Responsive design that works on mobile, tablet, and desktop
- Dark/Light mode support
- Animated UI elements
- Project showcase
- Skills and experience sections
- Contact information

## CI/CD and Deployment

This project uses GitHub Actions for CI/CD to automatically build and deploy the website to GitHub Pages.

### Setting up GitHub Pages

1. Go to your GitHub repository
2. Navigate to Settings > Pages
3. Under "Source", select "GitHub Actions"
4. The website will be deployed automatically when you push to the main branch

### Manual Deployment

If you want to deploy manually:

```bash
# Install dependencies
flutter pub get

# Build web release
flutter build web --release

# The output will be in the build/web directory
```

## Development

### Prerequisites

- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.0.0 or higher)

### Running Locally

```bash
# Clone the repository
git clone https://github.com/nehatanwardev/portfolio.git

# Navigate to the project
cd portfolio

# Install dependencies
flutter pub get

# Run in debug mode
flutter run -d chrome
```

## Customization

Edit the `lib/constants/app_constants.dart` file to update your personal information, projects, skills, and experience.

## License

MIT
