// app/screen/index/widget/container/Container_flag.dart
import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

class ContainerFlag extends StatelessWidget {
   final int number; //
  final bool isSelected; 
  final VoidCallback onTap;  

  const ContainerFlag({ // استخدام const constructor لتحسين الأداء
    super.key,
    required this.number,
    required this.isSelected, // <--- أصبح مطلوبًا
    required this.onTap,      // <--- أصبح مطلوبًا
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( // <--- استخدام InkWell لجعل الـ Container قابلاً للنقر
      onTap: onTap, // <--- استدعاء الدالة الممررة عند النقر
      child: Container(
        // تم إزالة width و height الثابتين للسماح لـ GridView بالتحكم في الحجم
        // color: StyleColor.primaryPurpulColor, // <--- سيتم استبدالها بـ decoration
        
        // <--- هنا التعديل على لون الخلفية والحدود
        decoration: BoxDecoration(
          color: isSelected // <--- اللون يعتمد على isSelected
              ? StyleColor.primaryPurpulColor // اللون البنفسجي إذا كان مختارًا
              : StyleColor.primaryBlackColor, // اللون الأسود إذا لم يكن مختارًا (مثل الصورة)
          borderRadius: BorderRadius.circular(8.0), // حواف مدورة
          border: Border.all( // حدود خفيفة كما في الصورة
            color: StyleColor.primaryWhitelColor.withOpacity(0.2), 
            width: 1.0,
          ),
        ),
        // <--- نهاية التعديل على لون الخلفية والحدود
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى عموديًا
          children: [
            Icon(
              Icons.flag_rounded, // أيقونة العلم (فضلت rounded لأنها أقرب للصورة)
              color: StyleColor.primaryWhitelColor, // لون العلم أبيض
              size: 24, // حجم الأيقونة
            ),
            Text(
              '$number', // عرض الرقم
              style:  Theme.of(context).textTheme.titleMedium
            ),
          ],
        ),
      ),
    );
  }
}