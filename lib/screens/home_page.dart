import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:url_launcher/url_launcher.dart';

const _ink = Color(0xFF101316);
const _paper = Color(0xFFF5F3EE);
const _lime = Color(0xFFD7F36B);
const _muted = Color(0xFF687078);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _workKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final target = key.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _paper,
      appBar: _NavigationBar(
        onNavigate: _scrollTo,
        workKey: _workKey,
        aboutKey: _aboutKey,
        contactKey: _contactKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Hero(
              onWork: () => _scrollTo(_workKey),
              onContact: () => _scrollTo(_contactKey),
            ),
            _Intro(key: _aboutKey),
            _Work(key: _workKey),
            const _Experience(),
            _Contact(key: _contactKey),
          ],
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<GlobalKey> onNavigate;
  final GlobalKey workKey;
  final GlobalKey aboutKey;
  final GlobalKey contactKey;
  const _NavigationBar({
    required this.onNavigate,
    required this.workKey,
    required this.aboutKey,
    required this.contactKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: _paper,
    foregroundColor: _ink,
    elevation: 0,
    title: Text(
      'PD.',
      style: GoogleFonts.spaceGrotesk(
        fontSize: 26,
        fontWeight: FontWeight.w800,
      ),
    ),
    actions: [
      _NavButton(label: 'WORK', onTap: () => onNavigate(workKey)),
      _NavButton(label: 'ABOUT', onTap: () => onNavigate(aboutKey)),
      _NavButton(label: 'CONTACT', onTap: () => onNavigate(contactKey)),
      const SizedBox(width: 28),
    ],
  );
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(foregroundColor: _ink),
    child: Text(
      label,
      style: GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    ),
  );
}

class _Hero extends StatelessWidget {
  final VoidCallback onWork;
  final VoidCallback onContact;
  const _Hero({required this.onWork, required this.onContact});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    color: _ink,
    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 72),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 680;
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FLUTTER DEVELOPER',
                  style: GoogleFonts.spaceGrotesk(
                    color: _lime,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Building useful\nthings for\nsmall screens.',
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontSize: compact ? 58 : 86,
                    height: .98,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'I’m Priyesh Dabre. I turn complex product ideas into calm, reliable Flutter experiences.',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white70,
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 36),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: onWork,
                      icon: const Icon(Icons.arrow_downward, size: 17),
                      label: const Text('EXPLORE WORK'),
                      style: FilledButton.styleFrom(
                        backgroundColor: _lime,
                        foregroundColor: _ink,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: onContact,
                      icon: const Icon(Icons.arrow_outward, size: 17),
                      label: const Text('GET IN TOUCH'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white38),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
            final mark = Container(
              width: compact ? 150 : 250,
              height: compact ? 150 : 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _lime, width: 2),
              ),
              child: Center(
                child: Text(
                  'PD',
                  style: GoogleFonts.dmSerifDisplay(
                    color: _lime,
                    fontSize: compact ? 58 : 92,
                  ),
                ),
              ),
            );
            return compact
                ? copy
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Flexible(child: copy), mark],
                );
          },
        ),
      ),
    ),
  );
}

