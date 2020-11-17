part of home_page;

class _HomePageView extends StatelessWidget {
  final HomeViewModel vm;
  _HomePageView(this.vm);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text("data"),
      ),
    );
  }
}
