import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getit/Styles/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: context.tr("IndexScreen.searchPlaceholder"),
          hintStyle: TextStyle(color: mainText),
          prefixIcon: Icon(Icons.search, color: mainText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: borderColor, width: 0.8),
          ),
          filled: true,
          fillColor: searchBarColor,
        ),
        onChanged: (value) {
          // Handle search logic here
        },
      ),
    );
  }
}
