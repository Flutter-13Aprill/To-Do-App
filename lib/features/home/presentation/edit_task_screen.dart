import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/data/model/category_model.dart';
import 'package:uptodo/features/home/presentation/widgets/edit_task_attribute.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white,),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [

            Row(
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  fillColor: WidgetStateProperty.all(AppPalette.checkBoxColor),
                  value: true, 
                  onChanged:(value) => true,
                ),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmptySpace.sizeH24,
                    Text('Do Math Homework', style: TextStyles.lato50020,),
                    Text('Do chapter 2 to 5 for next week', style: TextStyles.lato40018,)
                  ],
                ),
        
                Spacer(),
        
                Icon(Icons.edit, color: Colors.white,)
              ],
            ),

            EmptySpace.sizeH48,

            EditTaskAttribute(
              label: 'Task Time', 
              iconPath: 'assets/visuals/home/svgs/timer.svg', 
              rectWidth: context.getWidth(multiplied: 0.3), 
              rectHeight: context.getHeight(multiplied: 0.05),
              attributeLabel: 'Today At 16:45',
            ),

            EmptySpace.sizeH40,

            EditTaskAttribute(
              label: 'Task Category', 
              iconPath: 'assets/visuals/home/svgs/tag.svg', 
              rectWidth: context.getWidth(multiplied: 0.4), 
              rectHeight: context.getHeight(multiplied: 0.05),
              category: CategoryModel(categoryName: 'University', categoryIconPath: 'assets/visuals/category/University.svg',),
            ),

            EmptySpace.sizeH40,

            EditTaskAttribute(
              label: 'Task Priority', 
              iconPath: 'assets/visuals/home/svgs/flag.svg', 
              rectWidth: context.getWidth(multiplied: 0.2), 
              rectHeight: context.getHeight(multiplied: 0.05),
              attributeLabel: 'Default',
            ),

            EmptySpace.sizeH40,

            EditTaskAttribute(
              label: 'Sub - Task', 
              iconPath: 'assets/visuals/home/svgs/hierarchy.svg', 
              rectWidth: context.getWidth(multiplied: 0.3), 
              rectHeight: context.getHeight(multiplied: 0.05),
              attributeLabel: 'Add Sub - Task',
            ),

            EmptySpace.sizeH40,

            Row(
              children: [
                SvgPicture.asset('assets/visuals/home/svgs/trash.svg'),
                EmptySpace.sizeW16,
                Text('Delete Task', style: TextStyles.lato40018.copyWith(color: Colors.red),)
              ],
            )
          ],
        ),
      ),
    );
  }
}