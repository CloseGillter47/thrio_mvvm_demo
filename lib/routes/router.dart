import 'package:flutter/cupertino.dart';
import 'package:stacked_services/stacked_services.dart';
import '../_core/locator.dart';

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: locator<NavigationService>().navigatorKey,
      pages: [],
    );
  }
}
