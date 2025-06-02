import 'package:flutter/material.dart';

extension Screen on BuildContext {
  double getWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }
}
