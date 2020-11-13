import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_stacked_demo/_core/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrio/thrio.dart';

import '../../plugins/i18n.dart';

class SplashViewModel extends BaseViewModel {
  int counter = 5;

  Timer _timer;

  Future init() async {
    _counting();
  }

  /// 启动屏倒计时
  void _counting() {
    counter = 5;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      print(counter);
      if (counter > 0) {
        counter -= 1;
        notifyListeners();
      } else {
        _timer.cancel();
        _timer = null;

        ThrioNavigator.push(url: '/biz1/flutter1');
      }
    });
  }

  void toggle(BuildContext context) {
    Locale target;
    Locale _lang = Localizations.localeOf(context);
    print(_lang);
    if (_lang.toString() == 'zh_CN') {
      target = Locale('en', 'US');
    } else {
      target = Locale('zh', 'CN');
    }
    I18n.onLocaleChanged(target);
  }

  /// 被销毁前
  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;

    super.dispose();
  }
}
