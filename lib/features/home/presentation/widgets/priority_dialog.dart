import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/navigation_extensions.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/presentation/widgets/priority_component.dart';

// ignore: must_be_immutable
class PriorityDialog extends StatelessWidget {
  
  PriorityDialog({super.key, required this.getPriority});

  void Function(String value) getPriority;

  @override
  Widget build(BuildContext context) {
   return Dialog(
      child: Container(
        width: context.getWidth(),
        height: context.getHeight(multiplied: 0.44),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppPalette.primaryBackgroundColor,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              EmptySpace.sizeH16,

              Text(
                tr('home_screen.task_priority'),
                style: TextStyles.lato40018.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              Divider(thickness: 2, color: AppPalette.dividerColor),

              EmptySpace.sizeH16,

              Wrap(
                runSpacing: 16,
                spacing: 16,
                children: List.generate(10, (index) {
                  return PriorityComponent(
                    numberPriority: (index + 1).toString(),
                    getPriority:(value) {
                      getPriority(value);
                    },
                  );
                }),
              ),

              EmptySpace.sizeH24,

              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => context.pop(),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.zero,
                        ),
                      ),

                      child: Text(
                        'Cancel',
                        style: TextStyles.lato40018.copyWith(
                          color: AppPalette.textBottomColor,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text('Save'),
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