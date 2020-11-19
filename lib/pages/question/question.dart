import 'package:flutter/cupertino.dart';

class QuestionTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("INPUT"),
      ),
      child: Center(
        child: CupertinoTextField(),
      ),
    );
  }
}
