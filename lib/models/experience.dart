class Experience {
  final String role;
  final String company;
  final String duration;
  final String period;
  final String location;
  final List<String> responsibilities;
  final List<String> technologies;

  const Experience({
    required this.role,
    required this.company,
    required this.duration,
    required this.period,
    required this.location,
    required this.responsibilities,
    required this.technologies,
  });
}

const experiences = [
  Experience(
    role: 'Senior Systems Analyst',
    company: 'Speridian Technologies',
    period: 'JAN 2023 — JUL 2026',
    duration: '3 yrs 7 mos',
    location: 'Mumbai, India',
    responsibilities: [
      'Architected cross-platform enterprise mobile solutions using Flutter, Riverpod, and Clean Architecture.',
      'Led performance tuning initiatives, reducing memory consumption by 30% and eliminating UI frame drops.',
      'Enforced enterprise-grade security standards including app shielding, SSL pinning, and root detection.',
      'Mentored engineering teams, instituted code review best practices, and designed reusable widget libraries.',
    ],
    technologies: ['Flutter', 'Riverpod', 'CI/CD', 'App Shielding', 'Crashlytics', 'REST APIs'],
  ),
  Experience(
    role: 'Flutter Developer',
    company: 'Anviya Technologies',
    period: 'SEP 2021 — DEC 2022',
    duration: '1 yr 4 mos',
    location: 'Pune, India',
    responsibilities: [
      'Developed responsive, multi-platform applications with nested navigation flows and offline-first storage.',
      'Designed lightning-fast local cache mechanisms using Hive DB and SQLite.',
      'Integrated real-time push notification pipelines (FCM) and payment gateways with automated retry logic.',
    ],
    technologies: ['Flutter', 'GetX', 'Hive DB', 'FCM', 'Responsive Design', 'Payment SDKs'],
  ),
  Experience(
    role: 'Flutter Developer',
    company: 'Vervali Systems',
    period: 'OCT 2020 — OCT 2021',
    duration: '1 yr 1 mo',
    location: 'Mumbai, India',
    responsibilities: [
      'Implemented robust financial features using BLoC/Provider state management and secure local databases.',
      'Built custom data visualizations, charting widgets, and automated statement generation modules.',
      'Collaborated closely with UX designers to ensure pixel-perfect fidelity across varied screen densities.',
    ],
    technologies: ['Flutter', 'BLoC', 'Provider', 'SQLite', 'Local Auth', 'REST APIs'],
  ),
  Experience(
    role: 'Flutter Developer',
    company: 'Chrisel Technolab',
    period: 'SEP 2019 — SEP 2020',
    duration: '1 yr 1 mo',
    location: 'Mumbai, India',
    responsibilities: [
      'Delivered end-to-end mobile applications from initial concept and UI mockups to Play Store and App Store deployment.',
      'Built reusable custom UI components, responsive layout frameworks, and third-party native plugin wrappers.',
    ],
    technologies: ['Flutter', 'Dart', 'Git', 'REST APIs', 'Material Design', 'App Publishing'],
  ),
];
