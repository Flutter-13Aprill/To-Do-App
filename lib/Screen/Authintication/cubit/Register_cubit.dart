import 'dart:async';
class RegisterCubit {
  final _usernameController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  final _confirmPasswordController = StreamController<String>.broadcast();
  final _isValidController = StreamController<bool>.broadcast();
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
  Stream<bool> get isValid => _isValidController.stream;

  String get currentPassword => _password;

  void changeUsername(String value) {
    _username = value;
    _usernameController.sink.add(value);
    _validateInputs();
  }

  void changePassword(String value) {
    _password = value;
    _passwordController.sink.add(value);
    _validateInputs();
  }

  void changeConfirmPassword(String value) {
    _confirmPassword = value;
    _confirmPasswordController.sink.add(value);
    _validateInputs();
  }

  void _validateInputs() {
    final isValid = _username.isNotEmpty &&
                    _password.isNotEmpty &&
                    _confirmPassword.isNotEmpty &&
                    _password == _confirmPassword;
    _isValidController.sink.add(isValid);
  }

  void submit({required Function(String, String) onSuccess, required Function(String) onError}) {
    if (_username.isEmpty || _password.isEmpty || _confirmPassword.isEmpty) {
      onError('Please fill all fields');
    } else if (_password != _confirmPassword) {
      onError('Passwords do not match');
    } else {
      // simulate saving to storage or server
      onSuccess(_username, _password);
    }
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _isValidController.close();
  }
}
