import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/theme/app_palette.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controllers, required this.text, required this.labelText,required this.textFontsize, required this.hintsize, required this.labelsize, required this.fillcolor, required this.borderColor, required this.textColor, this.condition,  this.isobscure =false, required this.hintColor, this.onchanged, });
  final TextEditingController controllers ;
  final String text;
final String labelText;
final double textFontsize;
final double hintsize;
final double labelsize;
final Color fillcolor;
final Color borderColor;
final Color textColor;
final Color hintColor;
final bool isobscure;
final FormFieldValidator<String>? condition ;
final ValueChanged<String?>? onchanged;
  @override
  Widget build(BuildContext context) {
    return Column (mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(labelText,style: TextStyle(color: textColor,fontSize:labelsize )),
        ),
        TextFormField(style: TextStyle(color: textColor,fontSize: textFontsize),obscureText:  isobscure ? true:false  ,
        controller: controllers ,
        decoration: InputDecoration( floatingLabelBehavior: FloatingLabelBehavior.always, filled: true,fillColor: fillcolor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(context.getShortest(per: 0.1)),
          borderSide: BorderSide(color: borderColor, width: 2)),
          hintStyle: TextStyle(color: hintColor,fontSize: hintsize),
          hintText: text,
        ),
          
          validator: condition,onChanged:onchanged ?? (value) {},),
      ],
    );
  }
}
