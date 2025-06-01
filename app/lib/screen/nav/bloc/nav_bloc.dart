// lib/screen/nav/bloc/nav_bloc.dart
import 'package:app/model/task/task.dart';
import 'package:app/screen/calender/calender_screen.dart';
import 'package:app/screen/index/home_screen.dart';
import 'package:app/screen/profile/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:app/layer_data/app_datat.dart';
import 'dart:developer';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  final List<Widget> screen = [HomeScreen(), CalenderScreen(), ProfileScreen()];
  
  final AppDatatLayer _appDatatLayer = GetIt.I.get<AppDatatLayer>();

  NavBloc() : super(NavInitial(currentIndex: 0, tasks: [])) { // **أعدنا تمرير قائمة مهام فارغة مبدئياً**
    log('NavBloc: تم إنشاء NavBloc.');

    on<NavTabSelected>((event, emit) {
      log('NavBloc: تم استقبال حدث NavTabSelected للاندكس: ${event.newIndex}');
      // عند تغيير التبويبات، نحافظ على الاندكس الجديد ونمرر المهام الحالية
      if (state is NavInitial) {
        emit(NavInitial(currentIndex: event.newIndex, tasks: (state as NavInitial).tasks));
      } else {
        emit(NavInitial(currentIndex: event.newIndex, tasks: [])); // حالة احتياطية
      }
    });

    on<NavFetchTasks>((event, emit) async {
      log('NavBloc: تم استقبال حدث NavFetchTasks. نحاول جلب المهام...');
      try {
        final List<Task> fetchedTasks = await _appDatatLayer.fetchTasks();
        log('NavBloc: تم جلب ${fetchedTasks.length} مهمة بنجاح من AppDatatLayer.');
        
        log('NavBloc: تفاصيل المهام المجلوبة (ستعرض الآن في الشاشة أيضاً):');
        if (fetchedTasks.isEmpty) {
          log('  - لا توجد مهام لهذا المستخدم.');
        } else {
          for (var task in fetchedTasks) {
            log('  - المهمة: ${task.title}, مكتملة: ${task.isCompleted}, تاريخ الاستحقاق: ${task.dueDate}');
          }
        }

        // **هنا هو التعديل:** نقوم بإصدار حالة جديدة تتضمن المهام المجلوبة
        if (state is NavInitial) {
            emit(NavInitial(currentIndex: (state as NavInitial).currentIndex, tasks: fetchedTasks));
        } else {
            // في حال كانت الحالة ليست NavInitial (وهذا نادر بعد التعديلات)، نرجع إلى الحالة الأولية
            emit(NavInitial(currentIndex: 0, tasks: fetchedTasks));
        }

      } catch (e) {
        log('NavBloc: **خطأ فادح أثناء جلب المهام:** $e');
        // في حال وجود خطأ، نصدر الحالة مع قائمة مهام فارغة أو المهام السابقة
        if (state is NavInitial) {
            emit(NavInitial(currentIndex: (state as NavInitial).currentIndex, tasks: (state as NavInitial).tasks ?? []));
        } else {
            emit(NavInitial(currentIndex: 0, tasks: []));
        }
      }
    });
  }
}