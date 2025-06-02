import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/category/bloc/category_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/custom_text_field_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CategoryBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        AppSpacing.h32,
                        Text(
                          "create_new_category".tr(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteTransparent,
                          ),
                        ),
                        AppSpacing.h32,

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "category_name".tr(),
                              style: TextStyle(
                                color: AppColors.whiteTransparent,
                              ),
                            ),
                            AppSpacing.h16,
                            CustomTextFieldWidget(
                              hintText: "category_name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'category_validation'.tr();
                                }
                                return null;
                              },
                            ),

                            AppSpacing.h24,
                            Text(
                              "${'category_icon'.tr()} :",
                              style: TextStyle(
                                color: AppColors.whiteTransparent,
                              ),
                            ),
                            AppSpacing.h16,

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkGray,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "choose_icon_from_library".tr(),
                                style: TextStyle(
                                  color: AppColors.whiteTransparent,
                                ),
                              ),
                            ),

                            AppSpacing.h24,
                            Text(
                              "${'category_color'.tr()} :",
                              style: TextStyle(
                                color: AppColors.whiteTransparent,
                              ),
                            ),
                            AppSpacing.h16,

                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: bloc.colorsList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                    ),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: bloc.colorsList[index],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.getWidth(factor: 0.37),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "cancel".tr(),
                        style: TextStyle(color: AppColors.lightPurole),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPurole,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(context.getWidth(factor: 0.37), 48),
                    ),
                    onPressed: () {},
                    child: Text(
                      "create_category".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
