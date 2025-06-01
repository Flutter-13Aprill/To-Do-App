import 'package:app/screen/nav/bloc/nav_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BotomNavBarScreen extends StatelessWidget {
  const BotomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) {
        final navBloc = NavBloc(); // قومي بإنشاء NavBloc
        navBloc.add(NavFetchTasks()); // **ثم قومي بإرسال الحدث لجلب المهام هنا!**
        return navBloc; // وأرجعي الـ Bloc الذي تم إنشاؤه
      },
      
      child: BlocBuilder<NavBloc, NavState>( // استخدم BlocBuilder للاستماع إلى تغييرات الحالة
        builder: (context, state) { // state هو الآن حالة NavState
          final bloc = context.read<NavBloc>();
          int currentIndex = 0;

          if (state is NavInitial) { // تأكد من أننا نتعامل مع حالة NavInitial
            currentIndex = state.currentIndex;
          }

          return Scaffold(
            // عرض الشاشة بناءً على الاندكس الحالي من الـ Bloc
            body: bloc.screen[currentIndex], 
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex, // ربط الاندكس الحالي بالـ Bloc
              onTap: (index) {
                // عند النقر على أيقونة، أرسل حدث NavTabSelected مع الاندكس الجديد
                bloc.add(NavTabSelected(index)); 
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home), // استخدم const لتحسين الأداء
                  label: "Index".tr(), // تم تغييرها إلى "Index" لتتناسب مع الصورة
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.calendar_month_rounded), // استخدم const لتحسين الأداء
                  label: "Calendar".tr(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_4_outlined), // استخدم const لتحسين الأداء
                  label: "Profile".tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}