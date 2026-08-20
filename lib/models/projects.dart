class Project {
  final String number;
  final String name;
  final String dates;
  final String description;
  final List<String> technologies;

  const Project({
    required this.number,
    required this.name,
    required this.dates,
    required this.description,
    required this.technologies,
  });
}

const projects = [
  Project(
    number: '01',
    name: 'myTime',
    dates: 'APR 2025 — JUL 2026',
    description:
        'A focused time-tracking experience built for mobile and tablet, shipped to the Play Store.',
    technologies: ['Flutter', 'GetX', 'SQFlite', 'Biometrics'],
  ),
  Project(
    number: '02',
    name: 'TrueCoverage',
    dates: 'JAN 2023 — MAR 2025',
    description:
        'A multi-tenant insurance platform with secure authentication, analytics, and production-grade app protection.',
    technologies: ['Riverpod', 'FCM', 'Crashlytics', 'Shielding'],
  ),
  Project(
    number: '03',
    name: 'Maidanlah',
    dates: 'SEP 2021 — DEC 2022',
    description:
        'A responsive app developed from scratch with nested navigation and an offline-first data layer.',
    technologies: ['GetX', 'Hive DB', 'FCM', 'Responsive UI'],
  ),
  Project(
    number: '04',
    name: 'Urban Ledger',
    dates: 'OCT 2020 — OCT 2021',
    description:
        'A finance product with API integrations, local authentication, and a maintainable MVC architecture.',
    technologies: ['MVC', 'Bloc', 'Provider', 'SQLite'],
  ),
];
