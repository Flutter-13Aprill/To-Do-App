import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/widget/custom_button.dart';
import 'package:to_do_project/featuers/profile/bloc/profile_bloc.dart';

class CustomPasswordDialog extends StatelessWidget {
  const CustomPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();

    return AlertDialog(
      backgroundColor: AppPalete.containart,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Column(
        children: [
          const Text(
            "Change account Password",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Divider(thickness: 1, color: AppPalete.gray),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: oldPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter old password",

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppPalete.gray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(color: AppPalete.buttton, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter new password",

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppPalete.gray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(color: AppPalete.buttton, width: 2),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: AppPalete.buttton)),
        ),
        CustomElvatedButton(
          width: 153,
          height: 48,
          press: () {
            final oldPassword = oldPasswordController.text.trim();
            final newPassword = newPasswordController.text.trim();

            if (oldPassword.isNotEmpty && newPassword.isNotEmpty) {
              context.read<ProfileBloc>().add(
                ChangePasswordEvent(
                  oldPassword: oldPassword,
                  newPassword: newPassword,
                ),
              );
              Navigator.pop(context);
            }
          },
          child: const Text("Edit"),
        ),
      ],
    );
  }
}
