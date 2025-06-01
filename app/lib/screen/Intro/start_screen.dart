import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/auth/login_and_register/login/login_screen.dart';
import 'package:app/screen/auth/login_and_register/register/register_screen.dart';
import 'package:app/screen/widgets/conatiner/linear_conatiner.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
         
            children: [
              Text(
                "Welcome to UpTodo".tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 18,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Please login".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.titleMedium!.color!.withOpacity(0.7),
                  ),
                ),
              ),
              SizedBox(height:500),
              SizedBox(
                width: context.getWidth() * 0.8,
                height: context.getHeigth() * .08,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("LOGIN".tr()),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: context.getWidth() * 0.8,
                height: context.getHeigth() * .08,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),  
                    );
                  },
                  child: Text(
                    "CREATE_ACCOUNT".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              LinearConatiner()
            ],
          ),
        ),
      ),
    );
  }
}
