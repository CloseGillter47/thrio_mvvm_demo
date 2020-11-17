import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Center(
          child: Text(
            "404",
            style: TextStyle(
              // color: Color(0xFF4395ff),
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
