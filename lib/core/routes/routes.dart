import 'package:go_router/go_router.dart';

import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/home_page.dart';

final routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
