import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app_development/Screen/Login_Screen.dart';
import 'package:to_do_app_development/Screen/Onboarding_Screen.dart';
import 'package:to_do_app_development/Screen/Register_Screen.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
                  );
                },
              ),

              const SizedBox(height: 40),

              Center(
                child: Text(
                  'welcome'.tr(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Column(
                children: [
                  Text(
                    'login_prompt_line1'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'login_prompt_line2'.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8875FF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  },
                  child: Text(
                    'login'.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF7B61FF), width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    foregroundColor: const Color(0xFF8875FF),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  RegisterScreen()),
                    );
                  },
                  child: Text(
                    'create_account'.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
