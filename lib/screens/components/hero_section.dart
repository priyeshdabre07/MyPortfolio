import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/components/animated_hover_card.dart';
import 'package:my_portfolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onWork;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onWork,
    required this.onContact,
  });

  Future<void> _openLinkedIn() async {
    final uri = Uri.parse('https://linkedin.com/in/priyesh-dabre-1943ba122');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.bgDark,
        gradient: RadialGradient(
          center: const Alignment(0.6, -0.7),
          radius: 1.3,
          colors: [
            AppTheme.accentMint.withValues(alpha: 0.08),
            AppTheme.accentIndigo.withValues(alpha: 0.04),
            AppTheme.bgDark,
          ],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 900;

              final heroText = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.accentEmerald.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppTheme.accentEmerald.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppTheme.accentMint,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.accentMint.withValues(alpha: 0.6),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'AVAILABLE FOR SENIOR MOBILE ROLES',
                          style: GoogleFonts.spaceGrotesk(
                            color: AppTheme.accentMint,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Headline
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crafting fluid,',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: isCompact ? 38 : 62,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                          letterSpacing: -1.2,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppTheme.mintCyanGradient.createShader(bounds),
                        child: Text(
                          'high-performance',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: isCompact ? 38 : 62,
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                            letterSpacing: -1.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Flutter applications.',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: isCompact ? 38 : 62,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                          letterSpacing: -1.2,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Subtitle
                  Text(
                    'I’m Priyesh Dabre, a Senior Mobile Engineer with 6+ years building production-grade iOS & Android applications. Focused on scalable reactive state, clean architecture, and silky 60fps experiences.',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppTheme.textSecondary,
                      fontSize: isCompact ? 16 : 18,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Action Buttons
                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: [
                      ElevatedButton.icon(
                        onPressed: onWork,
                        icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                        label: Text(
                          'EXPLORE WORK',
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentMint,
                          foregroundColor: AppTheme.bgDark,
                          elevation: 8,
                          shadowColor: AppTheme.accentMint.withValues(alpha: 0.35),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: onContact,
                        icon: const Icon(
                          Icons.mail_outline_rounded,
                          size: 18,
                          color: AppTheme.textPrimary,
                        ),
                        label: Text(
                          'GET IN TOUCH',
                          style: GoogleFonts.spaceGrotesk(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTheme.borderSubtle),
                          backgroundColor: AppTheme.bgCard.withValues(alpha: 0.6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _openLinkedIn,
                        icon: const Icon(
                          Icons.arrow_outward_rounded,
                          size: 16,
                          color: AppTheme.accentCyan,
                        ),
                        label: Text(
                          'LINKEDIN',
                          style: GoogleFonts.spaceGrotesk(
                            color: AppTheme.accentCyan,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );

              // Interactive Tech Spec Badge / Card
              final techSpecCard = AnimatedHoverCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(28),
                backgroundColor: AppTheme.bgSurface.withValues(alpha: 0.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Code card header
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF4444),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF59E0B),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFF10B981),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.borderSubtle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'priyesh.dart',
                            style: GoogleFonts.jetBrainsMono(
                              color: AppTheme.textMuted,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Avatar & Summary
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/icon/app_icon.png',
                            width: 58,
                            height: 58,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Priyesh Dabre',
                                style: GoogleFonts.spaceGrotesk(
                                  color: AppTheme.textPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Senior Systems Analyst & Mobile Lead',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppTheme.accentMint,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: AppTheme.borderSubtle, height: 1),
                    const SizedBox(height: 20),

                    // Architecture Highlights
                    _SpecRow(
                      icon: Icons.speed_rounded,
                      title: 'Performance Target',
                      value: '120 FPS / Impeller Ready',
                    ),
                    const SizedBox(height: 12),
                    _SpecRow(
                      icon: Icons.architecture_rounded,
                      title: 'State Architecture',
                      value: 'Riverpod · BLoC · GetX',
                    ),
                    const SizedBox(height: 12),
                    _SpecRow(
                      icon: Icons.security_rounded,
                      title: 'Mobile Hardening',
                      value: 'App Shielding · Biometrics',
                    ),
                    const SizedBox(height: 12),
                    _SpecRow(
                      icon: Icons.cloud_sync_rounded,
                      title: 'Offline Systems',
                      value: 'Hive · SQLite · FCM Sync',
                    ),
                  ],
                ),
              );

              return Column(
                children: [
                  if (isCompact) ...[
                    heroText,
                    const SizedBox(height: 48),
                    techSpecCard,
                  ] else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 7, child: heroText),
                        const SizedBox(width: 60),
                        Expanded(flex: 5, child: techSpecCard),
                      ],
                    ),
                  ],
                  const SizedBox(height: 72),

                  // Metrics Ribbon
                  _MetricsRibbon(isCompact: isCompact),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SpecRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppTheme.accentCyan),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: AppTheme.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            color: AppTheme.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MetricsRibbon extends StatelessWidget {
  final bool isCompact;

  const _MetricsRibbon({required this.isCompact});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {'val': '6+', 'label': 'Years Experience'},
      {'val': '4+', 'label': 'Enterprise & Store Apps'},
      {'val': '100k+', 'label': 'Active Users Impacted'},
      {'val': '99.9%', 'label': 'Production Stability'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderSubtle),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 600;
          if (isNarrow) {
            return Wrap(
              spacing: 24,
              runSpacing: 20,
              alignment: WrapAlignment.spaceAround,
              children: metrics.map((m) => _MetricItem(m['val']!, m['label']!)).toList(),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: metrics
                .map((m) => Expanded(child: _MetricItem(m['val']!, m['label']!)))
                .toList(),
          );
        },
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String value;
  final String label;

  const _MetricItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppTheme.mintCyanGradient.createShader(bounds),
          child: Text(
            value,
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            color: AppTheme.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
