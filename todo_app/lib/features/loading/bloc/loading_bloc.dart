import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/layer_data/app_data.dart';
import 'package:todo_app/repo/supabase.dart';
part 'loading_event.dart';
part 'loading_state.dart';

/// Bloc responsible for managing the app's initial loading process.
class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    final tokenUser =
        SupabaseConnect.supabase?.client.auth.currentSession?.accessToken;
    on<StartLoadEvent>((event, emit) async {
      try {
        if (tokenUser != null) {
          await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
          emit(SuccessState());
        } else {
          emit(ErrorState());
        }
      } catch (_) {
        emit(ErrorState());
      }
    });
  }
}
