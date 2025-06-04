import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final IconData icon;
  final Color color;
  final int colorIndex;

  Category({required this.id, required this.title, required this.icon, required this.color,required this.colorIndex, });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      icon: IconsMap[map['icon_name']] ?? Icons.category,
      color: categoriesColors[(map['color_index'])?? 0], 
      colorIndex: map['color_index'],
    );
  }
}


const Map<int, IconData> iconsId = {
0: Icons.bakery_dining,
1: Icons.work,
2: Icons.fitness_center,
3: Icons.sports_esports,
4: Icons.school,
5: Icons.campaign,
6: Icons.music_note,
7: Icons.favorite,
8: Icons.videocam,
9:Icons.home,
10:Icons.add,
};

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

const Map<int, String> iconsName = {
0: 'Grocery',
1: 'work',
2: 'Sport',
3: 'Design',
4: 'University',
5: 'Social',
6: 'Music',
7: 'Health',
8: 'Movie',
9:'home',
10: 'add',
};

final List<Color> categoriesColors = [
    Color.fromARGB(255,204, 255, 128,),
    Color.fromARGB(255, 255, 150, 128),
    Color.fromARGB(255,128, 255, 255),
    Color.fromARGB(255,128, 255, 217),
    Color.fromARGB(255,128, 156, 255),
    Color.fromARGB(255,255, 128, 235),
    Color.fromARGB(255,252, 128, 255),
    Color.fromARGB(255,128, 255, 163),
    Color.fromARGB(255, 128, 209, 255),
    Color.fromARGB(255,255, 128, 128),
    Color.fromARGB(255,128, 255, 209),
  ];
  final List<Color> iconsColor = [
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
  Colors.black, 
];
