import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';
import '../../features/login/login_page.dart';
import '../../features/video/video_page.dart';
import '../transition/fadeTransition.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      // Route for the Login Page with Fade Transition
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      // Route for the Video Page with Fade Transition
      GoRoute(
        path: '/videopage',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: VideoPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      // Route for the Home Page with Fade Transition
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      // Another login route that doesn't necessarily need a fade transition but could have one for consistency
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
}
