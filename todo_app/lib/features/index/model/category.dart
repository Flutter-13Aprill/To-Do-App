import 'package:flutter/material.dart';

/// Represents a task or event category with an icon, color, and label.
class Category {
  final String imageSVG;
  final Color color;
  final String category;
  Category({
    required this.imageSVG,
    required this.color,
    required this.category,
  });
}

List<Category> categoryList = [
  Category(
    imageSVG: 'assets/svg/grocery.svg',
    color: Color(0xFFCCFF80),
    category: "categoryGrocery",
  ),
  Category(
    imageSVG: 'assets/svg/work.svg',
    color: Color(0xFFFF9680),
    category: "categoryWork",
  ),
  Category(
    imageSVG: 'assets/svg/sport1.svg',
    color: Color(0xFF80FFFF),
    category: "categorySport",
  ),
  Category(
    imageSVG: 'assets/svg/design.svg',
    color: Color(0xFF80FFD9),
    category: "categoryDesign",
  ),
  Category(
    imageSVG: 'assets/svg/university.svg',
    color: Color(0xFF809CFF),
    category: "categoryUniversity",
  ),
  Category(
    imageSVG: 'assets/svg/social.svg',
    color: Color(0xFFFF80EB),
    category: "categorySocial",
  ),
  Category(
    imageSVG: 'assets/svg/music.svg',
    color: Color(0xFFFC80FF),
    category: "categoryMusic",
  ),
  Category(
    imageSVG: 'assets/svg/health.svg',
    color: Color(0xFF80FFA3),
    category: "categoryHealth",
  ),
  Category(
    imageSVG: 'assets/svg/movie.svg',
    color: Color(0xFF80D1FF),
    category: "categoryMovie",
  ),
  Category(
    imageSVG: 'assets/svg/home.svg',
    color: Color(0xFFFF8080),
    category: "categoryHome",
  ),
];
