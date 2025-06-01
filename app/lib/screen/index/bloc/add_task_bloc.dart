import 'dart:async';
import 'dart:developer';
import 'package:app/layer_data/auth_layer.dart';
import 'package:app/theme/style_color.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:app/layer_data/app_datat.dart'; // **تم التحديث: استخدام AppDatatLayer**
import 'package:app/model/task/task.dart'; // **تم التحديث: استخدام Task موديل**

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  int count=0;
  final List<IconData> availableIcons = [
    Icons.bakery_dining,
    Icons.work,
    Icons.fitness_center,
    Icons.grid_view,
    Icons.school,
    Icons.campaign,
    Icons.music_note,
    Icons.monitor_heart,
    Icons.videocam,
    Icons.home,
    Icons.add,

    Icons.folder,
    Icons.work,
    Icons.fitness_center,
    Icons.grid_view,
    Icons.school,
    Icons.campaign,
    Icons.music_note,
    Icons.monitor_heart,
  ];

  // قائمة الألوان المتاحة
  final List<Color> availableColors = [
    Color(0xFFC7F3A5),
    Color(0xFFFFA58C),
     Color(0xFF7AFFDC),
     Color(0xFF88D9E1),
    Color(0xff8875FF),
   Color(0xFFFA7FFF),
     Color(0xFFEF90FF),
    Color(0xFF8FFFCD),
    Color(0xff8875FF),
   Color(0xFFF7DD9E),
    Color(0xFF8FFFCD)
  ];
  final AppDatatLayer _appDatatLayer = GetIt.I.get<AppDatatLayer>();
  TextEditingController CatogryNameController = TextEditingController();

  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime datePiked = DateTime.now();

  int currentPriority = 1; // قيمة الأولوية الحالية
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
  String category = "";
  int colorIndex=0;
  int iconColor=0;
  IconData? selectedIcon;
  Color? selectedCategoryColor;
  Color color = Colors.red;
  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskEventt>(addTaskMethod);

    on<TaskPriorityUpdated>((event, emit) {
      currentPriority = event.priority; // تحديث القيمة الداخلية للأولوية
      emit(AddTaskInitial(taskPriority: event.priority)); // تحديث حالة الـ UI
    });
    //CatogryColorEvent
    on<CatogryNameEvent>(catogryNameEventMethod);
    on<CatogryIconEvent>(catogryIconEventMethod);
     on<CreateNewCategoryEvent>(_onCreateNewCategoryEvent);
  }

  FutureOr<void> addTaskMethod(
    AddTaskEventt event,
    Emitter<AddTaskState> emit,
  ) async {
    // يجب أن تكون هذه الشروط قبل emit(AddTaskLoading()) إذا كنت تريد منع التحميل لمدخلات فارغة
    if (taskController.text.trim().isEmpty) {
      emit(AddTaskError(message: "Task title cannot be empty.".tr()));
      return;
    }
    if (descriptionController.text.trim().isEmpty) {
      emit(AddTaskError(message: "Task description cannot be empty.".tr()));
      return;
    }

    emit(AddTaskLoading()); // إصدار حالة التحميل

    try {
      final DateTime finalDateTime = DateTime(
        datePiked.year,
        datePiked.month,
        datePiked.day,
        time.hour,
        time.minute,
      );
      final String? userId = GetIt.I<AuthLayer>().idUser;
      final Task newTask = Task(
        title: taskController.text.trim(),
        description: descriptionController.text.trim(),
        dueDate: finalDateTime.toIso8601String(),
        priority: currentPriority, // استخدام القيمة المحدثة للأولوية
        isCompleted: false,
        createdAt: DateTime.now().toIso8601String(),
        userId: userId,
        catogryName: category,
        catogryColor: colorIndex,
        iconlable: iconColor,
      );

      await _appDatatLayer.addTask(newTask);

      // مسح المدخلات بعد النجاح
      taskController.clear();
      descriptionController.clear();
      datePiked = DateTime.now();
      time = const TimeOfDay(hour: 10, minute: 30);
      currentPriority = 1; // إعادة تعيين الأولوية الافتراضية

      emit(TaskAddedState(taskTitle: newTask.title)); // إصدار حالة النجاح
    } catch (e) {
      emit(AddTaskError(message: e.toString())); // إصدار حالة الخطأ
      debugPrint('Error adding task in AddTaskBloc: $e');
    }
  }

  @override
  Future<void> close() {
    taskController.dispose();
    descriptionController.dispose();
    return super.close();
  }

  FutureOr<void> catogryNameEventMethod(
    CatogryNameEvent event,
    Emitter<AddTaskState> emit,
  ) {
    category = event.name;
    emit(CatogryNameState(name: event.name,));
  }

  FutureOr<void> catogryIconEventMethod(
    CatogryIconEvent event,
    Emitter<AddTaskState> emit,
  ) {
    selectedIcon = event.iconName;
    iconColor= event.indexIcon;
    emit(CatogryIconState(iconName: event.iconName, indexIcon: event.indexIcon));
  }

   

  FutureOr<void> _onCreateNewCategoryEvent(
    CreateNewCategoryEvent event,
    Emitter<AddTaskState> emit,
  ) async {
    if (category.trim().isEmpty || selectedIcon == null || color == null) {
      emit(
        AddTaskError(
          message: "Please fill all fields and select icon/color".tr(),
        ),
      );
      return;
    }

    emit(
      AddTaskLoading(),
    ); // أو CategoryCreationLoading إذا أضفتها كحالة منفصلة

    try {
      // هنا تضع منطق حفظ الفئة الجديدة في قاعدة البيانات أو أي مكان تخزين
      // مثال (تحتاج لتعديله بما يناسب AppDatatLayer و موديل الفئة الخاص بك):
      // final Category newCategory = Category(
      //   name: _categoryName,
      //   icon: _selectedCategoryIcon!,
      //   color: _selectedCategoryColor!,
      // );
      // await _appDatatLayer.addCategory(newCategory);

      log(
        'New Category Created: Name: $category, Icon: $selectedIcon, Color: $color',
      );

      // مسح الاختيارات بعد الإنشاء بنجاح وإعادة البلوك لحالة نظيفة
      CatogryNameController.clear();

      emit(CategoryCreatedSuccessfully(categoryName: category));
      // أعد إلى حالة Initial بعد النجاح لتجهيز الـ BLoC لعملية جديدة
      //emit(AddTaskInitial(taskPriority: currentPriority));
    } catch (e) {
      emit(
        AddTaskError(message: e.toString()),
      ); // أو CategoryCreationError إذا أضفتها
      debugPrint('Error creating category in AddTaskBloc: $e');
    }
  }
}
