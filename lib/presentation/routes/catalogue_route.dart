import 'package:flutter/material.dart';
import 'package:test_web/presentation/pages/catalogue_page.dart';
import 'package:test_web/services.dart';

class CatalogueRoute extends MaterialPageRoute {
  static const name = '/catalogue';

  CatalogueRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return CataloguePage(
              catalogueController: appServices.catalogueController,
            );
          },
        );
}
