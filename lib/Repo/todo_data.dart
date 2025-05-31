import 'package:flutter/material.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Styles/colors.dart';

class TodoData {
  final List<Color> colorOptions = [
    yellowishGreen,
    lightRed,
    lightTurquoise,
    greenyTurquoise,
    lightPurple,
    pink,
    differentPink,
    lightGreen,
    lightBlue,
    beige,
  ];
  List<String> priority = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  List<Category> categories = [
    Category(
      name: 'Grocery',
      icon: Icons.food_bank, // bread-like icon
      backgroundColor: yellowishGreen,
    ),
    Category(name: 'Work', icon: Icons.work, backgroundColor: lightRed),
    Category(
      name: 'Sport',
      icon: Icons.fitness_center,
      backgroundColor: lightTurquoise,
    ),
    Category(
      name: 'Design',
      icon: Icons.design_services,
      backgroundColor: greenyTurquoise,
    ),
    Category(
      name: 'University',
      icon: Icons.school,
      backgroundColor: lightPurple,
    ),
    Category(name: 'Social', icon: Icons.campaign, backgroundColor: pink),
    Category(
      name: 'Music',
      icon: Icons.music_note,
      backgroundColor: differentPink,
    ),
    Category(name: 'Health', icon: Icons.favorite, backgroundColor: lightGreen),
    Category(name: 'Movie', icon: Icons.videocam, backgroundColor: lightBlue),
    Category(name: 'Home', icon: Icons.home, backgroundColor: beige),
  ];
}
