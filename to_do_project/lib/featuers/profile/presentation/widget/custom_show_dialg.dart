import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/widget/custom_button.dart';
import 'package:to_do_project/featuers/profile/bloc/profile_bloc.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return AlertDialog(
      backgroundColor: AppPalete.containart,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Column(
        children: [
          Text("Change Account Name", style: TextStyles.lato400s16),
          Divider(thickness: 1, color: AppPalete.gray),
        ],
      ),
      content: TextField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: "Enter new name",
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
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: AppPalete.buttton)),
        ),
        CustomElvatedButton(
          width: 153,
          height: 48,
          press: () {
            final newName = nameController.text.trim();
            if (newName.isNotEmpty) {
              context.read<ProfileBloc>().add(UpdateNameEvent(newName));
              Navigator.pop(context);
            }
          },
          child: const Text("Edit"),
        ),
      ],
    );
  }
}
