import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/theme/app_colors.dart';

class TasksOnOpen extends StatelessWidget {
  const TasksOnOpen({
    super.key,
    required this.setIcon,
    required this.setText,
    required this.setContainer,
    this.setContainerIcon,
    this.onPressed,
  });

  final String setIcon;
  final String setText;
  final String setContainer;
  final String? setContainerIcon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(spacing: 8,
            children: [
              Image.asset('assets/icons/$setIcon.png'),
              Container(
                width: 200.w,
                child: Text(setText, style: context.bodyM()),
              ),
            ],
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().alertBackgroundColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextButton(
                onPressed: onPressed,
                child:
                    setContainerIcon != ''
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Image.asset('assets/icons/$setContainerIcon.png'),
                            Text(
                              setContainer,
                              style: context.bodyM()!.copyWith(fontSize: 12),
                            ),
                          ],
                        )
                        : Text(
                          setContainer,
                          style: context.bodyM()!.copyWith(fontSize: 12),
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
