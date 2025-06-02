import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/index/widgets/date_widget/calander_content.dart';

class CategoryDialog extends StatelessWidget {
  final List<Category> categories;
  final void Function(Category) onCategorySelected;
  final VoidCallback onCreateNew;

const CategoryDialog({super.key, 
  required this.categories,
  required this.onCategorySelected,
  required this.onCreateNew,
});



  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF2D2D2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Choose Category", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(color: Colors.white30),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...categories.map((cat) => GestureDetector(
                  onTap: () => onCategorySelected(cat),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cat.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat.icon, color: cat.color, size: 30),
                        SizedBox(height: 6),
                        Text(cat.title, style: TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    ),
                  ),
                )),
          
                GestureDetector(
                  onTap: onCreateNew,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.teal, size: 30),
                        SizedBox(height: 6),
                        Text("Create New", style: TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: onCreateNew,
              child: Text("Add Category",style: TextStyle(color: AppPalette.textColor,),
            ))
          ],
        ),
      ),
    );
  }
}
