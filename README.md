# Neha Tanwar - Portfolio

A modern, responsive portfolio website built with Flutter for both web and mobile platforms.

## Features

- **Responsive Design**: Adapts seamlessly to different screen sizes (mobile, tablet, desktop)
- **Dark/Light Mode**: Toggle between dark and light themes with persistent settings
- **Animated UI**: Smooth animations and transitions for an engaging user experience
- **Cross-Platform**: Works on web, iOS, and Android
- **GetX State Management**: Efficient state management using GetX
- **Google Fonts Integration**: Using Poppins font family from Google Fonts
- **ScreenUtil Integration**: Consistent UI sizing across different screen sizes
- **Section Navigation**: Smooth scrolling to sections when clicking on navigation items

## Sections

- **Header**: Introduction and quick overview
- **About**: Personal information and professional profile
- **Experience**: Work history and professional experience
- **Projects**: Showcase of notable projects with descriptions and technologies used
- **Skills**: Technical skills categorized by domain
- **Education**: Educational background and qualifications
- **Contact**: Contact form and information

## Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **GetX**: State management, navigation, and dependency injection
- **Responsive Framework**: For responsive design
- **Flutter ScreenUtil**: For consistent UI sizing across different devices
- **Flutter Animate**: For animations
- **URL Launcher**: For handling external links
- **Font Awesome Flutter**: For icons
- **Google Fonts**: For typography
- **Timeline Tile**: For experience timeline
- **Flutter Staggered Grid View**: For project layout

## Getting Started

1. **Clone the repository**:
   ```
   git clone https://github.com/nehatanwar/portfolio.git
   ```

2. **Install dependencies**:
   ```
   flutter pub get
   ```

3. **Run the app**:
   ```
   flutter run -d chrome  # For web
   flutter run            # For mobile
   ```

## Customization

The portfolio is designed to be easily customizable:

- Update personal information in `lib/constants/app_constants.dart`
- Modify themes in `lib/utils/app_theme.dart`
- Add or remove sections by editing `lib/views/home_view.dart`

## Deployment

### Web
```
flutter build web
```
Deploy the generated files in the `build/web` directory to any web hosting service.

### Mobile
```
flutter build apk      # For Android
flutter build ios      # For iOS
```

## License

This project is open-source and available under the MIT License.

## Contact

Neha Tanwar - nehatanwar197@gmail.com

---

Created with ❤️ using Flutter
