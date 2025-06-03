// Onboarding Model

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

class UserModel {
  final String name;
  final String imagePath;

  const UserModel({required this.name, required this.imagePath});

  UserModel copyWith({String? name, String? imagePath}) {
    return UserModel(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

// Task Model

class TaskModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final String time;
  final String priority;
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.time,
    required this.priority,
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    dueDate,
    time,
    priority,
    categoryName,
    categoryIcon,
    categoryColor,
  ];
}

// Category Model
class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;

  const CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toMap() => {
    'name': name,
    'iconCodePoint': icon.codePoint,
    'iconFontFamily': icon.fontFamily,
    'colorValue': color.value,
  };

  static CategoryModel fromMap(Map<String, dynamic> map) => CategoryModel(
    name: map['name'],
    icon: IconData(map['iconCodePoint'], fontFamily: map['iconFontFamily']),
    color: Color(map['colorValue']),
  );
}

// Settings Model
class SettingsModel {
  final bool notificationsEnabled;
  final String language;
  final bool darkMode;

  SettingsModel({
    required this.notificationsEnabled,
    required this.language,
    required this.darkMode,
  });
}
