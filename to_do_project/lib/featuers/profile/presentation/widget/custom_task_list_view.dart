import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/featuers/profile/bloc/profile_bloc.dart';
import 'package:to_do_project/featuers/profile/presentation/widget/custom_show_dialg.dart';
import 'package:to_do_project/featuers/profile/presentation/widget/custom_dilog_pass.dart';

class CustomListViewP extends StatelessWidget {
  const CustomListViewP({
    super.key,
    required String title,
    required List<ListTile> children,
  });

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Settings', style: TextStyles.lato400s16),
          ),
        ),
        ListTile(
          leading: Icon(Icons.settings, color: AppPalete.text),
          title: Text('App Settings', style: TextStyles.lato400s16),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppPalete.text,
          ),
          onTap: () {
            profileBloc.add(ProfileAppSettingsTapped());
          },
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Account', style: TextStyles.lato400s16),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle_outlined, color: AppPalete.text),
          title: Text('Change account name', style: TextStyles.lato400s16),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return BlocProvider.value(
                  value: profileBloc,
                  child: CustomShowDialog(),
                );
              },
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.key, color: AppPalete.text),
          title: Text('Change Password', style: TextStyles.lato400s16),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return BlocProvider.value(
                  value: profileBloc,
                  child: const CustomPasswordDialog(),
                );
              },
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.image_outlined, color: AppPalete.text),
          title: Text('Change account Image', style: TextStyles.lato400s16),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text('Log out', style: TextStyle(color: Colors.red)),
          onTap: () {
            profileBloc.add(ProfileSignOutEvent());
          },
        ),
      ],
    );
  }
}
