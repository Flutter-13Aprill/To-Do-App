import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/screen/profile/bloc/profile_bloc.dart';
import 'package:to_do_app/screen/profile/settings_screen.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/profile/alert_dialog_widget.dart';
import 'package:to_do_app/widget/profile/bottom_sheet_widget.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 14),
            alignment: Alignment.centerLeft,
            child: Text("Settings", style: AppTextStyles.settingSubText).tr(),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            leading: Icon(Icons.settings, color: AppColors.white),
            title: Text("Settings", style: AppTextStyles.subText).tr(),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 14),

            alignment: Alignment.centerLeft,
            child: Text("Account", style: AppTextStyles.settingSubText).tr(),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return BlocProvider.value(
                    value: bloc,
                    child: AlertDialogWidget(),
                  );
                },
              );
            },
            leading: Icon(Icons.person_2_outlined, color: AppColors.white),
            title:
                Text("Change account name", style: AppTextStyles.subText).tr(),
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider.value(
                    value: bloc,
                    child: BottomSheetWidget(),
                  );
                },
              );
            },
            leading: Icon(Icons.camera_alt_outlined, color: AppColors.white),
            title:
                Text("Change account Image", style: AppTextStyles.subText).tr(),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.logout_rounded, color: Color(0xffFF4949)),
            title:
                Text(
                  "Log out",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFF4949),
                  ),
                ).tr(),
          ),
        ],
      ),
    );
  }
}
