part of home_page;

class _HomePageView extends StatelessWidget {
  final HomeViewModel vm;
  _HomePageView(this.vm);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("HOME"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("TO_NATIVE 1"),
          onPressed: () {
            ThrioNavigator.push(url: "/biz1/native1");
          },
        ),
      ),
    );
  }
}
