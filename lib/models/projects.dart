class Project {
  final String number;
  final String name;
  final String category;
  final String dates;
  final String description;
  final String impact;
  final List<String> technologies;
  final List<String> highlights;
  final String? link;

  const Project({
    required this.number,
    required this.name,
    required this.category,
    required this.dates,
    required this.description,
    required this.impact,
    required this.technologies,
    this.highlights = const [],
    this.link,
  });
}

const projects = [
  Project(
    number: '01',
    name: 'myTime',
    category: 'Productivity & Utilities',
    dates: 'APR 2025 — JUL 2026',
    description:
        'A focused, precision time-tracking and productivity suite built for mobile and tablet with seamless offline-first capability.',
    impact: 'Shipped to Google Play Store with biometric security and sub-second cold starts.',
    technologies: ['Flutter', 'GetX', 'SQFlite', 'Biometrics', 'Local Auth'],
    highlights: [
      'Engineered localized SQLite persistence with automatic schema migrations',
      'Integrated biometric authentication for sensitive audit log access',
      'Designed adaptive responsive tablet & phone split layouts',
    ],
  ),
  Project(
    number: '02',
    name: 'TrueCoverage',
    category: 'Enterprise InsurTech',
    dates: 'JAN 2023 — MAR 2025',
    description:
        'A high-scale, multi-tenant insurance distribution platform handling real-time policy quoting, claims, and telemetry.',
    impact: 'Empowered thousands of brokers with production-grade app shielding and real-time push analytics.',
    technologies: ['Flutter', 'Riverpod', 'FCM', 'Crashlytics', 'App Shielding', 'REST APIs'],
    highlights: [
      'Migrated legacy state architecture to Riverpod with clean repository patterns',
      'Hardened app with code obfuscation and cryptographic tampering protection',
      'Reduced crash rate to <0.1% using Firebase Crashlytics telemetry pipelines',
    ],
  ),
  Project(
    number: '03',
    name: 'Maidanlah',
    category: 'Sports & Social Community',
    dates: 'SEP 2021 — DEC 2022',
    description:
        'A responsive community sports platform developed from scratch featuring complex nested booking workflows and instant messaging.',
    impact: 'Seamless offline-first experience with instant caching and background push synchronization.',
    technologies: ['Flutter', 'GetX', 'Hive DB', 'FCM', 'Responsive UI', 'WebSockets'],
    highlights: [
      'Built custom nested bottom navigation and route guards from the ground up',
      'Implemented ultra-fast offline caching layer using Hive NoSQL',
      'Achieved silky 60fps animations across low-end Android devices',
    ],
  ),
  Project(
    number: '04',
    name: 'Urban Ledger',
    category: 'Fintech & Bookkeeping',
    dates: 'OCT 2020 — OCT 2021',
    description:
        'A financial ledger product with secure transactional API integrations, multi-currency reporting, and automated reconciliation.',
    impact: 'Maintained 99.9% uptime with reliable local data sync and rigorous transaction validation.',
    technologies: ['Flutter', 'Bloc', 'Provider', 'SQLite', 'FCM', 'Encryption'],
    highlights: [
      'Architected transactional consistency using SQLite transactions & BLoC state',
      'Integrated automated PDF/Excel invoice export engines',
      'Delivered bi-directional sync with cloud accounting backend',
    ],
  ),
];
