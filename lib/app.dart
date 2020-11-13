import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '_core/locator.dart';
import '_core/router.gr.dart';
import 'models/app_model.dart';
import 'views/splash/splash_view.dart';
import 'services/cache_service.dart';
import 'themes/app_theme.dart';
import 'plugins/i18n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => AppViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        theme: model.theme,
        builder: (context, child) => AppTheme(
          data: model.theme,
          child: child,
        ),

        /// 多语言配置
        locale: Locale('zh', 'CN'),
        localizationsDelegates: [
          model.i18n,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: model.i18n.supportedLocales,

        /// 路由配置
        onGenerateRoute: Router().onGenerateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}

class AppViewModel extends BaseViewModel {
  final _cacheService = locator<CacheService>();

  final _i18n = I18n.delegate;

  AppModel state;

  AppThemeData theme;

  GeneratedLocalizationsDelegate get i18n => _i18n;

  Future init() async {
    /// 绑定多语言切换事件
    I18n.onLocaleChanged = _onLocaleChanged;

    /// 读取缓存
    _initCaches();
  }

  /// 初始化缓存
  void _initCaches() {
    final caches = _cacheService.getCaches<AppModel>();
    state = AppModel.forJson(caches);

    /// 设置多语言
    I18n.onLocaleChanged(state.language);

    /// 设置主题 - 换肤功能
    theme = AppThemeData(red: Color(0xFFFA541C));
  }

  /// 多语言切换
  void _onLocaleChanged(Locale lang) {
    I18n.locale = lang;
    state.language = lang;
    _cacheService.setCaches(state);

    notifyListeners();
  }
}
