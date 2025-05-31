import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getit/Utilities/screen_extension.dart';

class EmptyIndex extends StatelessWidget {
  const EmptyIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/emptyindex.png", width: 200, height: 200),
          SizedBox(height: context.screenHeight * 0.05),
          Text(context.tr("IndexScreen.title")),
          Text(context.tr("IndexScreen.subtitle")),
        ],
      ),
    );
  }
}
