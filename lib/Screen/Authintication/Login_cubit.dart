import 'package:rxdart/rxdart.dart';

class LoginCubit {
  // Controllers
  final _usernameController = BehaviorSubject<String>.seeded('');
  final _passwordController = BehaviorSubject<String>.seeded('');
  final _isValidController = BehaviorSubject<bool>.seeded(false);

  // Expose streams
  Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<bool> get isValid => _isValidController.stream;

  // Sink functions
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Store latest values
  String _username = '';
  String _password = '';

  LoginCubit() {
    Rx.combineLatest2(
      _usernameController.stream,
      _passwordController.stream,
      (String username, String password) {
        _username = username;
        _password = password;

        final isFormValid = username.isNotEmpty && password.isNotEmpty;
        _isValidController.sink.add(isFormValid);
        return isFormValid;
      },
    ).listen((_) {});
  }

  // Submit method
  void submit({
    required void Function(String username, String password) onSuccess,
    required void Function(String error) onError,
  }) {
    if (_username.isEmpty || _password.isEmpty) {
      onError('Please fill all fields');
      return;
    }

    // You can plug in authentication logic here
    onSuccess(_username, _password);
  }

  // Dispose method
  void dispose() {
    _usernameController.close();
    _passwordController.close();
    _isValidController.close();
  }
}
