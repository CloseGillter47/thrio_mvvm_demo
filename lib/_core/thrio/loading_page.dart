import 'package:flutter/cupertino.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
      child: Center(
        child: Text(
          "LOADING...",
          style: TextStyle(
            color: Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
