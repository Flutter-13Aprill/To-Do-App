import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
              
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          ),
        ),
        centerTitle: true,
        title: Text('settings',style: context.titleM(),).tr(),
      ),

      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: 327.w,
              height: 48.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Image.asset('assets/icons/brush.png'),
                  SizedBox(width: 290, child: Text('changeAppColor').tr()),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                ],
              ),
            ),
            InkWell(onTap: (){
                 if (context.locale.languageCode == "ar") {
                            context.setLocale(Locale('en', 'US'));
                          } else {
                            context.setLocale(Locale('ar', 'AR'));
                          }
                        
            },
              child: SizedBox(
                width: 327.w,
                height: 48.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Image.asset('assets/icons/user.png'),
                    SizedBox(width: 290, child: Text('changeLang').tr()),
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
