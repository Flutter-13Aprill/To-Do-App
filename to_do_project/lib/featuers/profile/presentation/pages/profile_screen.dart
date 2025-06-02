import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/function/navigator.dart';
import 'package:to_do_project/core/repo/supabase.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/featuers/auth/presentation/pages/log_in_screen.dart';
import 'package:to_do_project/featuers/profile/bloc/profile_bloc.dart';
import 'package:to_do_project/featuers/profile/presentation/widget/custom_circle_avtar.dart';
import 'package:to_do_project/featuers/profile/presentation/widget/custom_task_counter.dart';
import 'package:to_do_project/featuers/profile/presentation/widget/custom_task_list_view.dart';
import 'package:to_do_project/featuers/settings/pages/presentation/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is SigningOutState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Signing out...')));
          } else if (state is SignOutSuccessState) {
            customReplacmentNaviagte(context, const LogInScreen());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged out successfully!')),
            );
          } else if (state is ProfileErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          } else if (state is NavigateToAppSettingsState) {
            print(
              "Received NavigateToAppSettingsState. Attempting to navigate.",
            );

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingScreen()),
            );
          }
        },
        child: Builder(
          builder: (context) {
            final profileBloc = context.read<ProfileBloc>();

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Profile",
                  style: TextStyles.lato400s16.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const CustomCircleAvtar(),
                    const SizedBox(height: 10),
                    Text(
                      SupabaseStart.getCurrentUser()
                              ?.userMetadata?['user_name'] ??
                          "Guest User",
                      style: TextStyles.lato400s16.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomTaskCounter(task: '10 Task left'),
                          ),
                          const Gap(20),
                          Expanded(
                            child: CustomTaskCounter(task: '5 Task done'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomListViewP(title: '', children: []),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
