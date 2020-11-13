import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Android 沉浸式
void setAndroidStatusBar() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000),
    ));
  } else if (Platform.isIOS) {}
}
