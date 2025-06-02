import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/featuers/onbording/presentation/pages/onbording_screen.dart';
import 'package:to_do_project/featuers/splash/bloc/splash_bloc.dart';
import 'package:to_do_project/featuers/splash/bloc/splash_event.dart'; // تأكد من المسار
import 'package:to_do_project/featuers/splash/bloc/splash_state.dart'; // تأكد من المسار

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: Builder(
        builder: (blocContext) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            blocContext.read<SplashBloc>().add(InitializeSplash());
          });

          return BlocListener<SplashBloc, SplashState>(
            listener: (listenerContext, state) {
              if (state is SplashLoaded) {
                Navigator.of(listenerContext).pushReplacement(
                  MaterialPageRoute(builder: (c) => const OnbordingScreen()),
                );
              }
            },
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset("assets/images/splach.png")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
