import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Repo/todo_data.dart';
import 'package:getit/Repo/supabase_model_connect.dart';
import 'package:meta/meta.dart';
import 'package:getit/Models/todo_model.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  var supabase = GetIt.I.get<SupabaseConnect>();
  final categories = GetIt.I.get<TodoData>();
  DateTime selectedDate = DateTime.now();
  DateTime fullDateTime = DateTime.now();
  Category? selectedCategory = Category(
    name: 'Default',
    icon: Icons.category,
    backgroundColor: Colors.blue,
    iconColor: Colors.white,
  );
  String selectedPriority = "";
  TextEditingController todoNameController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  IndexBloc() : super(IndexInitial()) {
    on<IndexEvent>((event, emit) {});
    on<AddToDoButtonPressed>((event, emit) {
      emit(AddTaskDialogShown());
    });
    on<TodoCheckButtonPressed>((event, emit) async {
      if (event.todo.isDone) {
        await supabase.updateToDo(event.todo);
        emit(TodoChecked());
      } else {
        await supabase.updateToDo(event.todo);
        emit(TodoUnchecked());
      }
      supabase.fetchToDos();
      emit(TodosLoaded());
    });
    on<DateSelected>((event, emit) {
      selectedDate = event.selectedDate;
      emit(DateSelectedChanged());
    });
    on<SelectPriority>((event, emit) {
      selectedPriority = event.priority;
      emit(PrioritySelected());
    });
    on<AddTodo>((event, emit) async {
      emit(ToDosLoading());
      ToDoModel todo = ToDoModel(
        userId: supabase.user!.id,
        task: todoNameController.text,
        description: todoDescriptionController.text,
        category: selectedCategory!.name,
        priority: int.tryParse(selectedPriority),
        isDone: false,
        dueDate: fullDateTime.toLocal().toString(),
      );
      await supabase.insertToDo(todo);
      todoNameController.clear();
      todoDescriptionController.clear();
      selectedCategory = Category(
        name: 'Default',
        icon: Icons.category,
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      );

      selectedPriority = "";
      fullDateTime = DateTime.now();
      selectedDate = DateTime.now();

      emit(TodoAdded());
    });
    on<DeleteTodo>((event, emit) async {
      await supabase.deleteToDo(event.todo);

      emit(TodoDeleted());
    });
    on<PopTaskscreen>((event, emit) async {
      await supabase.fetchToDos();
      todoNameController.clear();
      todoDescriptionController.clear();
      selectedCategory = Category(
        name: 'Default',
        icon: Icons.category,
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      );

      selectedPriority = "";
      fullDateTime = DateTime.now();
      selectedDate = DateTime.now();
      Navigator.pop(event.context);
      emit(TaskScreenPopped());
    });
    on<RefreshScreen>((event, emit) {
      emit(StateRefreshed());
    });
    on<EditTodo>((event, emit) async {
      ToDoModel todo = ToDoModel(
        id: event.todo.id,
        userId: supabase.user!.id,
        task: todoNameController.text,
        description: todoDescriptionController.text,
        dueDate: fullDateTime.toLocal().toString(),
        isDone: false,
        category: selectedCategory!.name,
        priority: int.parse(selectedPriority),
      );
      await supabase.updateToDo(todo);
      todoNameController.clear();
      todoDescriptionController.clear();
      selectedCategory = Category(
        name: 'Default',
        icon: Icons.category,
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      );
      selectedPriority = "";
      fullDateTime = DateTime.now();
      selectedDate = DateTime.now();

      emit(TodoEdited());
    });
  }
}
