import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/Intro/second_onbording_scree.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  Widget pageToGo;
  Widget backPage;
  String title;
  double width= .25;
  NavigationButton({super.key, required this.pageToGo, required this.backPage ,required this.title});

  @override
  Widget build(BuildContext context) {

   
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => backPage),
            );
          },
          child: Text(
            "back".tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(
                context,
              ).textTheme.titleMedium!.color!.withOpacity(0.7),
            ),
          ),
        ),
        SizedBox(width: context.getWidth() * .52),
        Container(
           height: context.getHeigth() * .05,
          width:title=="Get Started".tr()?context.getWidth()* .3:context.getWidth()* width,
          decoration: BoxDecoration(
            color: StyleColor.primaryPurpulColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageToGo),
              );
            },
            child: Text(
             title.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
