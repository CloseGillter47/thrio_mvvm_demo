import 'package:flutter/cupertino.dart';
import 'package:my_stacked_demo/_core/locator.dart';
import 'package:my_stacked_demo/pages/setting/setting.dart';
import 'package:stacked_services/stacked_services.dart';

class MineTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CupertinoButton(
        child: Text("TO_SETTING"),
        // onPressed: () => locator<NavigationService>().navigateWithTransition(SettingPage(), transition: "rightToLeft"),
        onPressed: () => Navigator.of(context).push(
          CupertinoPageRoute(builder: (c) => SettingPage()),
        ),
      ),
    );
  }
}
