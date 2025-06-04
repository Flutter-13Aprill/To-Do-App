import 'package:flutter/material.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_category.dart';

class CustomContentCatagory extends StatelessWidget {
  const CustomContentCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.maxFinite,
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            CustomCategoryItem(
              iconPath: 'assets/icons/bread 1.svg',
              title: 'Grocery',
              onTap: () {},
              backgroundColor: ColorsApp.cards3,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/briefcase 1.svg',
              title: 'Work',
              onTap: () {},
              backgroundColor: ColorsApp.cards2,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/sport 1.svg',
              title: 'Sport',
              onTap: () {},
              backgroundColor: ColorsApp.cards5,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/design (1) 1.svg',
              title: 'Design',
              onTap: () {},
              backgroundColor: ColorsApp.cards4,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/mortarboard 1.svg',
              title: 'University',
              onTap: () {},
              backgroundColor: ColorsApp.primary,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/megaphone 1.svg',
              title: 'Social',
              onTap: () {},
              backgroundColor: ColorsApp.cards10,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/music (1) 1.svg',
              title: 'Music',
              onTap: () {},
              backgroundColor: ColorsApp.cards9,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/heartbeat 1.svg',
              title: 'Health',
              onTap: () {},
              backgroundColor: ColorsApp.cards5,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/camera.svg',
              title: 'Movie',
              onTap: () {},
              backgroundColor: ColorsApp.cards7,
            ),
            CustomCategoryItem(
              iconPath: 'assets/icons/home (2) 1.svg',
              title: 'Home',
              onTap: () {},
              backgroundColor: ColorsApp.cards2,
            ),
          ],
        ),
      ),
    );
  }
}
