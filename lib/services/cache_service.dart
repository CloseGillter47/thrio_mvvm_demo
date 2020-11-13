import 'dart:convert' as convert;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_core/locator.dart';

@lazySingleton
class CacheService {
  final _caches = locator<SharedPreferences>();

  void setCaches<T extends CacheData>(T data, {String key}) {
    /// 对象不能为空
    if (data == null) return;
    key ??= data.runtimeType.toString();
    final values = data.toMap();
    String cacheData = convert.json.encode(values);

    _caches.setString(key, cacheData);
  }

  Map getCaches<T extends CacheData>([String key]) {
    key ??= T.toString();

    final values = _caches.getString(key);
    Map cacheData = {};
    if (values != null) {
      cacheData = convert.json.decode(values);
    }

    return cacheData;
  }
}

abstract class CacheData {
  Map toMap();
}
