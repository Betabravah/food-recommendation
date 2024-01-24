import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/screens/login_page.dart';
import '../../../main.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  // TODO: Add all routes here

  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
