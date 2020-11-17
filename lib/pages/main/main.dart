library main_page;

import 'package:flutter/cupertino.dart';
import 'package:my_stacked_demo/pages/classify/classify.dart';
import 'package:my_stacked_demo/pages/directory/directory.dart';
import 'package:my_stacked_demo/pages/home/home.dart';
import 'package:my_stacked_demo/pages/mine/mine.dart';
import 'package:my_stacked_demo/pages/question/question.dart';
import 'package:stacked/stacked.dart';

part 'main_view.dart';
part 'main_view_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (ctx, vm, _) => _MainPageView(vm),
    );
  }
}
