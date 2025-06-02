import 'package:flutter/cupertino.dart';

class Validator {
  final passwordControlle = TextEditingController();
  final userNameCotroller = TextEditingController();
  final ConfirmpasswordControlle = TextEditingController();
  final task = TextEditingController();
  final taskDescription = TextEditingController();

  static String? validatePassword(String? value) {
    {
      if (value == null || value.isEmpty) {
        return "password is required";
      } else if (value.length <= 8) {
        return "password must have more than 8 chracters";
      } else if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Uppercase letter is missing.\n';
      } else if (!value.contains(RegExp(r'[a-z]'))) {
        return 'Lowercase letter is missing.\n';
      }
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Digit is missing.\n';
      }
      if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
        return 'Special character is missing.\n';
      }
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    } else if (value.length <= 2) {
      return "username must have more than 3 chracters";
    }
    return null;
  }
}
