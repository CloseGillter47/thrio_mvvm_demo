import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'bootstrap.dart' as bootstrap;

Future<void> main() async {
  FlutterError.onError = (details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  runZoned<void>(bootstrap.main);
}

@pragma('vm:entry-point')
Future<void> biz1() async {
  FlutterError.onError = (details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  runZoned<void>(bootstrap.biz1);
}

@pragma('vm:entry-point')
Future<void> biz2() async {
  FlutterError.onError = (details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  runZoned<void>(bootstrap.biz2);
}
