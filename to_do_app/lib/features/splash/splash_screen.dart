import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/loading/loading_screen.dart';
import 'package:to_do_app/features/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => SplashBloc(),
  child: BlocConsumer<SplashBloc, SplashState>(
    listenWhen: (previous, current) => current is MoveState,
    listener: (context, state) {
      if (state is MoveState) {
        context.replacement(LoadingScreen());
      }
    },
    builder: (context, state) {
      if (state is SplashInitial) {
        context.read<SplashBloc>().add(MoveEvent());
      }
          return Scaffold(
            
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.getShortest(per: 1),
                  vertical: context.getShortest(per: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/splash.png',
                        fit: BoxFit.contain,
                      ),
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
