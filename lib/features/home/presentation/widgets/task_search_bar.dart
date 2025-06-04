import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class TaskSearchBar extends StatelessWidget {
  const TaskSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorHeight: 12,
      cursorColor: AppPalette.primaryBackgroundColor,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: tr('home_screen.search'),
        prefixIcon: SvgPicture.asset('assets/visuals/home/svgs/search-normal.svg',fit: BoxFit.scaleDown,),
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff979797), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff979797), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff979797), width: 1),
        )
      ),
    );
  }
}