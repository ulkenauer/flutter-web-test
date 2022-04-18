import 'package:test_web/app_error.dart';
import 'package:test_web/domain/entities/catalogue_item.dart';

class CatalogueState {
  final AppError? error;
  final bool isLoading;
  final List<CatalogueItem>? catalogue;

  CatalogueState({
    this.error,
    this.catalogue,
    required this.isLoading,
  });
}

class CatalogueStateBuilder {
  AppError? error;
  bool isLoading;
  List<CatalogueItem>? catalogue;

  CatalogueStateBuilder({
    this.error,
    this.catalogue,
    required this.isLoading,
  });

  factory CatalogueStateBuilder.fromInstance(CatalogueState instance) {
    return CatalogueStateBuilder(
      catalogue: instance.catalogue,
      isLoading: instance.isLoading,
      error: instance.error,
    );
  }

  CatalogueState build() {
    return CatalogueState(
      catalogue: catalogue,
      isLoading: isLoading,
      error: error,
    );
  }
}
