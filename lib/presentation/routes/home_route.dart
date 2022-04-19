import 'package:flutter/material.dart';
import 'package:test_web/presentation/pages/home_page.dart';

class HomeRoute extends MaterialPageRoute {
  static const name = '/';

  HomeRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return const MyHomePage(
              title: 'home',
            );
          },
        );
}
