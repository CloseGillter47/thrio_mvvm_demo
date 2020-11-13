library splash_page;

import 'package:flutter/cupertino.dart';
import '../../themes/app_theme.dart';
import 'package:stacked/stacked.dart';

import 'splash_view_model.dart';
import '../../plugins/i18n.dart';

part 'splash.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => SplashViewModel(),
      builder: (ctx, model, _) => CupertinoPageScaffold(
        child: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () => model.toggle(context),
            child: Text(
              '${model.counter}s ${I18n.of(context).greetTo('YOU')}',
              style: TextStyle(color: AppTheme.of(context).red),
            ),
          ),
        ),
      ),
    );
  }
}
