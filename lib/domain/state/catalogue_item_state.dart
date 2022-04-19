import 'package:test_web/app_error.dart';
import 'package:test_web/domain/entities/catalogue_item.dart';

class CatalogueItemState {
  final AppError? error;
  final bool isLoading;
  final CatalogueItem? catalogueItem;

  CatalogueItemState({
    this.error,
    this.catalogueItem,
    required this.isLoading,
  });
}

class CatalogueItemStateBuilder {
  AppError? error;
  bool isLoading;
  CatalogueItem? catalogueItem;

  CatalogueItemStateBuilder({
    this.error,
    this.catalogueItem,
    required this.isLoading,
  });

  factory CatalogueItemStateBuilder.fromInstance(CatalogueItemState instance) {
    return CatalogueItemStateBuilder(
      catalogueItem: instance.catalogueItem,
      isLoading: instance.isLoading,
      error: instance.error,
    );
  }

  CatalogueItemState build() {
    return CatalogueItemState(
      catalogueItem: catalogueItem,
      isLoading: isLoading,
      error: error,
    );
  }
}
