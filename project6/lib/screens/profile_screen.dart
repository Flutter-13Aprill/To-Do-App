import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/settings.dart';
import 'package:project6/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('profile'.tr(), style: context.titleM()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Image.asset('assets/images/profile_home.png'),
            ),
            Text('Fahad', style: context.titleM()),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 153.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors().alertBackgroundColor,
                  ),
                  child: Text('leftTask'.tr(), style: context.bodyM()),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 153.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors().alertBackgroundColor,
                  ),
                  child: Text('doneTask'.tr(), style: context.bodyM()),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 327.w,
              height: 48.h,
              child: Text(
                'settings'.tr(),
                style: TextStyle(
                  color: Color.fromARGB(255, 175, 175, 175),
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
            },
              child: SizedBox(width: 327.w, height: 48.h,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,spacing: 8,children: [
              
                Image.asset('assets/icons/setting.png'),
                SizedBox(width: 290,child: Text('appSett').tr(),),
                Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)         
              
              
              ],),),
            ),
             Container(
              alignment: Alignment.centerLeft,
              width: 327.w,
              height: 48.h,
              child: Text(
                'account'.tr(),
                style: TextStyle(
                  color: Color.fromARGB(255, 175, 175, 175),
                  fontSize: 14,
                ),
              ),
            ),
                   SizedBox(width: 327.w, height: 48.h,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,spacing: 8,children: [

              Image.asset('assets/icons/user.png'),
              SizedBox(width: 290,child: Text('changeNameAcc').tr(),),
              Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)         


            ],),),
                   SizedBox(width: 327.w, height: 48.h,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,spacing: 8,children: [

              Image.asset('assets/icons/camera.png'),
              SizedBox(width: 290,child: Text('changeAccImage').tr(),),
              Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)         


            ],),),
                   SizedBox(width: 327.w, height: 48.h,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,spacing: 8,children: [

              Image.asset('assets/icons/logout.png'),
              SizedBox(width: 290,child: Text('appSett'.tr(),style: TextStyle(color: Color.fromARGB(255, 255, 73, 73)),),),


            ],),),
          ],
        ),
      ),
    );
  }
}
