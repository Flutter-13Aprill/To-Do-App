part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class Regester extends LogInEvent{
  final String email ; 
  final String password;
  final String conformPassword;

  Regester({required this.email, required this.password, required this.conformPassword});

}

class Login extends LogInEvent{
  final String email ; 
  final String Password;

  Login({required this.email, required this.Password}); 
}