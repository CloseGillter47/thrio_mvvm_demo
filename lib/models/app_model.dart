import 'package:flutter/cupertino.dart';

import '../services/cache_service.dart';

class AppModel extends CacheData {
  AppModel({this.language});

  AppModel.forJson(Map json) {
    if (json['language'] != null && json['language'] is String) {
      final langs = json['language'] as String;
      if (langs.isNotEmpty) {
        String a = langs.split('_')[0];
        String b = langs.split('_')[1];
        language = Locale(a, b);
      }
    }
  }

  Locale language = Locale('zh', 'CN');

  @override
  Map toMap() {
    return {
      "language": language.toString(),
    };
  }
}
