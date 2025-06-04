import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/layer_data/app_data.dart';
import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/utils/getit/setup.dart';

class CardIconWidget extends StatelessWidget {
  const CardIconWidget({
    super.key,
    required this.index,
    required this.isLasIndex,
    required this.priority, this.category,
  });
  final int? index;
  final bool isLasIndex;
  final int? priority;
  final CategoryModel? category;
  @override
  Widget build(BuildContext context) {
    final formService = GetIt.I<FormService>();
print(category);
    if (isLasIndex) {
      return InkWell(
        onTap: () {
          print("add");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 21),
              width: context.getWight(pre: 0.16),
              height: context.getHight(pre: 0.06),
              color: AppColors.textHint,
              child: Icon(Icons.add),
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          if (category != null) {
            formService.categoryId = category!.id!;
          } else {
            formService.priority = priority!;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.getWight(pre: 0.16),
              height: context.getHight(pre: 0.06),
              color: category != null
                  ?category!.color
                  : AppColors.textHint,
              child:
              //  category != null
              //     ? category!.icon:
                   Icon(Icons.flag_circle_outlined),
            ),
            Text(
              "${category != null ? category!.name : priority!}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    }
  }
}
