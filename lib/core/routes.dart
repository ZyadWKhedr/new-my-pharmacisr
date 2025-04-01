import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/features/auth/presentation/login_page.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',  // This is where your app starts
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => HomePage(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => ProfilePage(),
    // ),
  
  ],
);
