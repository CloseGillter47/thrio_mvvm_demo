import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void setAndroidStatusBar() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000),
    ));
  }

  /// 禁止横屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class ZRoute {
  ZRoute._internal() {
    _init();
  }

  List<String> list;

  void _init() {
    list = [];
  }

  static ZRoute _singleton = ZRoute._internal();

  factory ZRoute() => _singleton ?? ZRoute._internal();

  void update(String val) {
    print('>>>>>>>>>>>>>>>>>>>>>>> $list ------>>>$val');
    list.add(val);
  }
}
