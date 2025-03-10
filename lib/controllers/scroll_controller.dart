import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScrollController extends GetxController {
  final ScrollController scrollController = ScrollController();

  // Create a map of section keys with descriptive names
  final Map<String, GlobalKey> sectionKeys = {
    'header': GlobalKey(),
    'about': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'education': GlobalKey(),
    'contact': GlobalKey(),
  };

  // Get a list of section keys for easy access by index
  List<GlobalKey> get sectionKeysList => [
        sectionKeys['about']!,
        sectionKeys['experience']!,
        sectionKeys['projects']!,
        sectionKeys['skills']!,
        sectionKeys['education']!,
        sectionKeys['contact']!,
      ];

  void scrollToSection(int index) {
    final key = sectionKeysList[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
