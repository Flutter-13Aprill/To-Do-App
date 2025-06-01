// Onboarding Model

import 'package:equatable/equatable.dart';

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

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.time,
    required this.priority,
  });

  @override
  List<Object?> get props => [id, title, description, dueDate, time, priority];
}

// Category Model
class CategoryModel {
  final String id;
  final String name;
  final String colorHex;

  CategoryModel({required this.id, required this.name, required this.colorHex});
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
