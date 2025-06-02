import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonColor,required this.borderColor,required this.textColor,required this.text,required this.fontSize, required this.onTap, required this.fontWeight});
final GestureTapCallback onTap;
final Color buttonColor;
final Color borderColor;
final Color textColor;
final String text;
final double fontSize;
final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: onTap,
child: 
Container(height:context.getShortest(per: 1) ,
                            padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.5)),
                            alignment: Alignment.center,
                           decoration: BoxDecoration(color: buttonColor,border: Border.all(color: borderColor),borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 0.14)))),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: fontWeight,
                                fontSize: fontSize,),),),
);
  }
}