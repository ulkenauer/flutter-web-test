import 'package:flutter/material.dart';
import 'package:test_web/presentation/routes/catalogue_item_route.dart';
import 'package:test_web/presentation/routes/catalogue_route.dart';
import 'package:test_web/presentation/routes/home_route.dart';
import 'package:test_web/services.dart';

void main() {
  setupServices();
  runApp(const MyApp());
}

class AppRoutes {
  static final _namedRoutes = <String, RouteFactory>{
    CatalogueRoute.name: (settings) => CatalogueRoute(settings: settings),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final params = CatalogueItemRouteParams.parse(settings);

    if (params != null) {
      return CatalogueItemRoute(
        catalogueItemRouteParams: params,
        settings: settings,
      );
    } else {
      print('unable to parse params');
    }

    if (_namedRoutes.containsKey(settings.name)) {
      return _namedRoutes[settings.name]!(settings);
    }
    return null;
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute == null) {
      final params = CatalogueItemRouteParams.parse(route.settings);
      if (params != null) {
        Future.microtask(() {
          navigator!.pushReplacementNamed(CatalogueRoute.name);
          navigator!.pushNamed(route.settings.name!);
        });
      }
    }
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [MyNavigatorObserver()],
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CatalogueRoute.name,
    );
  }
}
