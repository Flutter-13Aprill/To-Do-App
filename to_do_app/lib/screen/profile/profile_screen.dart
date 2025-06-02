import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screen/profile/bloc/profile_bloc.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/profile/options_widget.dart';
import 'package:to_do_app/widget/profile/task_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ProfileBloc>();
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 13),
                    Center(
                      child:
                          Text("Profile", style: AppTextStyles.headerText).tr(),
                    ),

                    SizedBox(height: 17),

                    BlocBuilder<ProfileBloc, ProfileState>(
                      buildWhen: (previous, current) {
                        if (current is ChnageNamgeState) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                      builder: (context, state) {
                        if (state is SuccessUploadImg) {
                          return CircleAvatar(
                            radius: 45,
                            backgroundImage: FileImage(bloc.image!),
                          );
                        }
                        return Image.asset("images/profileImg.png");
                      },
                    ),
                    SizedBox(height: 7),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      buildWhen: (previous, current) {
                        if (current is SuccessUploadImg) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                      builder: (context, state) {
                        if (state is ChnageNamgeState) {
                          return Text(
                            bloc.name,
                            style: AppTextStyles.headerText,
                          );
                        }
                        return Text("Aziz", style: AppTextStyles.headerText);
                      },
                    ),

                    SizedBox(height: 67),
                    TaskWidget(),
                    SizedBox(height: 32),
                    BlocProvider.value(value: bloc, child: OptionsWidget()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
