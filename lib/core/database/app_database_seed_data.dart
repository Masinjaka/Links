part of 'app_database.dart';

class _SeedLink {
  const _SeedLink({
    required this.title,
    required this.url,
    required this.domain,
    required this.description,
    required this.tags,
    required this.createdAt,
  });

  final String title;
  final String url;
  final String domain;
  final String description;
  final List<String> tags;
  final DateTime createdAt;
}

final _seedLinks = [
  _SeedLink(
    title: 'FUTURISM MANIFESTO 2024',
    url: 'https://manifesto.io/kinetic',
    domain: 'manifesto.io',
    description: 'A framework for kinetic typography and interface design.',
    tags: const ['PHILOSOPHY', 'KINETIC_UI', 'VELOCITY'],
    createdAt: DateTime(2024, 4, 12, 14, 30),
  ),
  _SeedLink(
    title: 'HIGH-VELOCITY GRID SYSTEMS',
    url: 'https://grid.dev/sharp-edges',
    domain: 'grid.dev',
    description: 'A practical reference for strict grid systems.',
    tags: const ['DESIGN', 'UI_DESIGN'],
    createdAt: DateTime(2024, 3, 28),
  ),
  _SeedLink(
    title: 'FLUTTER KINETIC ANIMATION ENGINE',
    url: 'https://github.com/velocity/flutter-kinetic',
    domain: 'github.com',
    description: 'A Flutter animation runtime for kinetic interfaces.',
    tags: const ['DEVELOPMENT', 'RESEARCH'],
    createdAt: DateTime(2024, 5, 12),
  ),
  _SeedLink(
    title: 'CYBERPUNK INTERFACE GUIDELINES',
    url: 'https://notion.so/cyberpunk-interface-guidelines',
    domain: 'notion.so',
    description: 'Guidelines for high contrast cyberpunk interfaces.',
    tags: const ['UI_DESIGN', 'WEB3'],
    createdAt: DateTime(2024, 3, 15),
  ),
];

const _seedTags = [
  'PHILOSOPHY',
  'KINETIC_UI',
  'VELOCITY',
  'DESIGN',
  'UI_DESIGN',
  'DEV',
  'DEVELOPMENT',
  'RESEARCH',
  'WEB3',
  'ARCHIVE',
  'UTILITY',
];

const _seedCollections = [
  ('WORK_PROJECTS', 'PRIVATE', 'folder', 'UTILITY'),
  ('READ_LATER', 'QUEUE', 'bookmark', 'ARCHIVE'),
  ('DESIGN_INSP', 'SHARED', 'mosaic', 'DESIGN'),
  ('DEV_RESOURCES', 'SYSTEM', 'terminal', 'DEVELOPMENT'),
];

const _profileMetrics = [
  ('M', 12.0),
  ('T', 25.0),
  ('W', 18.0),
  ('T', 35.0),
  ('F', 42.0),
  ('S', 38.0),
  ('S', 55.0),
];

const _settings = [
  ('APPEARANCE', 'Dark Mode', 'High contrast interface', 'switch', 'dark'),
  ('APPEARANCE', 'Accent Color', 'System-wide highlight', 'accent', 'palette'),
  ('DATA & EXPORT', 'Export Library (.csv)', '', 'button', 'download'),
  ('DATA & EXPORT', 'Import from CSV', '', 'button', 'upload'),
];

const _onboarding = [
  (
    '01',
    'CAPTURE_EVERYTHING',
    'Save URLs instantly and organise them when you are ready.',
    'capture',
    false,
  ),
  (
    '02',
    'SHARE_FROM_ANYWHERE',
    'Send a page to LinkVault directly from your browser share sheet.',
    'browser',
    true,
  ),
  (
    '03',
    'VELOCITY_SEARCH',
    'Find any locally stored link in milliseconds.',
    'search',
    false,
  ),
];

const _platforms = [
  ('Chrome', 'googlechrome'),
  ('Firefox', 'firefox'),
  ('Safari', 'safari'),
  ('Edge', 'microsoftedge'),
];
