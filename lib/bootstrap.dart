import 'package:flutter/cupertino.dart';
import 'package:thrio/thrio.dart';

import '_core/locator.dart';
import 'app.dart';
import 'widgets/zutils.dart';

import 'modules/module.dart' as modules;

// import 'src/sample/module.dart' as sample;

void main() => setup(() => runApp(const BootstrapApp()));
void biz1() => setup(() => runApp(const BootstrapApp(entrypoint: 'biz1')));
void biz2() => setup(() => runApp(const BootstrapApp(entrypoint: 'biz2')));

Future<void> setup(VoidCallback fnc) async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 统一 Android 状态栏
  setAndroidStatusBar();
  await setupLocator();
  fnc?.call();
}

class BootstrapApp extends StatefulWidget {
  const BootstrapApp({Key key, String entrypoint = 'main'})
      : _entrypoint = entrypoint,
        super(key: key);

  final String _entrypoint;

  @override
  _BootstrapAppState createState() => _BootstrapAppState();
}

class _BootstrapAppState extends State<BootstrapApp> with ThrioModule {
  @override
  void initState() {
    super.initState();

    registerModule(this);
    initModule();
  }

  @override
  void onModuleRegister() {
    registerModule(modules.Module());
  }

  @override
  void onModuleInit() {
    navigatorLogEnabled = true;
  }

  @override
  Widget build(BuildContext context) => App(entrypoint: widget._entrypoint);
}
