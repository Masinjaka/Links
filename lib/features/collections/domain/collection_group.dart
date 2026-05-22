import 'package:flutter/material.dart';

class CollectionGroup {
  const CollectionGroup({
    required this.title,
    required this.type,
    required this.count,
    required this.icon,
  });

  final String title;
  final String type;
  final int count;
  final IconData icon;
}
