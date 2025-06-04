import 'dart:ui';

class CategoryModel {
  final int? id;
  final String name;
  final String iconName;
  final String colorHex;
  final bool isSelected;

  CategoryModel({
    this.id,
    required this.name,
    required this.iconName,
    required this.colorHex,
    this.isSelected = false,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon_name": iconName,
        "color_hex": colorHex,
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] as int?,
      name: json["name"],
      iconName: json["icon_name"],
      colorHex: json["color_hex"],
      isSelected: false,
    );
  }

 

  Color get color => Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
}
