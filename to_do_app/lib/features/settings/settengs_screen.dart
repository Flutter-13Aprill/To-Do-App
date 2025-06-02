import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettengsScreen extends StatelessWidget {
  const SettengsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(centerTitle: true,title: 
    Text('home'),),
    body: SafeArea(child: 
    Padding(padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 1),vertical: context.getShortest(per: 1)),
    child:Column(children: [

    
    
    
    
    
    
    ],) ,
    ))
    );
  }
}