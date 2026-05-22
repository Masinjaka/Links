import 'package:flutter/material.dart';

class CollectionIconOption {
  const CollectionIconOption({
    required this.key,
    required this.label,
    required this.icon,
  });

  final String key;
  final String label;
  final IconData icon;
}

const collectionIconOptions = [
  CollectionIconOption(
    key: 'folder',
    label: 'GENERAL',
    icon: Icons.folder_rounded,
  ),
  CollectionIconOption(
    key: 'bookmark',
    label: 'READING',
    icon: Icons.bookmark_rounded,
  ),
  CollectionIconOption(
    key: 'mosaic',
    label: 'INSPIRATION',
    icon: Icons.auto_awesome_mosaic_rounded,
  ),
  CollectionIconOption(
    key: 'terminal',
    label: 'DEV',
    icon: Icons.terminal_rounded,
  ),
  CollectionIconOption(key: 'code', label: 'CODE', icon: Icons.code_rounded),
  CollectionIconOption(
    key: 'palette',
    label: 'DESIGN',
    icon: Icons.palette_rounded,
  ),
  CollectionIconOption(
    key: 'school',
    label: 'LEARNING',
    icon: Icons.school_rounded,
  ),
  CollectionIconOption(
    key: 'article',
    label: 'ARTICLES',
    icon: Icons.article_rounded,
  ),
  CollectionIconOption(
    key: 'image',
    label: 'VISUALS',
    icon: Icons.image_rounded,
  ),
  CollectionIconOption(key: 'movie', label: 'VIDEO', icon: Icons.movie_rounded),
  CollectionIconOption(
    key: 'headphones',
    label: 'AUDIO',
    icon: Icons.headphones_rounded,
  ),
  CollectionIconOption(key: 'work', label: 'WORK', icon: Icons.work_rounded),
  CollectionIconOption(
    key: 'travel',
    label: 'TRAVEL',
    icon: Icons.flight_takeoff_rounded,
  ),
  CollectionIconOption(
    key: 'shopping',
    label: 'SHOPPING',
    icon: Icons.shopping_bag_rounded,
  ),
  CollectionIconOption(
    key: 'fitness',
    label: 'FITNESS',
    icon: Icons.fitness_center_rounded,
  ),
  CollectionIconOption(
    key: 'favorite',
    label: 'FAVORITES',
    icon: Icons.favorite_rounded,
  ),
  CollectionIconOption(
    key: 'archive',
    label: 'ARCHIVE',
    icon: Icons.inventory_2_rounded,
  ),
  CollectionIconOption(
    key: 'star',
    label: 'PRIORITY',
    icon: Icons.star_rounded,
  ),
  CollectionIconOption(key: 'public', label: 'WEB', icon: Icons.public_rounded),
  CollectionIconOption(key: 'bolt', label: 'QUICK', icon: Icons.bolt_rounded),
];

IconData collectionIconForKey(String iconKey) {
  for (final option in collectionIconOptions) {
    if (option.key == iconKey) {
      return option.icon;
    }
  }

  return Icons.folder_rounded;
}

String collectionIconLabelForKey(String iconKey) {
  for (final option in collectionIconOptions) {
    if (option.key == iconKey) {
      return option.label;
    }
  }

  return 'GENERAL';
}
