import 'package:flutter/material.dart';

class FadePageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;

  FadePageTransition({required this.child})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade transition with opacity animation
      var fadeAnimation = Tween(begin: 0.0, end: 4.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
      );

      // For the exit transition (fade out when leaving the page)
      var reverseFadeAnimation = Tween(begin: 4.0, end: 0.0).animate(
        CurvedAnimation(
          parent: secondaryAnimation,
          curve: Curves.easeInOut,
        ),
      );

      return FadeTransition(
        opacity: fadeAnimation, // Use fade animation for page entry
        child: FadeTransition(
          opacity: reverseFadeAnimation, // Use reverse fade for exit
          child: child,
        ),
      );
    },
  );
}
