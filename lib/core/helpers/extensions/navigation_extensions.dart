import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  
  void goToWithReplacement({required Widget screen}){
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => screen));
  }
  
  void goTo({required Widget screen}){
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

  void pop() {
    Navigator.pop(this);
  }
}