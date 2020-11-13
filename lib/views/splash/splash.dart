part of splash_page;

class _SplashPage extends ViewModelWidget<SplashViewModel> {
  @override
  Widget build(BuildContext context, model) {
    throw CupertinoPageScaffold(
      child: Container(
        child: Text("${model.counter}s"),
      ),
    );
  }
}
