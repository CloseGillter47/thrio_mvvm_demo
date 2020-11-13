import 'package:flutter/cupertino.dart';

class AppTheme extends StatelessWidget {
  final Widget child;
  final AppThemeData data;

  AppTheme({
    this.data,
    this.child,
  }) : super();

  static AppThemeData of(BuildContext context) {
    final _InheritedAppTheme appTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>();

    return appTheme?.theme?.data ?? AppThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(
      theme: this,
      child: child,
    );
  }
}

class AppThemeData extends CupertinoThemeData {
  AppThemeData({
    /// 原始属性
    Color primaryColor,
    Brightness brightness,
    Color barBackgroundColor,
    Color primaryContrastingColor,
    Color scaffoldBackgroundColor,
    CupertinoTextThemeData textTheme,

    /// 扩展属性
    this.red,
  }) : super(
          textTheme: textTheme,
          brightness: brightness,
          primaryColor: primaryColor,
          barBackgroundColor: barBackgroundColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        );

  final Color red;
}

class _InheritedAppTheme extends InheritedWidget {
  final AppTheme theme;

  _InheritedAppTheme({
    Key key,
    this.theme,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme old) =>
      theme.data != old.theme.data;
}
