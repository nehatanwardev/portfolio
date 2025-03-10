import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/controllers/theme_controller.dart';
import 'package:portfolio/controllers/scroll_controller.dart';
import 'package:portfolio/widgets/about_section.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/education_section.dart';
import 'package:portfolio/widgets/experience_section.dart';
import 'package:portfolio/widgets/header_section.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skills_section.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    final themeController = Get.find<ThemeController>();
    final scrollController = Get.put(AppScrollController());

    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            AppConstants.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isDesktop ? 10.sp : 16.sp,
            ),
          ),
        ),
        actions: [
          if (isDesktop) _buildNavMenu(context, scrollController),
          Obx(() => IconButton(
                icon: Icon(
                  themeController.themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  size: isDesktop ? 12.sp : 24.sp,
                ),
                onPressed: () => themeController.toggleTheme(),
              )),
          SizedBox(width: 16.w),
        ],
      ),
      drawer: isDesktop ? null : _buildDrawer(context, scrollController),
      body: _buildBody(context, isDesktop, scrollController),
    );
  }

  Widget _buildNavMenu(
      BuildContext context, AppScrollController scrollController) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNavItem(context, 'About', 0, scrollController, isDesktop),
        _buildNavItem(context, 'Experience', 1, scrollController, isDesktop),
        _buildNavItem(context, 'Projects', 2, scrollController, isDesktop),
        _buildNavItem(context, 'Skills', 3, scrollController, isDesktop),
        _buildNavItem(context, 'Education', 4, scrollController, isDesktop),
        _buildNavItem(context, 'Contact', 5, scrollController, isDesktop),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title, int index,
      AppScrollController scrollController, bool isDesktop) {
    return TextButton(
      onPressed: () => scrollController.scrollToSection(index),
      child: Text(
        title,
        style: TextStyle(fontSize: isDesktop ? 6.sp : 12.sp),
      ),
    );
  }

  Widget _buildDrawer(
      BuildContext context, AppScrollController scrollController) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.white,
                  child: Text(
                    'NT',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppConstants.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppConstants.title,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, 'About', Icons.person, 0, scrollController),
          _buildDrawerItem(
              context, 'Experience', Icons.work, 1, scrollController),
          _buildDrawerItem(
              context, 'Projects', Icons.code, 2, scrollController),
          _buildDrawerItem(context, 'Skills', Icons.star, 3, scrollController),
          _buildDrawerItem(
              context, 'Education', Icons.school, 4, scrollController),
          _buildDrawerItem(
              context, 'Contact', Icons.contact_mail, 5, scrollController),
          const Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.linkedin, size: 20.sp),
            title: Text('LinkedIn', style: TextStyle(fontSize: 14.sp)),
            onTap: () {
              // Open LinkedIn
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.github, size: 20.sp),
            title: Text('GitHub', style: TextStyle(fontSize: 14.sp)),
            onTap: () {
              // Open GitHub
            },
          ),
          ListTile(
            leading: Icon(Icons.email, size: 20.sp),
            title: Text('Email', style: TextStyle(fontSize: 14.sp)),
            onTap: () {
              // Send email
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon,
      int index, AppScrollController scrollController) {
    return ListTile(
      leading: Icon(icon, size: 20.sp),
      title: Text(title, style: TextStyle(fontSize: 14.sp)),
      onTap: () {
        Navigator.pop(context);
        scrollController.scrollToSection(index);
      },
    );
  }

  Widget _buildBody(BuildContext context, bool isDesktop,
      AppScrollController scrollController) {
    return isDesktop
        ? _buildDesktopLayout(context, scrollController)
        : _buildMobileLayout(context, scrollController);
  }

  Widget _buildDesktopLayout(
      BuildContext context, AppScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController.scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(key: scrollController.sectionKeys['header']),
            SizedBox(height: 64.h),
            AboutSection(key: scrollController.sectionKeys['about']),
            SizedBox(height: 64.h),
            ExperienceSection(key: scrollController.sectionKeys['experience']),
            SizedBox(height: 64.h),
            ProjectsSection(key: scrollController.sectionKeys['projects']),
            SizedBox(height: 64.h),
            SkillsSection(key: scrollController.sectionKeys['skills']),
            SizedBox(height: 64.h),
            EducationSection(key: scrollController.sectionKeys['education']),
            SizedBox(height: 64.h),
            ContactSection(key: scrollController.sectionKeys['contact']),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
      BuildContext context, AppScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController.scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(key: scrollController.sectionKeys['header']),
            SizedBox(height: 48.h),
            AboutSection(key: scrollController.sectionKeys['about']),
            SizedBox(height: 48.h),
            ExperienceSection(key: scrollController.sectionKeys['experience']),
            SizedBox(height: 48.h),
            ProjectsSection(key: scrollController.sectionKeys['projects']),
            SizedBox(height: 48.h),
            SkillsSection(key: scrollController.sectionKeys['skills']),
            SizedBox(height: 48.h),
            EducationSection(key: scrollController.sectionKeys['education']),
            SizedBox(height: 48.h),
            ContactSection(key: scrollController.sectionKeys['contact']),
          ],
        ),
      ),
    );
  }
}
