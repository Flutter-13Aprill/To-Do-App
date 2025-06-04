import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';

// ignore: must_be_immutable
class PriorityComponent extends StatelessWidget {
  
  PriorityComponent({super.key, required this.numberPriority, required this.getPriority});

  final String numberPriority;
  void Function(String value) getPriority;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getPriority(numberPriority);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppPalette.chipsBackgroundColor
        ),
        child: Column(
      
          children: [
      
            EmptySpace.sizeH8,
      
            SvgPicture.asset('assets/visuals/home/svgs/flag.svg'),
      
             EmptySpace.sizeH8,
      
            Text(numberPriority, style: TextStyles.lato40018,),
      
      
          ],
        ),
      ),
    );
  }
}