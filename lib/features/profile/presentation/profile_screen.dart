import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/profile/presentation/widgets/profile_task_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('profile_screen.app_bar_title')),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        width: context.getWidth(),
        child: Column(
          children: [

            EmptySpace.sizeH24,

            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/visuals/profile/profile.png'),
            ),

            Text('Mohammed', style: TextStyles.lato50020,),

            EmptySpace.sizeH24,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileTaskContainer(label: tr('profile_screen.task_left',args: ['5'])),
                ProfileTaskContainer(label: tr('profile_screen.task_left',args: ['5'])),
              ],
            ),

            EmptySpace.sizeH24,

            Align(
              alignment: Alignment.centerLeft,
              child: Text(tr('profile_screen.settings'), style: TextStyles.lato40014,)
            ),

            ListTile(
              leading: SvgPicture.asset('assets/visuals/profile/setting-2.svg'),
              title: Text(tr('profile_screen.app_settings'), style: TextStyles.lato40018,),
              trailing: Icon(Icons.keyboard_arrow_right_outlined,size: 30, color: Colors.white,),
            ),
            
            EmptySpace.sizeH24,

            Align(
              alignment: Alignment.centerLeft,
              child: Text(tr('profile_screen.account'), style: TextStyles.lato40014,)
            ),

            ListTile(
              leading: SvgPicture.asset('assets/visuals/profile/user.svg'),
              title: Text(tr('profile_screen.change_account_name'), style: TextStyles.lato40018,),
              trailing: Icon(Icons.keyboard_arrow_right_outlined,size: 30, color: Colors.white,),
            ),

            EmptySpace.sizeH16,

            ListTile(
              leading: SvgPicture.asset('assets/visuals/profile/camera.svg'),
              title: Text(tr('profile_screen.change_account_image'), style: TextStyles.lato40018,),
              trailing: Icon(Icons.keyboard_arrow_right_outlined,size: 30, color: Colors.white,),
            ),
            
            EmptySpace.sizeH16,
            
            ListTile(
              leading: SvgPicture.asset('assets/visuals/profile/logout.svg'),
              title: Text(tr('profile_screen.log_out'), style: TextStyles.lato40018.copyWith(color: Colors.red),),
            ),

          ],
        ),
      ),
    );
  }
}