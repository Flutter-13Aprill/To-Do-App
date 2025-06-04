import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Screens/start/bloc/start_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartBloc(),
      child: BlocBuilder<StartBloc, StartState>(
        builder: (context, state) {
          var bloc = context.read<StartBloc>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: mainText),
                onPressed: () {
                  bloc.add(BackButtonPressed(context));
                },
              ),
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        context.tr("StartScreen.title"),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: mainText,
                        ),
                      ),
                      Text(
                        context.tr("StartScreen.subtitle"),
                        style: TextStyle(fontSize: 16, color: mainText),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          bloc.add(LoginButtonPressed(context));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            context.screenWidth * 0.9,
                            context.screenHeight * 0.05,
                          ),
                        ),
                        child: Text(
                          context.tr("StartScreen.loginButton"),
                          style: TextStyle(color: mainText),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: primaryColor),
                          fixedSize: Size(
                            context.screenWidth * 0.9,
                            context.screenHeight * 0.05,
                          ),
                        ),
                        onPressed: () {
                          bloc.add(CreateAnAccountButtonPressed(context));
                        },
                        child: Text(
                          context.tr("StartScreen.createAnAccount"),
                          style: TextStyle(color: mainText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
