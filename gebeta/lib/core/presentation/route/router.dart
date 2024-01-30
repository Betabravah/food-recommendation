import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/screens/login_page.dart';
import '../../../features/auth/presentation/screens/signup_page.dart';
import '../../../features/auth/presentation/screens/splash_screen.dart';
import '../../../features/food/presentation/screens/home_page.dart';
import '../../constants/constants.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  // TODO: Add all routes here

  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(foods),
    ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
