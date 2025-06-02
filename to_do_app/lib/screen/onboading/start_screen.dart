import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/screen/auth/login_screen.dart';
import 'package:to_do_app/screen/auth/register_screen.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined, color: AppColors.white),
        ),
        backgroundColor: Color(0xff121212),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 58),
              Center(
                child:
                    Text(
                      "Welcome to UpTodo",
                      style: AppTextStyles.mainText,
                    ).tr(),
              ),
              SizedBox(height: 26),

              Center(
                child:
                    Text(
                      "Please login to your account or create\nnew account to continue",
                      style: AppTextStyles.subText,
                      textAlign: TextAlign.center,
                    ).tr(),
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 48,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff8875FF),
                  ),
                  child: Center(
                    child:
                        Text(
                          "LOGIN",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ).tr(),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 48,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 2, color: AppColors.primary),
                  ),
                  child: Center(
                    child:
                        Text(
                          "CREATE ACCOUNT",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ).tr(),
                  ),
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }
}
