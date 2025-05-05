import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:math' as math;

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.code,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
              const SizedBox(width: 16),
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: isDesktop ? 28 : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 32),
          if (isDesktop)
            AnimationLimiter(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConstants.projects.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: _buildProjectCard(
                          context,
                          project: AppConstants.projects[index],
                          index: index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          else
            AnimationLimiter(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConstants.projects.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: _buildProjectCard(
                          context,
                          project: AppConstants.projects[index],
                          index: index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required Map<String, dynamic> project,
    required int index,
  }) {
    final title = project['title'] as String;
    final subtitle = project['subtitle'] as String;
    final duration = project['duration'] as String? ?? '';
    final company = project['company'] as String? ?? '';
    final description = project['description'] as String;
    final technologies = List<String>.from(project['technologies']);
    final links = project['links'] as List<dynamic>? ?? [];

    return HoverAnimatedContainer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.background.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.15),
                    Theme.of(context).primaryColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ).animate().fadeIn(delay: 100.ms),
                      ),
                      if (links.isNotEmpty)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < links.length; i++)
                              _buildLinkButton(context, links[i], i),
                          ],
                        ),
                    ],
                  ),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).hintColor,
                        ),
                      ).animate().fadeIn(delay: 200.ms),
                    ),
                  if (duration.isNotEmpty || company.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          if (duration.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    duration,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (company.isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.business,
                                  size: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  company,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ).animate().fadeIn(delay: 300.ms),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  const SizedBox(height: 20),
                  if (project.containsKey('keyPoints') &&
                      (project['keyPoints'] as List).isNotEmpty)
                    _buildKeyPoints(context, project['keyPoints'], index),
                  const SizedBox(height: 20),
                  _buildTechStack(context, technologies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyPoints(
      BuildContext context, List<dynamic> keyPoints, int projectIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Achievements:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ).animate().fadeIn(delay: 500.ms),
        const SizedBox(height: 12),
        ...List<String>.from(keyPoints)
            .take(3)
            .map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(
                        delay: Duration(
                            milliseconds:
                                500 + ((keyPoints.indexOf(point) + 1) * 100)),
                      ),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildTechStack(BuildContext context, List<String> technologies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ).animate().fadeIn(delay: 700.ms),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies.asMap().entries.map((entry) {
            final index = entry.key;
            final tech = entry.value;
            return _buildTechChip(context, tech)
                .animate()
                .fadeIn(delay: Duration(milliseconds: 800 + (index * 50)));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLinkButton(
      BuildContext context, Map<String, dynamic> link, int index) {
    final IconData icon = _getLinkIcon(link['title'] as String);
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () async {
            final url = link['url'] as String;
            if (url != 'Link') {
              if (await canLaunch(url)) {
                await launch(url);
              }
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 300 + (index * 100)));
  }

  IconData _getLinkIcon(String linkType) {
    switch (linkType.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'demo':
        return Icons.play_arrow;
      case 'website':
        return Icons.language;
      case 'play store':
        return Icons.android;
      case 'app store':
        return Icons.apple;
      default:
        return Icons.link;
    }
  }

  Widget _buildTechChip(BuildContext context, String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.15),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        tech,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class HoverAnimatedContainer extends StatefulWidget {
  final Widget child;

  const HoverAnimatedContainer({
    super.key,
    required this.child,
  });

  @override
  State<HoverAnimatedContainer> createState() => _HoverAnimatedContainerState();
}

class _HoverAnimatedContainerState extends State<HoverAnimatedContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return MouseRegion(
      onEnter: isDesktop
          ? (_) {
              setState(() => isHovered = true);
            }
          : null,
      onExit: isDesktop
          ? (_) {
              setState(() => isHovered = false);
            }
          : null,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isHovered ? 1.01 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.only(
              top: isHovered ? 0.0 : 6.0, bottom: isHovered ? 6.0 : 0.0),
          child: widget.child,
        ),
      ),
    );
  }
}
