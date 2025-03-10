import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/theme_controller.dart';
import 'package:portfolio/utils/app_theme.dart';
import 'package:portfolio/views/home_view.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize controllers
  final themeController = Get.put(ThemeController());

  // Load theme before running app
  await themeController.loadThemeMode();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900), // Design size for desktop
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Neha Tanwar - Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Get.find<ThemeController>().themeMode,
          builder: (context, child) {
            // Initialize ScreenUtil
            ScreenUtil.init(context);

            // Apply responsive breakpoints
            return ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
          home: const HomeView(),
          getPages: [
            GetPage(name: '/', page: () => const HomeView()),
            // Add more routes as needed
          ],
        );
      },
    );
  }
}
