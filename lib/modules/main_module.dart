import 'package:flutter/widgets.dart';
import 'package:my_stacked_demo/pages/page1.dart';
import 'package:my_stacked_demo/pages/page2.dart';
import 'package:my_stacked_demo/pages/page3.dart';
import 'package:my_stacked_demo/pages/page4.dart';
import 'package:thrio/thrio.dart';

class Module with ThrioModule, ModulePageBuilder, ModulePageObserver, ModuleRouteTransitionsBuilder, NavigatorPageObserver {
  @override
  void onPageBuilderRegister() {
    registerPageBuilder(
      '/biz1/flutter1',
      (settings) => Page1(
        index: settings.index,
        params: settings.params,
      ),
    );

    registerPageBuilder(
      '/biz2/flutter2',
      (settings) => Page2(
        index: settings.index,
        params: settings.params,
      ),
    );

    registerPageBuilder(
      '/biz1/flutter3',
      (settings) => Page3(
        index: settings.index,
        params: settings.params,
      ),
    );
    registerPageBuilder(
      '/biz2/flutter4',
      (settings) => Page4(
        index: settings.index,
        params: settings.params,
      ),
    );
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
