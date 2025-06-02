import 'package:flutter/material.dart';
import 'package:project7/widget/custom_widget_prior.dart';

class CustomPrior extends StatelessWidget {
  const CustomPrior({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF363636),

      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            Text(
              "Task Priority",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/images/Divider.png",
              width: 280,
              color: Colors.white,
            ),
            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomWidgetPrior(priorNum: "1"),
                      SizedBox(width: 12),
                      CustomWidgetPrior(priorNum: "2"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "3"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "4"),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      CustomWidgetPrior(priorNum: "5"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "6"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "7"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "8"),
                    ],
                  ),
                  SizedBox(height: 12),

                  Row(
                    children: [
                      CustomWidgetPrior(priorNum: "9"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "10"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "11"),
                      SizedBox(width: 12),

                      CustomWidgetPrior(priorNum: "12"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Color(0xFF363636),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color.fromARGB(255, 136, 117, 255),
                          ),
                        ),
                      ),
                      SizedBox(width: 130),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Color.fromARGB(255, 136, 117, 255),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
