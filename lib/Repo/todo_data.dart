import 'package:flutter/material.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Styles/colors.dart';

class TodoData {
  List<String> priority = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  List<Category> categories = [
    Category(
      iconColor: groceryIconColor,
      name: 'Grocery',
      icon: Icons.food_bank, // bread-like icon
      backgroundColor: yellowishGreen,
    ),
    Category(
      iconColor: workIconColor,
      name: 'Work',
      icon: Icons.work,
      backgroundColor: lightRed,
    ),
    Category(
      iconColor: sportsIconColor,
      name: 'Sport',
      icon: Icons.fitness_center,
      backgroundColor: lightTurquoise,
    ),
    Category(
      iconColor: designIconColor,
      name: 'Design',
      icon: Icons.design_services,
      backgroundColor: greenyTurquoise,
    ),
    Category(
      iconColor: universityIconColor,
      name: 'University',
      icon: Icons.school,
      backgroundColor: lightPurple,
    ),
    Category(
      iconColor: socialIconColor,
      name: 'Social',
      icon: Icons.campaign,
      backgroundColor: pink,
    ),
    Category(
      iconColor: musicIconColor,
      name: 'Music',
      icon: Icons.music_note,
      backgroundColor: differentPink,
    ),
    Category(
      iconColor: healthIconColor,
      name: 'Health',
      icon: Icons.favorite,
      backgroundColor: lightGreen,
    ),
    Category(
      iconColor: movieIconColor,
      name: 'Movie',
      icon: Icons.videocam,
      backgroundColor: lightBlue,
    ),
    Category(
      iconColor: homeIconColor,
      name: 'Home',
      icon: Icons.home,
      backgroundColor: beige,
    ),
  ];
}
