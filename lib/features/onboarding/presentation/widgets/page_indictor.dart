import 'package:flutter/material.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class PageIndictor extends StatelessWidget {
  const PageIndictor({super.key, required this.pageIndex});
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: List.generate(3, (index) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 26,
        height: 4,
        decoration: BoxDecoration(
          color: pageIndex == index ? AppPalette.selectedPageIndictorBackgroundColor : AppPalette.unselectedPageIndictorBackgroundColor
        ),
      ),
      )
    );
  }
}