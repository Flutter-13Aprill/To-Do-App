import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_darkmode/screens/auth/auth_services.dart';

part 'registor_event.dart';
part 'registor_state.dart';

class RegistorBloc extends Bloc<RegistorEvent, RegistorState> {
  final AuthServices authService;

  RegistorBloc(this.authService) : super(RegistorInitial()) {
    on<RegistorSubmitted>((event, emit) async {
      emit(RegistorLoading());

      try {
        await authService.signUpWithEmailPassword(event.email, event.password);
        emit(RegistorSuccess());
      } catch (e) {
        emit(RegistorFailure(e.toString()));
      }
    });
  }
}

