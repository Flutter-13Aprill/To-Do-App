import 'package:flutter/material.dart';

extension AppSize on BuildContext {
  getHight({double num = 1}) {
    return MediaQuery.sizeOf(this).height * num;
  }

  getWight({double num = 1}) {
    return MediaQuery.sizeOf(this).width * num;
  }
}
