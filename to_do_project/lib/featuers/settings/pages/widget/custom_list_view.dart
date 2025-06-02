import 'package:flutter/material.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';

class CustomListViewS extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomListViewS({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyles.lato400s16.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppPalete.gray,
            ),
          ),
        ),

        Column(children: children),
      ],
    );
  }
}
