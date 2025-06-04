import 'package:flutter/material.dart';
import 'package:todoapp/theems/colors.dart';

class RowSetteing extends StatefulWidget {
  final IconData iconprofile;
  final String text;
  const RowSetteing({super.key, required this.iconprofile, required this.text});

  @override
  State<RowSetteing> createState() => _RowSetteingState();
}

class _RowSetteingState extends State<RowSetteing> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.iconprofile, color: MyAppColor.white),
        SizedBox(width: 10),
        Text(
          widget.text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: MyAppColor.white),
      ],
    );
  }
}
