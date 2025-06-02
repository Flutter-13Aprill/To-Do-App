String? nameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Username is required. Please enter your username.';
  } else if (value.length <= 3) {
    return 'Username must be longer than 3 characters.';
  } else if (RegExp(r'^[0-9@\$!%*?&\-_]').hasMatch(value)) {
    return 'Username cannot start with a number or special character.';
  }

  return null;
}

String? validatePassword(String? password) {
  if ( password == null || password.trim().isEmpty) {
    return 'Password cannot be empty.';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters long.';
  }
  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return 'Password must contain at least one uppercase letter.';
  }
  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return 'Password must contain at least one lowercase letter.';
  }
  if (!RegExp(r'[0-9]').hasMatch(password)) {
    return 'Password must contain at least one number.';
  }
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    return 'Password must contain at least one special character.';
  }
  return null; 
}
