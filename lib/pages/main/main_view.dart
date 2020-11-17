part of main_page;

class _MainPageView extends StatelessWidget {
  final MainViewModel vm;
  _MainPageView(this.vm);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
        ],
      ),
      tabBuilder: (ctx, index) => [
        HomeTabPage(),
        ClassifyTabPage(),
        DirectoryTabPage(),
        QuestionTabPage(),
        MineTabPage(),
      ][index],
    );
  }
}
