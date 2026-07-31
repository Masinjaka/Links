part of 'app_database.dart';

const _settings = [
  ('APPEARANCE', 'Dark Mode', 'High contrast interface', 'switch', 'dark'),
  ('APPEARANCE', 'Accent Color', 'System-wide highlight', 'accent', 'palette'),
  ('DATA & EXPORT', 'Export Library (.csv)', '', 'button', 'download'),
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
