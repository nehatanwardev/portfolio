import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher_string.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 100 : 60,
        horizontal: isDesktop ? 40 : 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I\'m',
            style: TextStyle(
              fontSize: isDesktop ? 24 : 18,
              fontWeight: FontWeight.w500,
            ),
          ).animate().fadeIn(duration: 500.ms).slideX(),
          const SizedBox(height: 8),
          Text(
            AppConstants.name,
            style: TextStyle(
              fontSize: isDesktop ? 60 : 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 300.ms).slideX(),
          const SizedBox(height: 16),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                AppConstants.title,
                textStyle: TextStyle(
                  fontSize: isDesktop ? 32 : 24,
                  fontWeight: FontWeight.w600,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
          ),
          const SizedBox(height: 32),
          Text(
            AppConstants.summary,
            style: TextStyle(
              fontSize: isDesktop ? 18 : 16,
              height: 1.5,
            ),
          ).animate().fadeIn(duration: 1000.ms, delay: 800.ms),
          const SizedBox(height: 40),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  downloadResume();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Download Resume'),
              ).animate().fadeIn(duration: 500.ms, delay: 1200.ms),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {
                  // Contact Me

                  _launchUrl('mailto:${AppConstants.email}');
                },
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Contact Me'),
              ).animate().fadeIn(duration: 500.ms, delay: 1400.ms),
            ],
          ),
        ],
      ),
    );
  }

  // Function to trigger the download of the resume.
  void downloadResume() {
    // Get the base URL for the current deployment
    final baseUrl = html.window.location.href.split('#')[0];

    // Remove trailing slash if present
    final normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;

    // Construct the full URL to the resume
    final url =
        'https://drive.google.com/file/d/1OziWJIBH3aUmEHUu40EqXakClDPyScUf/view?usp=sharing';

    // Create an anchor element to trigger the download
    final anchor = html.AnchorElement(href: url)
      ..target = '_blank'
      ..setAttribute('download', 'Neha_Tanwar_Resume.pdf')
      ..style.display = 'none';

    // Add to the DOM, click, and remove
    html.document.body?.children.add(anchor);
    anchor.click();

    // Remove after a short delay to ensure the download starts
    Future.delayed(const Duration(milliseconds: 100), () {
      anchor.remove();
    });
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch $url',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
