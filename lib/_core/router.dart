import 'package:auto_route/auto_route_annotations.dart';
import '../views/splash/splash_view.dart';

/// 路由自动注入
@CupertinoAutoRouter(routes: [
  CupertinoRoute(page: SplashPage, initial: true),
])
class $Router {}
