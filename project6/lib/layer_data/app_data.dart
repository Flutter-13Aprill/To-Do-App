import 'package:flutter/material.dart';
import 'package:project6/models/category_model.dart';
import 'package:project6/models/task/task_model.dart';

class AppData {
  // final List<Color> colorlist = [
  // ];
  List<String> priority = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  
  final List<TaskModel> tasks = [];
  final List<CategoryModel> categories = [
    CategoryModel(
      category: 'Grocery',
      icon: 'assets/icons/grocery.png',
      color: const Color.fromARGB(255, 204, 255, 128),
    ),
    CategoryModel(
      category: 'Work',
      icon: 'assets/icons/work.png',
      color: const Color.fromARGB(255, 255, 150, 128),
    ),
    CategoryModel(
      category: 'Sport',
      icon: 'assets/icons/sport.png',
      color: const Color.fromARGB(255, 128, 255, 255),
    ),
    CategoryModel(
      category: 'Design',
      icon: 'assets/icons/sony.png',
      color: const Color.fromARGB(255, 128, 255, 217),
    ),
    CategoryModel(
      category: 'University',
      icon: 'assets/icons/graduate.png',
      color: const Color.fromARGB(255, 128, 156, 255),
    ),
    CategoryModel(
      category: 'Social',
      icon: 'assets/icons/microphone.png',
      color: const Color.fromARGB(255, 255, 128, 235),
    ),
    CategoryModel(
      category: 'Music',
      icon: 'assets/icons/music.png',
      color: const Color.fromARGB(255, 252, 128, 255),
    ),
    CategoryModel(
      category: 'Health',
      icon: 'assets/icons/heartbeat.png',
      color: const Color.fromARGB(255, 128, 255, 163),
    ),
    CategoryModel(
      category: 'Movie',
      icon: 'assets/icons/video.png',
      color: const Color.fromARGB(255, 128, 209, 255),
    ),
    CategoryModel(
      category: 'Home',
      icon: 'assets/icons/home2.png',
      color: const Color.fromARGB(255, 255, 204, 128),
    ),
    CategoryModel(
      category: 'Create New',
      icon: 'assets/icons/plus.png',
      color: const Color.fromARGB(255, 128, 255, 209),
    ),
  ];
}
