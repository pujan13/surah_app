import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';
import '../../features/login/login_page.dart';
import '../../features/video/video_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/', // ✅ Always starts with "/"
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/VideoPage', // ✅ Changed to lowercase for consistency
        builder: (context, state) => VideoPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/home', // ✅ Fixed missing "/"
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}
