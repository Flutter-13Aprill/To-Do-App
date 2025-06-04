import 'package:flutter/material.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/widgets/mainButton_widget.dart';

class HandelButtons extends StatelessWidget {
  const HandelButtons({
    super.key,
    required this.isTowButton,
    required this.isCategory,
    required this.onTap1,
    this.onTap2,
    required this.titleB1,
    this.titleB2,
  });
  final bool isTowButton;
  final bool isCategory;
  final String titleB1;
  final String? titleB2;
  final Function onTap1;
  final Function? onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainButtonWidget(
          onTap: onTap1,
          text: titleB1,
          width: isTowButton ? 120 : context.getWight(pre: 0.7),isBack: isTowButton? true:false,
        ),
        if (isTowButton)
          MainButtonWidget(onTap: onTap2!, text: titleB2!, width: 120 ),
      ],
    );
  }
}
