import 'package:flutter/material.dart';

extension Theming on BuildContext{


 TextStyle? titleL(){
  return Theme.of(this).textTheme.titleLarge;
}
 TextStyle? titleM(){
  return Theme.of(this).textTheme.titleMedium;
}
 TextStyle? bodyM(){
  return Theme.of(this).textTheme.bodyMedium;
}
}