import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(centerTitle: true,title: 
    Text('Profile'),),
    body: SafeArea(child: 
    Padding(padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.10),vertical: context.getShortest(per: 1)),
    child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Center(child: CircleAvatar(backgroundImage: AssetImage('assets/images/profile.png'),)),
Center(child: Text('Ahmed',style: TextStyle(fontSize: context.getShortest(per: 0.7)),)),
SizedBox(height: context.getShortest(per: 0.7),),
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(width: 100 ,height: 50, child: Text('10 Task left'),),Container(width: 100 ,height: 50 ,child: Text('5 Task done'),)],),
Text('settings',style: TextStyle(fontSize: context.getShortest(per: 0.4)),),
ListTile(leading: Icon(Icons.settings),title: Text('App Settings',style: TextStyle(color: AppPalette.textColor,)),trailing: Icon(Icons.arrow_forward_ios),),
Text('Account',style: TextStyle(fontSize: context.getShortest(per: 0.4)),),
ListTile(leading: Icon(Icons.person),title: Text('Change account name',style: TextStyle(color: AppPalette.textColor,)),trailing: Icon(Icons.arrow_forward_ios),),
ListTile(leading: Icon(Icons.photo_camera),title: Text('Change account password',style: TextStyle(color: AppPalette.textColor,)),trailing: Icon(Icons.arrow_forward_ios),),
ListTile(leading: Icon(Icons.logout_outlined,color: Colors.red,),title: Text('Log out',style: TextStyle(color: Colors.red,)),trailing: Icon(Icons.arrow_forward_ios),)

    
    
    
    
    
    ],) ,
    ))
    );
  }
}