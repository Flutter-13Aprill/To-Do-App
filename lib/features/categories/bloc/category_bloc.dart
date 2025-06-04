import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/categories/models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final List<CategoryModel> _categories = [];

  CategoryBloc() : super(CategoryInitial()) {
    on<LoadCategoriesEvent>(_onLoad);
    on<AddCategoryEvent>(_onAdd);
  }

  void _onLoad(LoadCategoriesEvent event, Emitter<CategoryState> emit) {
    emit(CategoryLoading());
    emit(CategoryLoaded(_categories));
  }

  void _onAdd(AddCategoryEvent event, Emitter<CategoryState> emit) {
    _categories.add(event.category);
    emit(CategoryLoaded(List.from(_categories)));
  }
}
