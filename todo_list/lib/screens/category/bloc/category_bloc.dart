import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/style/app_colors.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  List<Color> colorsList = [
    AppColors.blue,
    AppColors.lightBlue,
    AppColors.teal,
    AppColors.green,
    AppColors.violet,
    AppColors.yellowGreen,
    AppColors.pink,
    AppColors.orange,
  ];

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {});
  }
}
