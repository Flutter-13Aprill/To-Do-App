import 'package:flutter/material.dart';

extension Navigation on BuildContext{
   void customPushReplacement(Widget path) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => path));
  }

  void customPush(Widget path) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => path));
  }

  void customPop() {
    Navigator.pop(this);
  }

}