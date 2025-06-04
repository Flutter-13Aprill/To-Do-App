import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/core/di/locetor.dart';
import 'package:todoapp/repo/authrepo.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final auth = locetor<Authrepo>();
  LogInBloc() : super(LogInInitial()) {
    on<Regester>(regesterbloc);
    on<Login>(loginbloc);
  }

  FutureOr<void> regesterbloc(Regester event, Emitter<LogInState> emit) async {
    emit(Regesterstateloding());
    await auth!.registeruser(event.password, event.email);
    emit(Regesterstatesucsses());
  }

  FutureOr<void> loginbloc(Login event, Emitter<LogInState> emit) async {
    emit(Loginstateloding());
    await auth!.login(event.Password, event.email);
    emit(Loginsucsses());
  }
}
