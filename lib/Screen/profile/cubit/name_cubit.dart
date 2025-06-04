import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameCubit extends Cubit<String> {
  UserNameCubit() : super("Fahad");

  void updateName(String newName) => emit(newName);
}
