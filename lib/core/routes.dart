import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/features/home/presentation/pages/home_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/sign_up_page.dart';

class AppRoutes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String favourites = '/favourites';
  static const String remminders = '/reminders';
  static const String profile = '/profile';
}

final GoRouter goRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(path: AppRoutes.home, 
    builder: (context, state) => HomePage(),
    ),
  ],
);
