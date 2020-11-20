import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:my_stacked_demo/pages/home/pages/info/info.dart';
import 'package:thrio/thrio.dart';
import 'package:stacked_services/stacked_services.dart';

import '../_core/locator.dart';
import '../pages/404/view.dart';
import '../pages/main/main.dart';
import '../routes/router.dart';
import '../widgets/utils.dart';

Widget dispatchRoute(RouteSettings settings) {
  print('🙃 ----------------------------------------------');
  print(settings.name);
  print(settings.index);
  print(settings.params);
  print('🙂 ----------------------------------------------');

  /// 暂时放这里，后续请挪走
  setAndroidStatusBar();

  return WillPopScope(
    onWillPop: () async {
      final nav = locator<NavigationService>().navigatorKey;
      final canPop = nav.currentState.canPop();

      if (canPop) nav.currentState.pop();

      return !canPop;
    },
    child: CupertinoTabView(
      navigatorKey: locator<NavigationService>().navigatorKey,
      routes: {
        "/": (c) => MainPage(),
      },
      onUnknownRoute: (s) => CupertinoPageRoute(builder: (c) => Page404()),
    ),
  );
}

class Module with ThrioModule, ModulePageBuilder, ModulePageObserver, ModuleRouteTransitionsBuilder, NavigatorPageObserver {
  Widget app;

  /// 主模块路由分发
  Widget _dispatch(RouteSettings settings) {
    print('🙃 ----------------------------------------------');
    print(settings.name);
    print(settings.index);
    print(settings.params);
    print('🙂 ----------------------------------------------');
    return NavigatorPages();
  }

  @override
  void onPageBuilderRegister() {
    /// 注册 [flutter] 端主路由
    registerPageBuilder('/flutter/index', _dispatch);

    // registerPageBuilder('/flutter/index/home/info', dispatchRoute);

    // registerPageBuilder(
    //   '/biz1/flutter1',
    //   (settings) => Page1(
    //     index: settings.index,
    //     params: settings.params,
    //   ),
    // );

    // registerPageBuilder(
    //   '/biz2/flutter2',
    //   (settings) => Page2(
    //     index: settings.index,
    //     params: settings.params,
    //   ),
    // );

    // registerPageBuilder(
    //   '/biz1/flutter3',
    //   (settings) => Page3(
    //     index: settings.index,
    //     params: settings.params,
    //   ),
    // );
    // registerPageBuilder(
    //   '/biz2/flutter4',
    //   (settings) => Page4(
    //     index: settings.index,
    //     params: settings.params,
    //   ),
    // );
  }

  @override
  void onPageObserverRegister() {
    registerPageObserver(this);
  }

  @override
  void onRouteTransitionsBuilderRegister() {
    // registerRouteTransitionsBuilder(
    //   '\/biz1\/flutter[0-9]*',
    //   (
    //     context,
    //     animation,
    //     secondaryAnimation,
    //     child,
    //   ) =>
    //       SlideTransition(
    //     transformHitTests: false,
    //     position: Tween<Offset>(
    //       begin: const Offset(0, -1),
    //       end: Offset.zero,
    //     ).animate(animation),
    //     child: SlideTransition(
    //       position: Tween<Offset>(
    //         begin: Offset.zero,
    //         end: const Offset(0, 1),
    //       ).animate(secondaryAnimation),
    //       child: child,
    //     ),
    //   ),
    // );
  }

  @override
  void onCreate(RouteSettings routeSettings) {}

  @override
  void didAppear(RouteSettings routeSettings) {}

  @override
  void didDisappear(RouteSettings routeSettings) {}

  @override
  void willAppear(RouteSettings routeSettings) {}

  @override
  void willDisappear(RouteSettings routeSettings) {}
}
