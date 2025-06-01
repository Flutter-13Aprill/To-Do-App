

import 'package:flutter/material.dart';

extension Screen on BuildContext{
  double getWidth(){
     return MediaQuery.sizeOf(this).width;
  }
    double getHeigth(){
     return MediaQuery.sizeOf(this).height;
  }

}