import 'package:flutter/cupertino.dart';
import 'package:thrio/thrio.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("SETTING"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("TO NATVIE 1"),
          onPressed: () => ThrioNavigator.push(url: "/biz1/native1"),
        ),
      ),
    );
  }
}
