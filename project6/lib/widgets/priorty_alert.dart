import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/priority_container.dart';

class PriortyAlert extends StatelessWidget {
  const PriortyAlert({super.key, required this.priority});

  final List<String> priority;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 327.w,
        height: 360.h,
        color: AppColors().alertBackgroundColor,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Text(
                'taskPa'.tr(),
                style: context.bodyM()!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 310.w,
                child: Divider(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(height: 8.h),

              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    final bloc = context.read<HomeBloc>();
                    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( mainAxisSpacing: 8,
                                  childAspectRatio: 2 / 2,
                                  crossAxisSpacing: 8,
                                  crossAxisCount: 4,),
                                    itemCount: bloc.appDataGetIt.priority.length,
                                    itemBuilder: (context, index) {
                                      
                                      return PriorityContainer(priorityNumber: priority[index],isSelect:bloc.isSelect ,onTap: () {
                                        bloc.priorty = priority[index];
                                        
                                        bloc.add(SelectPrioEvent());
                                      },);
                                    },                  
                
                                  
                                );
                  },
                ),
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 143.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(onPressed: () {}, child: Text('cancel').tr()),
                  ),
                  Container(
                    width: 143.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors().buttonColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'createCategory'.tr(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
