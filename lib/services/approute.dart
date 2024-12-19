import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_app/demo.dart';
import 'package:leave_app/leave_approval.dart';
import 'package:leave_app/leave_form.dart';
import 'package:leave_app/menu.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Menu();
        },
        routes: <RouteBase>[
          GoRoute(
              path: '/form',
              builder: (BuildContext context, GoRouterState state) {
                return const LeaveForm();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: '/new',
                  builder: (context, state) {
                    return const Demo();
                  },
                )
              ]),
          GoRoute(
            path: '/approve',
            builder: (BuildContext context, GoRouterState state) {
              return const LeaveApproval();
            },
          ),
        ],
      ),
    ],
  );
}
