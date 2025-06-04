import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/index/widget/buttons_widget.dart';
import 'package:todo_app/features/profile/bloc/profile_bloc.dart';
import 'package:todo_app/features/profile/widgets/change_text_field_widget.dart';
import 'package:todo_app/style/style_color.dart';

//Username Update
class UsernameUpdateDialoge extends StatelessWidget {
  const UsernameUpdateDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return Dialog(
      backgroundColor: StyleColor.grey,
      child: SizedBox(
        height: 200,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChangeTextFieldWidget(
                  input: bloc.updateNameController,
                  hintText: 'Change account name',
                ),
                ButtonsWidget(
                  text: "edit".tr(),
                  onPressedNext: () {
                    bloc.add(ChangeNameEvent());
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
