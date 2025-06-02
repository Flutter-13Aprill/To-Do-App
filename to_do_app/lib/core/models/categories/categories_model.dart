import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final IconData icon;
  final Color color;

  Category({required this.id, required this.title, required this.icon, required this.color});

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      icon: IconsMap[map['icon_name']] ?? Icons.category,
      color: Color(int.parse(map['color_hex'].substring(1), radix: 16) + 0xFF000000),
    );
  }
}


const Map<String, IconData> IconsMap = {
  'bakery_dining': Icons.bakery_dining,
  'work': Icons.work,
  'fitness_center': Icons.fitness_center,
  'sports_esports': Icons.sports_esports,
  'school': Icons.school,
  'campaign': Icons.campaign,
  'music_note': Icons.music_note,
  'favorite': Icons.favorite,
  'videocam': Icons.videocam,
  'home': Icons.home,
  'add': Icons.add,
};
