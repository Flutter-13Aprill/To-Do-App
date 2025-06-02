import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/screens/auth/auth_services.dart';
import 'package:todoapp_darkmode/screens/auth/create_account/bloc/registor_bloc.dart';

import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
   final _confirmPasswordController = TextEditingController();

@override
Widget build(BuildContext context) {
  return BlocListener<RegistorBloc, RegistorState>(
    listener: (context, state) {
      if (state is RegistorFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: ${state.message}')),
        );
      }

      if (state is RegistorSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created!')),
        );
      }

      if (state is RegistorLoading) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const Center(child: CircularProgressIndicator()),
        );
      }

      if (state is RegistorSuccess) {
        Navigator.popAndPushNamed(context, '/home');
      }

      if (state is! RegistorLoading) {
        Navigator.of(context, rootNavigator: true).pop(); // Close loader
      }
    },

        child: Scaffold(
          backgroundColor: AppColors.darkBackground,
          body: Column(
            children: [
              const SizedBox(height: 150),
              _textRow("Register", AppFonts.fontSizeTwo),
              const SizedBox(height: 40),
              _textRow("Username", AppFonts.fontSizeThree),
              _inputField(_emailController, "Enter your Username"),
              _textRow("Password", AppFonts.fontSizeThree),
              _inputField(_passwordController, "Enter your Password", obscure: true),
              const SizedBox(height: 48),
              _textRow("Confirm Password", AppFonts.fontSizeThree),
_inputField(_confirmPasswordController, "Re-enter your Password", obscure: true),
              const SizedBox(height: 48),
              ElevatedButton(
        onPressed: () {
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();
  final confirmPassword = _confirmPasswordController.text.trim();

  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Passwords do not match")),
    );
    return;
  }

  context.read<RegistorBloc>().add(RegistorSubmitted(email, password));
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lilac,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(380, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text("Register", style: AppFonts.fontSizeTen),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget _textRow(String text, TextStyle style) => Row(
        children: [const SizedBox(width: 30), Text(text, style: style)],
      );
Widget _inputField(TextEditingController controller, String hint, {bool obscure = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      SizedBox(
        width: 380,
        height: 68,
        child: TextFormField(
          controller: controller,
          obscureText: obscure, //  now it's optional
          style: AppFonts.fontSizeThree,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppFonts.fontSizeThree,
            filled: true,
            fillColor: AppColors.darkgrey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.lightgrey, width: 0.8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.lightgrey, width: 0.8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.lightgrey, width: 0.8),
            ),
          ),
        ),
      ),
    ],
  );
}

}
Widget buildRegisterPageWithBloc() {
  return BlocProvider(
    create: (_) => RegistorBloc(AuthServices()),
    child: const RegisterPage(),
  );
}

