import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/profile/bloc/profile_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/custom_text_field_Widget.dart';

class ChangePasswordDialogWidget extends StatelessWidget {
  const ChangePasswordDialogWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: AppColors.darkGray,
        actionsPadding: EdgeInsets.all(8),

        title: Text(
          "change_account_password".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.whiteTransparent),
        ),
        content: SizedBox(
          width: context.getWidth(factor: 0.8),
          height: context.getHeight(factor: 0.25),
          child: Column(
            children: [
              Divider(thickness: 1, color: AppColors.mediumGray),

              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "enter_old_password".tr(),
                      style: TextStyle(color: AppColors.whiteTransparent),
                    ),
                    AppSpacing.h8,
                    CustomTextFieldWidget(
                      controller: bloc.oldPassController,
                      hintText: "*******************",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username_validation'.tr();
                        }
                        return null;
                      },
                    ),
                    AppSpacing.h24,
                    Text(
                      "enter_new_password".tr(),
                      style: TextStyle(color: AppColors.whiteTransparent),
                    ),
                    AppSpacing.h8,
                    CustomTextFieldWidget(
                      controller: bloc.newPassController,
                      hintText: "*******************",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username_validation'.tr();
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
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
                child: Text("edit".tr(), style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
