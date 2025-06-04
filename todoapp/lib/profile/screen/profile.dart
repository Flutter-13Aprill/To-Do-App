import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/login_register/screens/login_screen.dart';
import 'package:todoapp/profile/screen/bloc/profile_bloc.dart';
import 'package:todoapp/profile/screen/setting.dart';
import 'package:todoapp/profile/widget/row_setteing.dart';
import 'package:todoapp/theems/colors.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final changenamecontroller = TextEditingController();
  final changepasswordcontrolller = TextEditingController();
  final oldpasswordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is changepasswordsucssfuil) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("changepasswor is done sucssufely.")),
            );
          }
        },
        builder: (context, state) {
          final bloc = context.read<ProfileBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text("Profile", style: TextStyle(fontSize: 22)),
                          SizedBox(height: 12),
                          CircleAvatar(
                            backgroundColor: MyAppColor.black,
                            child: Image.asset("images/avtar.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 12),
                          Text("Fahad", style: TextStyle(fontSize: 22)),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NextButton(
                          button_text: "10 Task",
                          onPressed: () {},
                          textColor: MyAppColor.white,
                          width: 15,
                          color: MyAppColor.gray,
                        ),
                        NextButton(
                          button_text: "5 Task done",
                          onPressed: () {},
                          textColor: MyAppColor.white,
                          width: 15,
                          color: MyAppColor.gray,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text("Settings"),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setting()),
                        );
                      },
                      child: RowSetteing(
                        iconprofile: Icons.settings,
                        text: 'App Settings',
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Account"),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: MyAppColor.gray,

                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Change account name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Divider(),
                                  SizedBox(height: 12),
                                  SizedBox(
                                    child: TextField(
                                      controller: changenamecontroller,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Martha Hays",
                                        hintStyle: TextStyle(
                                          color: MyAppColor.white,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyAppColor.white.withOpacity(
                                              0.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      NextButton(
                                        button_text: "Cancel",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        textColor: MyAppColor.pur,
                                        width: 30,
                                        color: Colors.transparent,
                                      ),
                                      NextButton(
                                        button_text: "Edit",
                                        onPressed: () {},
                                        textColor: MyAppColor.white,
                                        width: 30,
                                        color: MyAppColor.pur,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: RowSetteing(
                        iconprofile: Icons.person,
                        text: 'Change account name',
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: RowSetteing(
                        iconprofile: Icons.photo_camera_outlined,
                        text: 'Change account Image',
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: MyAppColor.gray,

                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Change account Password",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Divider(),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Enter old password"),
                                  ),
                                  SizedBox(height: 8),
                                  SizedBox(
                                    child: TextField(
                                      controller: oldpasswordcontroller,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "............",
                                        hintStyle: TextStyle(
                                          color: MyAppColor.white,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyAppColor.white.withOpacity(
                                              0.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Enter new password"),
                                  ),
                                  SizedBox(height: 8),
                                  SizedBox(
                                    child: TextField(
                                      controller: newpasswordcontroller,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "............",
                                        hintStyle: TextStyle(
                                          color: MyAppColor.white,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyAppColor.white.withOpacity(
                                              0.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      NextButton(
                                        button_text: "Cancel",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        textColor: MyAppColor.pur,
                                        width: 30,
                                        color: Colors.transparent,
                                      ),
                                      NextButton(
                                        button_text: "Edit",
                                        onPressed: () {
                                          Editpassword(
                                            oldpassword:
                                                oldpasswordcontroller.text,
                                            newpassword: newpasswordcontroller
                                                .text
                                                .trim(),
                                          );
                                          Navigator.pop(context);
                                        },
                                        textColor: MyAppColor.white,
                                        width: 30,
                                        color: MyAppColor.pur,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: RowSetteing(
                        iconprofile: Icons.key,
                        text: 'Change account Password',
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<ProfileBloc, ProfileState>(
                      listener: (context, state) {
                        if (state is Profilelogout) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            bloc.add(LogOutevent());
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: const Color.fromARGB(255, 176, 40, 30),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
