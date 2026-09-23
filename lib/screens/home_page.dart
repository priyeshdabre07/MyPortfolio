import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/components/contact_section.dart';
import 'package:my_portfolio/screens/components/experience_section.dart';
import 'package:my_portfolio/screens/components/hero_section.dart';
import 'package:my_portfolio/screens/components/navbar.dart';
import 'package:my_portfolio/screens/components/projects_section.dart';
import 'package:my_portfolio/screens/components/skills_section.dart';
import 'package:my_portfolio/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      extendBodyBehindAppBar: true,
      appBar: FloatingNavBar(
        onNavigate: _scrollTo,
        workKey: _workKey,
        skillsKey: _skillsKey,
        experienceKey: _experienceKey,
        contactKey: _contactKey,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Extra top padding for floating appbar
            const SizedBox(height: 80),
            HeroSection(
              onWork: () => _scrollTo(_workKey),
              onContact: () => _scrollTo(_contactKey),
            ),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _workKey),
            ExperienceSection(key: _experienceKey),
            ContactSection(
              key: _contactKey,
              onScrollToTop: _scrollToTop,
            ),
          ],
        ),
      ),
    );
  }
}
