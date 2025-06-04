import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/theme/app_colors.dart';

class NewCatagoryScreen extends StatelessWidget {
  const NewCatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          child: Text('createCategory'.tr(), style: context.titleM()),
        ),
      ),
      body: Center(
        child: Container(
          width: 320.w,
          height: 850.h,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('catName'.tr(), style: context.bodyM()),
              Container(
                width: 327.w,
                height: 48.h,

                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 32, 32, 32),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: 'catName'.tr(),
                  ),
                ),
              ),
              Text('catIcon'.tr(), style: context.bodyM()),
              Container(
                decoration: BoxDecoration(
                  color: AppColors().alertBackgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 154.w,
                height: 37.h,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'chooseLib'.tr(),
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              Text('catagoryColor'.tr(), style: context.bodyM()),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 201, 204, 65),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 102, 204, 65),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 204, 167),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 129, 204),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 162, 204),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 204, 132, 65),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 151, 65, 204),
                        shape: BoxShape.circle,
                      ),
                    ),  Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 204, 65, 115),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 350.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 154.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('cancel').tr()),
                  ),
                  Container(
                    width: 154.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors().buttonColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'createCategory'.tr(),
                        style: TextStyle(color: Colors.white),
                      ),
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
