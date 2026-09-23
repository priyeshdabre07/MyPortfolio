import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/components/animated_hover_card.dart';
import 'package:my_portfolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  final VoidCallback onScrollToTop;

  const ContactSection({super.key, required this.onScrollToTop});

  static final _emailUri = Uri.parse('mailto:priyeshdabre@gmail.com');
  static final _phoneUri = Uri.parse('tel:+918600215178');
  static final _linkedInUri = Uri.parse(
    'https://linkedin.com/in/priyesh-dabre-1943ba122',
  );

  void _copyEmail(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: 'priyeshdabre@gmail.com'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: AppTheme.accentMint, size: 20),
            const SizedBox(width: 12),
            Text(
              'Email copied to clipboard!',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.bgCard,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.bgSurface,
      padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
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
                    'GET IN TOUCH',
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
                'Let’s Build Something Remarkable',
                style: GoogleFonts.spaceGrotesk(
                  color: AppTheme.textPrimary,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Have an app architecture challenge, high-performance project, or team to scale? Feel free to reach out directly.',
                style: GoogleFonts.plusJakartaSans(
                  color: AppTheme.textSecondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 44),

              // Contact Channels
              LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 800;

                  final emailCard = AnimatedHoverCard(
                    padding: const EdgeInsets.all(22),
                    onTap: () => launchUrl(_emailUri),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.accentMint.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.mail_outline_rounded,
                            color: AppTheme.accentMint,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Direct Email',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppTheme.textMuted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'priyeshdabre@gmail.com',
                                style: GoogleFonts.spaceGrotesk(
                                  color: AppTheme.textPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => _copyEmail(context),
                          icon: const Icon(
                            Icons.copy_rounded,
                            color: AppTheme.textSecondary,
                            size: 18,
                          ),
                          tooltip: 'Copy Email',
                        ),
                      ],
                    ),
                  );

                  final linkedInCard = AnimatedHoverCard(
                    padding: const EdgeInsets.all(22),
                    onTap: () => launchUrl(_linkedInUri, mode: LaunchMode.externalApplication),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.accentCyan.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            color: AppTheme.accentCyan,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LinkedIn Profile',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppTheme.textMuted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'linkedin.com/in/priyesh-dabre-1943ba122',
                                style: GoogleFonts.spaceGrotesk(
                                  color: AppTheme.textPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_outward_rounded,
                          color: AppTheme.accentCyan,
                          size: 18,
                        ),
                      ],
                    ),
                  );

                  final phoneCard = AnimatedHoverCard(
                    padding: const EdgeInsets.all(22),
                    onTap: () => launchUrl(_phoneUri),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.accentEmerald.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.phone_outlined,
                            color: AppTheme.accentEmerald,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone & WhatsApp',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppTheme.textMuted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '+91 86002 15178',
                                style: GoogleFonts.spaceGrotesk(
                                  color: AppTheme.textPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_outward_rounded,
                          color: AppTheme.accentEmerald,
                          size: 18,
                        ),
                      ],
                    ),
                  );

                  if (isCompact) {
                    return Column(
                      children: [
                        emailCard,
                        const SizedBox(height: 16),
                        linkedInCard,
                        const SizedBox(height: 16),
                        phoneCard,
                      ],
                    );
                  }

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: emailCard),
                          const SizedBox(width: 20),
                          Expanded(child: linkedInCard),
                        ],
                      ),
                      const SizedBox(height: 20),
                      phoneCard,
                    ],
                  );
                },
              ),
              const SizedBox(height: 72),
              const Divider(color: AppTheme.borderSubtle, height: 1),
              const SizedBox(height: 32),

              // Footer
              LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 600;

                  final copyrightText = Column(
                    crossAxisAlignment:
                        isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Text(
                        '© 2026 PRIYESH DABRE. ALL RIGHTS RESERVED.',
                        style: GoogleFonts.spaceGrotesk(
                          color: AppTheme.textMuted,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Engineered with Flutter & Dart',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );

                  final backToTopButton = TextButton.icon(
                    onPressed: onScrollToTop,
                    icon: const Icon(
                      Icons.arrow_upward_rounded,
                      size: 16,
                      color: AppTheme.accentMint,
                    ),
                    label: Text(
                      'BACK TO TOP',
                      style: GoogleFonts.spaceGrotesk(
                        color: AppTheme.accentMint,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                  );

                  if (isNarrow) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        copyrightText,
                        const SizedBox(height: 16),
                        backToTopButton,
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      copyrightText,
                      backToTopButton,
                    ],
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
