import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/layers/AppModel.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  final layedData = GetIt.I.get<AppModelLayer>();
  bool isChecked = false;


  IndexBloc() : super(IndexInitial()) {
    on<IndexEvent>((event, emit) {
      print(AppModelLayer().tasks[0].taskName);
    });
  }
}
