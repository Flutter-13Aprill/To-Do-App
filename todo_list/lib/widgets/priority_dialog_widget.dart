import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class PriorityDialogWidget extends StatelessWidget {
  const PriorityDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int? selectedPriority;

    return AlertDialog(
      backgroundColor: const Color(0xFF2C2C2C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: Text(
          'task_priority'.tr(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: BlocBuilder<IndexBloc, IndexState>(
          builder: (context, state) {
            final bloc = context.read<IndexBloc>();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(color: Colors.grey[700]),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    int number = index + 1;
                    final isSelected = bloc.selectedPriority == number;

                    return GestureDetector(
                      onTap: () {
                        selectedPriority = number;

                        bloc.add(PrioritySelectedEvent(number));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.lightPurole
                                  : AppColors.ultraDarkGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$number',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.getWidth(factor: 0.34),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "cancel".tr(),
                  style: const TextStyle(color: AppColors.lightPurole),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPurole,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(context.getWidth(factor: 0.34), 48),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "save".tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
