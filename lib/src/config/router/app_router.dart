import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/config/router/settings/app_routes.dart';

import '../../presentation/views/home_view/home_view.dart';

final _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: _rootNavigator,
  initialLocation: AppRoutes.homeView.path,
  routes: [
    GoRoute(
      path: AppRoutes.homeView.path,
      name: AppRoutes.homeView.name,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: HomeView(),
        );
      },
    ),
  ],
);
