import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/components/animated_hover_card.dart';
import 'package:my_portfolio/theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skillCategories = [
      _SkillCategory(
        title: 'Core & Cross-Platform',
        icon: Icons.devices_rounded,
        accentColor: AppTheme.accentMint,
        description:
            'Building responsive, pixel-perfect, native-speed user interfaces across mobile, tablet, and web.',
        skills: [
          'Flutter SDK',
          'Dart',
          'Platform Channels',
          'Adaptive UI',
          'Custom Paint',
          'Animations',
        ],
      ),
      _SkillCategory(
        title: 'State & Architecture',
        icon: Icons.account_tree_rounded,
        accentColor: AppTheme.accentCyan,
        description:
            'Designing predictable, maintainable, and testable codebases using industry-standard paradigms.',
        skills: [
          'Riverpod',
          'BLoC / Cubit',
          'GetX',
          'Provider',
          'Clean Architecture',
          'Repository Pattern',
        ],
      ),
      _SkillCategory(
        title: 'Data & Offline Systems',
        icon: Icons.storage_rounded,
        accentColor: AppTheme.accentEmerald,
        description:
            'Engineering persistent, offline-first applications with seamless background cloud sync.',
        skills: [
          'SQLite / SQFlite',
          'Hive NoSQL',
          'RESTful APIs',
          'WebSockets',
          'FCM Push',
          'Secure Storage',
        ],
      ),
      _SkillCategory(
        title: 'Security, DevOps & QA',
        icon: Icons.verified_user_rounded,
        accentColor: AppTheme.accentIndigo,
        description:
            'Hardening apps against tampering, continuous integration, and deep telemetry monitoring.',
        skills: [
          'App Shielding',
          'Biometrics',
          'Crashlytics',
          'GitHub Actions',
          'Widget Testing',
          'Play / App Store',
        ],
      ),
    ];

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Row(
                children: [
                  Container(
                    width: 3,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppTheme.accentMint,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'CORE COMPETENCIES',
                    style: GoogleFonts.spaceGrotesk(
                      color: AppTheme.accentMint,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Engineered for Scale & Reliability',
                style: GoogleFonts.spaceGrotesk(
                  color: AppTheme.textPrimary,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'A battle-tested technology stack refined over 6+ years of shipping commercial applications.',
                style: GoogleFonts.plusJakartaSans(
                  color: AppTheme.textSecondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 48),

              // Responsive Grid of Skill Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 750;
                  if (isNarrow) {
                    return Column(
                      children: skillCategories
                          .map(
                            (cat) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: _SkillCard(category: cat),
                            ),
                          )
                          .toList(),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.55,
                    ),
                    itemCount: skillCategories.length,
                    itemBuilder: (context, index) {
                      return _SkillCard(category: skillCategories[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCategory {
  final String title;
  final IconData icon;
  final Color accentColor;
  final String description;
  final List<String> skills;

  _SkillCategory({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.description,
    required this.skills,
  });
}

class _SkillCard extends StatelessWidget {
  final _SkillCategory category;

  const _SkillCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return AnimatedHoverCard(
      hoverBorderColor: category.accentColor.withValues(alpha: 0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: category.accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  category.icon,
                  color: category.accentColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  category.title,
                  style: GoogleFonts.spaceGrotesk(
                    color: AppTheme.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            category.description,
            style: GoogleFonts.plusJakartaSans(
              color: AppTheme.textSecondary,
              fontSize: 13,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.bgSurface,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: Text(
                  skill,
                  style: GoogleFonts.spaceGrotesk(
                    color: AppTheme.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
