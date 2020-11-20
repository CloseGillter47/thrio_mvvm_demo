import 'package:flutter/cupertino.dart';
import 'package:my_stacked_demo/pages/setting/setting.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../_core/locator.dart';
import '../widgets/utils.dart';
import '../pages/main/main.dart';

class NavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigatorAppViewModel>.nonReactive(
      builder: (ctx, vm, _) => WillPopScope(
        onWillPop: vm.onWillPop,
        child: Navigator(
          // key: vm.navigatorKey,
          pages: vm.pages,
          onPopPage: vm.onPopPage,
        ),
      ),
      viewModelBuilder: () => _getState(),
    );
  }
}

NavigatorAppViewModel _navigatorAppViewModel;

NavigatorAppViewModel _getState() {
  return _navigatorAppViewModel ??= NavigatorAppViewModel();
}

class NavigatorAppViewModel extends BaseViewModel {
  NavigatorAppViewModel() {
    print('🐛🐛🐛🐛🐛🐛🐛🐛 ---> NavigatorAppViewModel');

    setAndroidStatusBar();
    home = CupertinoPage(
      key: Key("/"),
      child: MainPage(),
    );

    final setting = CupertinoPage(
      key: Key("/setting"),
      child: SettingPage(),
    );

    _pages = [home, setting];
  }

  final navigatorKey = locator<NavigationService>().navigatorKey;

  final key = UniqueKey();

  CupertinoPage home;

  List<Page<dynamic>> _pages;

  List<Page<dynamic>> get pages => _pages;

  Future<bool> onWillPop() async {
    return false;
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    _pages.remove(route.settings);
    return route.didPop(result);
  }
}

class NavigatorPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_NavigatorViewModel>.reactive(
      builder: (ctx, vm, _) => WillPopScope(
        onWillPop: vm._onWillPop,
        child: Navigator(
          key: vm.key,
          pages: vm.pages,
          onPopPage: vm.onPopPage,
        ),
      ),
      viewModelBuilder: () => _NavigatorViewModel(),
    );
  }
}

class _NavigatorViewModel extends BaseViewModel {
  _NavigatorViewModel() {
    print('🐛🐛🐛🐛🐛🐛🐛🐛 ---> NavigatorAppViewModel');

    setAndroidStatusBar();

    _home = CupertinoPage(
      key: Key("/"),
      child: MainPage(),
    );

    _pages = [_home];
  }

  final key = GlobalKey<NavigatorState>();

  CupertinoPage _home;

  List<Page<dynamic>> _pages;

  List<Page<dynamic>> get pages => _pages;

  Future<bool> _onWillPop() async {
    if (key.currentState.canPop()) {
      key.currentState.pop();
      return false;
    }

    return true;
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    _pages.remove(route.settings);
    return route.didPop(result);
  }
}
