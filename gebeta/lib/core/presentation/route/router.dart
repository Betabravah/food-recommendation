import 'package:go_router/go_router.dart';

import '../../../main.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  // TODO: Add all routes here

  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const App(),
    ),
  ],
);
