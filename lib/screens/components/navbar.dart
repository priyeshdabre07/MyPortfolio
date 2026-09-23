import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingNavBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<GlobalKey> onNavigate;
  final GlobalKey workKey;
  final GlobalKey skillsKey;
  final GlobalKey experienceKey;
  final GlobalKey contactKey;

  const FloatingNavBar({
    super.key,
    required this.onNavigate,
    required this.workKey,
    required this.skillsKey,
    required this.experienceKey,
    required this.contactKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  Future<void> _openLinkedIn() async {
    final uri = Uri.parse('https://linkedin.com/in/priyesh-dabre-1943ba122');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: AppTheme.bgSurface.withValues(alpha: 0.95),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _MobileNavItem(
                      label: 'Work & Projects',
                      icon: Icons.code_rounded,
                      onTap: () {
                        Navigator.pop(context);
                        onNavigate(workKey);
                      },
                    ),
                    _MobileNavItem(
                      label: 'Skills & Architecture',
                      icon: Icons.layers_rounded,
                      onTap: () {
                        Navigator.pop(context);
                        onNavigate(skillsKey);
                      },
                    ),
                    _MobileNavItem(
                      label: 'Career & Experience',
                      icon: Icons.work_history_rounded,
                      onTap: () {
                        Navigator.pop(context);
                        onNavigate(experienceKey);
                      },
                    ),
                    _MobileNavItem(
                      label: 'Get In Touch',
                      icon: Icons.mail_outline_rounded,
                      onTap: () {
                        Navigator.pop(context);
                        onNavigate(contactKey);
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _openLinkedIn();
                        },
                        icon: const Icon(Icons.arrow_outward_rounded, size: 18),
                        label: const Text('LinkedIn Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentMint,
                          foregroundColor: AppTheme.bgDark,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final isCompact = screenW < 800;

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.bgDark.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.borderSubtle, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Brand Monogram
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => onNavigate(workKey),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/icon/app_icon.png',
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Priyesh Dabre',
                              style: GoogleFonts.plusJakartaSans(
                                color: AppTheme.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),

                    // Desktop Navigation links
                    if (!isCompact) ...[
                      _NavLink(label: 'Work', onTap: () => onNavigate(workKey)),
                      _NavLink(
                        label: 'Skills',
                        onTap: () => onNavigate(skillsKey),
                      ),
                      _NavLink(
                        label: 'Experience',
                        onTap: () => onNavigate(experienceKey),
                      ),
                      _NavLink(
                        label: 'Contact',
                        onTap: () => onNavigate(contactKey),
                      ),
                      const SizedBox(width: 16),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: OutlinedButton.icon(
                          onPressed: _openLinkedIn,
                          icon: const Icon(
                            Icons.arrow_outward_rounded,
                            size: 15,
                            color: AppTheme.accentMint,
                          ),
                          label: Text(
                            'Connect',
                            style: GoogleFonts.spaceGrotesk(
                              color: AppTheme.accentMint,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppTheme.accentMint.withValues(alpha: 0.4),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      IconButton(
                        onPressed: () => _showMobileMenu(context),
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: AppTheme.textPrimary,
                        ),
                        tooltip: 'Open navigation',
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.bgCardHover : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.outfit(
              color: _isHovered ? AppTheme.accentMint : AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MobileNavItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.accentMint, size: 22),
      title: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          color: AppTheme.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppTheme.textMuted,
        size: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }
}
