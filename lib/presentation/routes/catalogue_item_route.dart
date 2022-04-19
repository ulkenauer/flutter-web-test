import 'package:flutter/material.dart';
import 'package:test_web/presentation/pages/catalogue_item_page.dart';

class CatalogueItemRouteParams {
  final String catalogueItemId;

  CatalogueItemRouteParams({
    required this.catalogueItemId,
  });

  static CatalogueItemRouteParams? parse(RouteSettings? settings) {
    try {
      final route = settings!.name!;
      final match = RegExp(r'^\/catalogue-item\/(.+)').firstMatch(route);
      final catalogueItemId = match!.group(1)!;

      return CatalogueItemRouteParams(
        catalogueItemId: catalogueItemId,
      );
    } catch (err) {
      return null;
    }
  }
}

class CatalogueItemRoute extends MaterialPageRoute {
  CatalogueItemRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
    required CatalogueItemRouteParams catalogueItemRouteParams,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return CatalogueItemPage(
              params: catalogueItemRouteParams,
            );
          },
        );
}
