part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class Regesterstatesucsses extends LogInState{
  
 
}

final class RegesterstateFaild extends LogInState{

}

final class Regesterstateloding extends LogInState{

}

final class Loginfaildstate extends LogInState{

}

final class Loginstateloding extends LogInState{

}
final class Loginsucsses extends LogInState{
  
 
}



