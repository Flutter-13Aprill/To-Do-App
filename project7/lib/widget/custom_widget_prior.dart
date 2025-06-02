import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomWidgetPrior extends StatefulWidget {
  const CustomWidgetPrior({super.key, required this.priorNum});
  final String priorNum;

  @override
  State<CustomWidgetPrior> createState() => _CustomWidgetPriorState();
}

class _CustomWidgetPriorState extends State<CustomWidgetPrior> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },

      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.deepPurple : Color.fromARGB(122, 0, 0, 0),
        ),

        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.flag, color: Colors.white, size: 16),
                  SizedBox(height: 4),
                  Text(widget.priorNum, style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
