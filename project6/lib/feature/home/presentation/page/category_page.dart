import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_button.dart';
import 'package:project6/core/widget/custom_color.dart';
import 'package:project6/core/widget/custom_text_field.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';
import 'package:project6/feature/home/presentation/widget/category_screens/custom_dropdown_button_icon.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.bloc});
  final HomeBloc bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppText.category, style: TextStyles.lato70020),
                SizedBox(height: 20),
                CustomTextField(
                  controller: bloc.categoryController,
                  text: AppText.hintCategory,
                  labelText: AppText.categoryName,
                ),
                SizedBox(height: 16),
                Text(AppText.categoryIcon, style: TextStyles.lato40016),
                SizedBox(height: 16),
                CustomDropdownButtonIcon(),
                SizedBox(height: 20),
                Text(AppText.categoryColor, style: TextStyles.lato40016),
                SizedBox(height: 16),

                Flexible(child: CustomColor()),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      height: 48,
                      width: 153,
                      color: AppPalette.blackColor,
                      onPressed: () {
                        context.customPop();
                      },
                      child: Text(
                        AppText.cancel,
                        style: TextStyles.lato40016.copyWith(
                          color: AppPalette.purpleColor,
                        ),
                      ),
                    ),
                    // CustomColor(),
                    SizedBox(width: 40),
                    CustomButton(
                      height: 48,
                      width: 153,
                      onPressed: () {
                        bloc.add(CreateCategoryEvent());
                        context.customPop();
                      },
                      child: Text(AppText.create, style: TextStyles.lato40016),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
