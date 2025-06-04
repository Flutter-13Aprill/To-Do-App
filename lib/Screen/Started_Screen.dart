import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:easy_localization/easy_localization.dart';
=======
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                    MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
=======
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                  );
                },
              ),

              const SizedBox(height: 40),

              Center(
<<<<<<< HEAD
                child: Text(
                  'welcome'.tr(),
                  style: const TextStyle(
=======
                child: const Text(
                  'Welcome to UpTodo',
                  style: TextStyle(
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                    'login_prompt_line1'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
=======
                    'Please login to your account or create',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
<<<<<<< HEAD
                      'login_prompt_line2'.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
=======
                      'new account to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  },
                  child: Text(
                    'login'.tr(),
                    style: const TextStyle(
=======
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
<<<<<<< HEAD

              const SizedBox(height: 24),

=======
              const SizedBox(height: 24),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                      MaterialPageRoute(builder: (context) =>  RegisterScreen()),
                    );
                  },
                  child: Text(
                    'create_account'.tr(),
                    style: const TextStyle(
=======
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
