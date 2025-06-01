part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}
class NavTabSelected extends NavEvent {
  final int newIndex; // الاندكس الجديد للعلامة التبويب المختارة

  NavTabSelected(this.newIndex);
}

class NavFetchTasks extends NavEvent {}  // حدث جديد لتحميل المهام
