library home_page;

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:thrio/thrio.dart';

part 'home_view.dart';
part 'home_view_model.dart';

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (ctx, vm, _) => _HomePageView(vm),
    );
  }
}
