import 'package:flutter/cupertino.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("InfoPage"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("BUTTON"),
          onPressed: () => {},
        ),
      ),
    );
  }
}