class _Intro extends StatelessWidget {
  const _Intro({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(28, 84, 28, 78),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 680;
            return Flex(
              direction: compact ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: compact ? 0 : 2,
                  child: Text(
                    'A thoughtful engineer\nwith a product mindset.',
                    style: GoogleFonts.dmSerifDisplay(
                      color: _ink,
                      fontSize: compact ? 42 : 58,
                      height: 1.02,
                    ),
                  ),
                ),
                SizedBox(width: compact ? 0 : 100, height: compact ? 28 : 0),
                Expanded(
                  flex: compact ? 0 : 1,
                  child: Text(
                    'For 6+ years, I’ve worked across mobile products, from first screen to store release. My sweet spot is the space between a strong interface and the systems that keep it dependable.',
                    style: GoogleFonts.spaceGrotesk(
                      color: _muted,
                      fontSize: 16,
                      height: 1.65,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

class _Work extends StatelessWidget {
  const _Work({super.key});

  @override
  Widget build(BuildContext context) => Container(
    color: _ink,
    padding: const EdgeInsets.fromLTRB(28, 72, 28, 84),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel(number: '01', title: 'SELECTED WORK', light: true),
            const SizedBox(height: 38),
            ...projects.map((project) => _ProjectRow(project: project)),
          ],
        ),
      ),
    ),
  );
}

class _SectionLabel extends StatelessWidget {
  final String number;
  final String title;
  final bool light;
  const _SectionLabel({
    required this.number,
    required this.title,
    this.light = false,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        number,
        style: GoogleFonts.spaceGrotesk(
          color: light ? _lime : _muted,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(width: 14),
      Text(
        title,
        style: GoogleFonts.spaceGrotesk(
          color: light ? Colors.white70 : _muted,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    ],
  );
}

class _ProjectRow extends StatelessWidget {
  final Project project;
  const _ProjectRow({required this.project});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white24)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 650;
          final title = Row(
            children: [
              Text(
                project.number,
                style: GoogleFonts.spaceGrotesk(color: _lime, fontSize: 12),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  project.name,
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontSize: compact ? 34 : 46,
                  ),
                ),
              ),
            ],
          );
          final detail = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.dates,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white54,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                project.description,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white70,
                  height: 1.5,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    project.technologies
                        .map(
                          (tag) => Text(
                            tag,
                            style: GoogleFonts.spaceGrotesk(
                              color: _lime,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          );
          return compact
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, const SizedBox(height: 18), detail],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: title),
                  Expanded(child: detail),
                  const Icon(Icons.arrow_outward, color: _lime, size: 20),
                ],
              );
        },
      ),
    ),
  );
}

class _Experience extends StatelessWidget {
  const _Experience();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(28, 78, 28, 80),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel(number: '02', title: 'EXPERIENCE'),
            const SizedBox(height: 34),
            _ExperienceRow(
              role: 'Senior Systems Analyst',
              company: 'Speridian Technologies',
              dates: 'JAN 2023 — JUL 2026',
            ),
            _ExperienceRow(
              role: 'Flutter Developer',
              company: 'Anviya Technologies',
              dates: 'SEP 2021 — DEC 2022',
            ),
            _ExperienceRow(
              role: 'Flutter Developer',
              company: 'Vervali Systems',
              dates: 'OCT 2020 — OCT 2021',
            ),
            _ExperienceRow(
              role: 'Flutter Developer',
              company: 'Chrisel Technolab',
              dates: 'SEP 2019 — SEP 2020',
            ),
          ],
        ),
      ),
    ),
  );
}

class _ExperienceRow extends StatelessWidget {
  final String role;
  final String company;
  final String dates;
  const _ExperienceRow({
    required this.role,
    required this.company,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 18),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role,
                style: GoogleFonts.spaceGrotesk(
                  color: _ink,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                company,
                style: GoogleFonts.spaceGrotesk(color: _muted, fontSize: 14),
              ),
            ],
          ),
        ),
        Text(
          dates,
          style: GoogleFonts.spaceGrotesk(
            color: _muted,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

class _Contact extends StatelessWidget {
  const _Contact({super.key});

  static final _linkedinUrl = Uri.parse(
    'https://linkedin.com/in/priyesh-dabre-1943ba122',
  );

  Future<void> _openLinkedIn() async {
    await launchUrl(_linkedinUrl, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) => Container(
    color: _lime,
    padding: const EdgeInsets.fromLTRB(28, 72, 28, 78),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel(number: '03', title: 'LET’S CONNECT'),
            const SizedBox(height: 32),
            Text(
              'Have a product\nin mind?',
              style: GoogleFonts.dmSerifDisplay(
                color: _ink,
                fontSize: 64,
                height: .98,
              ),
            ),
            const SizedBox(height: 30),
            SelectableText(
              'priyeshdabre@gmail.com',
              style: GoogleFonts.spaceGrotesk(
                color: _ink,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '+91 86002 15178  ·  ',
                  style: GoogleFonts.spaceGrotesk(
                    color: _ink.withValues(alpha: .7),
                    fontSize: 13,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _openLinkedIn,
                    child: Text(
                      'linkedin.com/in/priyesh-dabre-1943ba122',
                      style: GoogleFonts.spaceGrotesk(
                        color: _ink,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 52),
            Text(
              '© 2026 PRIYESH DABRE',
              style: GoogleFonts.spaceGrotesk(
                color: _ink.withValues(alpha: .55),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
