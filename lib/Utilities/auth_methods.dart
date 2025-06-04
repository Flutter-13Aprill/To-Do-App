bool isLongEnough(String password) {
  return password.length >= 8;
}

bool hasNumber(String password) {
  final RegExp numberRegExp = RegExp(r'\d');
  return numberRegExp.hasMatch(password);
}
