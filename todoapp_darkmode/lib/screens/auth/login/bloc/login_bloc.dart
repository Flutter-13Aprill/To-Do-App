import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_darkmode/screens/auth/auth_services.dart';

part 'login_event.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthServices authService;

  LoginBloc(this.authService) : super(LoginInitial()) {
    on<EmailInput>((event, emit) {
      emit(EmailInputGoesThrough());
    });

    on<PassWordInput>((event, emit) {
      emit(PassWordInputGouesThrough());
    });
on<LoginSubmitted>((event, emit) async {
  emit(LoginLoading());
  try {
    await authService.signInWithEmailPassword(event.email, event.password);
    emit(LoginSuccess());
  } catch (e) {
    emit(LoginFailure(e.toString()));
  }
});


 

  }
}

