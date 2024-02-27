import 'package:flutter/material.dart';

class MyFunctions {
  static void changePageWithoutAnimation(BuildContext context, Widget page) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: ((context, animation, secondaryAnimation) {
            return page;
          }),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ));
  }
}
