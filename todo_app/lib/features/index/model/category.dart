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
    category: 'Grocery',
  ),
  Category(
    imageSVG: 'assets/svg/work.svg',
    color: Color(0xFFFF9680),
    category: 'Work',
  ),
  Category(
    imageSVG: 'assets/svg/sport1.svg',
    color: Color(0xFF80FFFF),
    category: 'Sport',
  ),
  Category(
    imageSVG: 'assets/svg/design.svg',
    color: Color(0xFF80FFD9),
    category: 'Design',
  ),
  Category(
    imageSVG: 'assets/svg/university.svg',
    color: Color(0xFF809CFF),
    category: 'University',
  ),
  Category(
    imageSVG: 'assets/svg/social.svg',
    color: Color(0xFFFF80EB),
    category: 'Social',
  ),
  Category(
    imageSVG: 'assets/svg/music.svg',
    color: Color(0xFFFC80FF),
    category: 'Music',
  ),
  Category(
    imageSVG: 'assets/svg/health.svg',
    color: Color(0xFF80FFA3),
    category: 'Health',
  ),
  Category(
    imageSVG: 'assets/svg/movie.svg',
    color: Color(0xFF80D1FF),
    category: 'Movie',
  ),
  Category(
    imageSVG: 'assets/svg/home.svg',
    color: Color(0xFFFF8080),
    category: 'Home',
  ),
];
