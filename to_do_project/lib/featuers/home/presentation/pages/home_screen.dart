import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/text/app_text.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/featuers/home/presentation/widget/custom_floating_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Index",
          style: TextStyles.lato400s16.copyWith(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset("assets/images/profile.png"),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_list, color: AppPalete.text, size: 24),
        ),
      ),
      body: Column(
        children: [
          const Gap(150),
          Center(child: Image.asset("assets/images/home.png")),
          Text(
            AppText.shomeTitle,
            style: TextStyles.lato400s16.copyWith(fontSize: 20),
          ),
          Text(AppText.homeSubTitle, style: TextStyles.lato400s16),
        ],
      ),

      floatingActionButton: const CustomFloatingButton(),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
