import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui show Window;

class Dpx {
  Dpx._internal() {
    width = 750;
    height = 1624;
    allowFontScaling = false;
    _init();
  }

  static Dpx _singleton = new Dpx._internal();

  factory Dpx() => _it();

  static Dpx _it() {
    if (_singleton._window.physicalSize == Size.zero) {
      _singleton = new Dpx._internal();
    }

    return _singleton;
  }

  ui.Window _window;

  double width;
  double height;
  bool allowFontScaling;

  /// 像素密度
  static double _pixelRatio;
  static double _screenWidth;
  static double _screenHeight;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;

  void _init() {
    _window = WidgetsFlutterBinding.ensureInitialized().window;
    _pixelRatio = _window.devicePixelRatio;
    _screenWidth = _window.physicalSize.width;
    _screenHeight = _window.physicalSize.height;
    _statusBarHeight = _window.padding.top;
    _bottomBarHeight = _window.padding.bottom;
    _textScaleFactor = _window.textScaleFactor;
  }

  /// 设备的像素密度
  static double get pixelRatio => _pixelRatio;

  /// 当前设备宽度 dp
  static double get dpWidth => _screenWidth / _pixelRatio;

  ///当前设备高度 dp
  static double get dpHeight => _screenHeight / _pixelRatio;

  /// 状态栏高度 dp 刘海屏会更高
  static double get dpStatusBarHeight => _statusBarHeight / _pixelRatio;

  /// 底部安全区距离 dp
  static double get dpBottomBarHeight => _bottomBarHeight / _pixelRatio;

  /// 当前设备宽度 px
  static double get pxWidth => _screenWidth;

  /// 当前设备高度 px
  static double get pxHeight => _screenHeight;

  /// 实际的 dp 与UI设计 px 的比例
  num get scaleWidth => dpWidth / _singleton.width;

  /// 实际的 dp 与UI设计 px 的比例
  num get scaleHeight => dpHeight / _singleton.height;

  /// 根据UI设计的设备宽度适配
  num wpx(num size) => size * scaleWidth;

  /// 根据UI设计的设备高度适配
  num hpx(num size) => size * scaleHeight;

  /// 字体大小适配方法
  /// @param [fontSize] UI设计上字体的大小,单位px.
  spx(num fontSize) => allowFontScaling ? wpx(fontSize) : wpx(fontSize) / _textScaleFactor;
}

/// 默认测量工具
Dpx dP = Dpx();
