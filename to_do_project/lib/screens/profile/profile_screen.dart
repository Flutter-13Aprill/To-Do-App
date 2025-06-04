import 'package:flutter/material.dart';
import 'package:to_do_project/screens/login_and_regiter/login_screen.dart';
import 'package:to_do_project/screens/profile/setting_screen.dart';
import 'package:to_do_project/style/color_theme.dart';
import 'package:to_do_project/widgets/custom_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        children: [
          CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.none,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/avatar (2).png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen(),));
                      },
                      child: CustomProfile(
                        text: 'Setting',
                        icon: Icon(Icons.settings),
                      ),
                    ), // custom content to profile
                    Divider(color: AppColors.gray, thickness: 0.3),
                    CustomProfile(
                      text: 'Change account name',
                      icon: Icon(Icons.person_4_outlined),
                    ),
                    Divider(color: Colors.grey, thickness: 0.3),
                    CustomProfile(
                      text: 'Change account Image',
                      icon: Icon(Icons.camera_enhance),
                    ),
                    Divider(color: Colors.grey, thickness: 0.3),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Logout"),
                              content: Text("are you sure to logout?"),
                              actions: [
                                TextButton(
                                  child: Text("NO"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  child: Text("Yes"),
                                  onPressed:
                                      () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: CustomProfile(
                        text: 'Log Out',
                        icon: Icon(Icons.logout),
                      ),
                    ),
                  ],
                )

        ],
      )),
    );
  }
}