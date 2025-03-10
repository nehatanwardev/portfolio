import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
                  // Download Resume
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
}
