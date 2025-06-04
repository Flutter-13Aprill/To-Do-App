import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/tasks_on_open.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(8),
        leading: UnconstrainedBox(
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: AppColors().alertBackgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: Colors.grey),
            ),
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: AppColors().alertBackgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.repeat, color: Colors.grey),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.h,),
            Row(
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  value: false,
                  onChanged: (value) {},
                ),
                Container(
                  width: 270.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Do Math Homework'),
                      Text('Do chapter 2 to 5 for next week'),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Image.asset('assets/icons/edit.png'),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            TasksOnOpen(
              setIcon: 'timer',
              setText: 'taskTime'.tr(),
              setContainer: 'Today At 16:45',
              setContainerIcon: '',
            ),
            TasksOnOpen(
              setIcon: 'tag',
              setText: 'taskCat'.tr(),
              setContainer: 'university'.tr(),
              setContainerIcon: 'graduate',
            ),
            TasksOnOpen(
              setIcon: 'flag',
              setText: 'taskPar'.tr(),
              setContainer: 'setContainer'.tr(),
              setContainerIcon: '',
            ),
            TasksOnOpen(
              setIcon: 'hierarchy',
              setText: 'sub'.tr(),
              setContainer: 'addSub'.tr(),
              setContainerIcon: '',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  spacing: 8,
                  children: [
                    Image.asset('assets/icons/trash.png'),
                    Container(
                      child: Text(
                        'deleteTask'.tr(),
                        style: context.bodyM()!.copyWith(
                          color: Color.fromARGB(255, 255, 73, 73),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 225.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors().buttonColor,
              ),
              width: 327.w,
              height: 48.h,
              child: TextButton(
                //need implemented to save task for supabase
                onPressed: () {},
                child: Text('editTask'.tr(), style: context.titleM()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
