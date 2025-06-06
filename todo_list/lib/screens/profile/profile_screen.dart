import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/repo/supabase.dart';
import 'package:todo_list/screens/profile/bloc/profile_bloc.dart';
import 'package:todo_list/screens/settings/settings_screen.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/widgets/change_image_bottomsheet_widget.dart';
import 'package:todo_list/widgets/change_name_dialog_widget.dart';
import 'package:todo_list/widgets/change_password_dialog_widget.dart';
import 'package:todo_list/widgets/custom_list_tile_widget.dart';
import 'package:todo_list/widgets/logout_dialog_widget.dart';
import 'package:todo_list/widgets/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ProfileBloc>();
          Localizations.localeOf(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "profile".tr(),
                style: TextStyle(color: AppColors.whiteTransparent),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeaderWidget(
                        name: SupabaseConnect.getUsersername() ?? "Guest",
                        imagePath: "assets/images/profile.png",
                      ),
                      AppSpacing.h16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "settings".tr(),
                            style: TextStyle(color: AppColors.whiteTransparent),
                          ),

                          CustomListTileWidget(
                            icon: Icons.settings_outlined,
                            title: "app_settings",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsScreen(),
                                ),
                              );
                            },
                          ),

                          Text(
                            "account".tr(),
                            style: TextStyle(color: AppColors.whiteTransparent),
                          ),
                          CustomListTileWidget(
                            icon: Icons.person_outline,
                            title: "change_account_name",
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocProvider.value(
                                    value: bloc,
                                    child: ChangeNameDialogWidget(),
                                  );
                                },
                              );
                            },
                          ),
                          CustomListTileWidget(
                            icon: Icons.key,
                            title: "change_account_password",
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocProvider.value(
                                    value: bloc,
                                    child: ChangePasswordDialogWidget(),
                                  );
                                },
                              );
                            },
                          ),
                          CustomListTileWidget(
                            icon: Icons.camera_alt_outlined,
                            title: "change_account_image",
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return ChangeImageBottomsheetWidget();
                                },
                              );
                            },
                          ),
                          CustomListTileWidget(
                            icon: Icons.logout_outlined,
                            title: "log_out",
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return LogoutDialogWidget();
                                },
                              );
                            },
                            color: Colors.red,
                            trailing: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
