import 'package:flutter/material.dart';

class CollectionIconOption {
  const CollectionIconOption(this.key, this.label, this.icon);

  final String key;
  final String label;
  final IconData icon;
}

const collectionIconOptions = [
  CollectionIconOption('folder', 'GENERAL', Icons.folder_rounded),
  CollectionIconOption('bookmark', 'READING', Icons.bookmark_rounded),
  CollectionIconOption(
    'mosaic',
    'INSPIRATION',
    Icons.auto_awesome_mosaic_rounded,
  ),
  CollectionIconOption('terminal', 'DEVELOPMENT', Icons.terminal_rounded),
  CollectionIconOption('code', 'CODE', Icons.code_rounded),
  CollectionIconOption('palette', 'DESIGN', Icons.palette_rounded),
  CollectionIconOption('school', 'LEARNING', Icons.school_rounded),
  CollectionIconOption('article', 'ARTICLES', Icons.article_rounded),
  CollectionIconOption('image', 'VISUALS', Icons.image_rounded),
  CollectionIconOption('movie', 'VIDEO', Icons.movie_rounded),
  CollectionIconOption('headphones', 'AUDIO', Icons.headphones_rounded),
  CollectionIconOption('work', 'WORK', Icons.work_rounded),
  CollectionIconOption('travel', 'TRAVEL', Icons.flight_takeoff_rounded),
  CollectionIconOption('shopping', 'SHOPPING', Icons.shopping_bag_rounded),
  CollectionIconOption('fitness', 'FITNESS', Icons.fitness_center_rounded),
  CollectionIconOption('favorite', 'FAVORITES', Icons.favorite_rounded),
  CollectionIconOption('archive', 'ARCHIVE', Icons.inventory_2_rounded),
  CollectionIconOption('star', 'PRIORITY', Icons.star_rounded),
  CollectionIconOption('public', 'WEB', Icons.public_rounded),
  CollectionIconOption('bolt', 'QUICK', Icons.bolt_rounded),
  CollectionIconOption('home', 'HOME', Icons.home_rounded),
  CollectionIconOption('business', 'BUSINESS', Icons.business_center_rounded),
  CollectionIconOption('dashboard', 'DASHBOARD', Icons.dashboard_rounded),
  CollectionIconOption('list', 'LISTS', Icons.view_list_rounded),
  CollectionIconOption('book', 'BOOKS', Icons.menu_book_rounded),
  CollectionIconOption('news', 'NEWS', Icons.newspaper_rounded),
  CollectionIconOption('science', 'SCIENCE', Icons.science_rounded),
  CollectionIconOption('calculate', 'FINANCE', Icons.calculate_rounded),
  CollectionIconOption('language', 'LANGUAGES', Icons.language_rounded),
  CollectionIconOption('link', 'LINKS', Icons.link_rounded),
  CollectionIconOption('cloud', 'CLOUD', Icons.cloud_rounded),
  CollectionIconOption('storage', 'DATABASE', Icons.storage_rounded),
  CollectionIconOption('build', 'TOOLS', Icons.build_rounded),
  CollectionIconOption('engineering', 'ENGINEERING', Icons.engineering_rounded),
  CollectionIconOption(
    'architecture',
    'ARCHITECTURE',
    Icons.architecture_rounded,
  ),
  CollectionIconOption('brush', 'CREATIVE', Icons.brush_rounded),
  CollectionIconOption('camera', 'PHOTOGRAPHY', Icons.photo_camera_rounded),
  CollectionIconOption('music', 'MUSIC', Icons.music_note_rounded),
  CollectionIconOption('microphone', 'RECORDINGS', Icons.mic_rounded),
  CollectionIconOption('podcasts', 'PODCASTS', Icons.podcasts_rounded),
  CollectionIconOption('football', 'SPORTS', Icons.sports_soccer_rounded),
  CollectionIconOption('running', 'RUNNING', Icons.directions_run_rounded),
  CollectionIconOption('restaurant', 'FOOD', Icons.restaurant_rounded),
  CollectionIconOption('coffee', 'COFFEE', Icons.local_cafe_rounded),
  CollectionIconOption('health', 'HEALTH', Icons.health_and_safety_rounded),
  CollectionIconOption('medical', 'MEDICAL', Icons.medical_services_rounded),
  CollectionIconOption('savings', 'SAVINGS', Icons.savings_rounded),
  CollectionIconOption('payments', 'PAYMENTS', Icons.payments_rounded),
  CollectionIconOption('receipt', 'RECEIPTS', Icons.receipt_long_rounded),
  CollectionIconOption('event', 'EVENTS', Icons.event_rounded),
  CollectionIconOption('schedule', 'SCHEDULE', Icons.schedule_rounded),
  CollectionIconOption('location', 'PLACES', Icons.location_on_rounded),
  CollectionIconOption('map', 'MAPS', Icons.map_rounded),
  CollectionIconOption('groups', 'TEAMS', Icons.groups_rounded),
  CollectionIconOption('person', 'PEOPLE', Icons.person_rounded),
  CollectionIconOption('family', 'FAMILY', Icons.family_restroom_rounded),
  CollectionIconOption('pets', 'PETS', Icons.pets_rounded),
  CollectionIconOption('eco', 'NATURE', Icons.eco_rounded),
  CollectionIconOption('idea', 'IDEAS', Icons.lightbulb_rounded),
  CollectionIconOption('flag', 'GOALS', Icons.flag_rounded),
  CollectionIconOption('lock', 'PRIVATE', Icons.lock_rounded),
  CollectionIconOption('shield', 'SECURITY', Icons.shield_rounded),
  CollectionIconOption('key', 'ACCESS', Icons.vpn_key_rounded),
  CollectionIconOption('mail', 'EMAIL', Icons.mail_rounded),
  CollectionIconOption('chat', 'MESSAGES', Icons.chat_rounded),
  CollectionIconOption('phone', 'CALLS', Icons.phone_rounded),
  CollectionIconOption('computer', 'DESKTOP', Icons.computer_rounded),
  CollectionIconOption('smartphone', 'MOBILE', Icons.smartphone_rounded),
  CollectionIconOption('games', 'GAMES', Icons.sports_esports_rounded),
  CollectionIconOption(
    'celebration',
    'CELEBRATIONS',
    Icons.celebration_rounded,
  ),
];

IconData collectionIconForKey(String iconKey) {
  for (final option in collectionIconOptions) {
    if (option.key == iconKey) return option.icon;
  }
  return Icons.folder_rounded;
}

String collectionIconLabelForKey(String iconKey) {
  for (final option in collectionIconOptions) {
    if (option.key == iconKey) return option.label;
  }
  return 'GENERAL';
}
