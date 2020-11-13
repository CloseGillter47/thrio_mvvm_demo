import 'package:flutter/material.dart';

import 'app.dart';
import '_core/locator.dart';
import 'widgets/zutils.dart';

void main() async {
  /// 初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 统一 Android 状态栏
  setAndroidStatusBar();

  await setupLocator();

  runApp(App());
}
