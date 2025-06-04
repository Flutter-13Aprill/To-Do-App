import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/repo/supabase.dart';
import 'package:to_do_app/features/layer_data/app_data.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
   
    on<StartLoadEvent>((event, emit) async {
       final tokenUser =
        SupabaseConnect.supabase?.client.auth.currentSession?.accessToken;
      try {
        if (tokenUser != null) {
          await GetIt.I.get<AppDataLayer>();
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
