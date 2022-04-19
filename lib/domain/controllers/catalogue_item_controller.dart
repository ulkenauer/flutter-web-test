import 'dart:async';

import 'package:test_web/app_error.dart';
import 'package:test_web/domain/repositories/catalogue_repository.dart';
import 'package:test_web/domain/state/catalogue_item_state.dart';

class CatalogueItemController {
  final StreamController<CatalogueItemState> _controller =
      StreamController<CatalogueItemState>.broadcast();

  CatalogueItemState _state = CatalogueItemState(isLoading: false);

  final CatalogueRepository catalogueRepository;

  CatalogueItemController({
    required this.catalogueRepository,
  });

  Stream<CatalogueItemState> get stream => _controller.stream;
  CatalogueItemState get value => _state;

  void emit(CatalogueItemState newState) {
    _state = newState;
    _controller.add(newState);
  }

  Future<void> fetchCatalogueItem(String id) async {
    if (value.isLoading) {
      return;
    }

    emit(
      (CatalogueItemStateBuilder.fromInstance(value)..isLoading = true).build(),
    );

    try {
      final catalogueItem = await catalogueRepository.getCatalogueItem(id);

      emit(
        (CatalogueItemStateBuilder.fromInstance(value)
              ..isLoading = false
              ..catalogueItem = catalogueItem)
            .build(),
      );
    } on AppError catch (err) {
      emit(
        (CatalogueItemStateBuilder.fromInstance(value)
              ..isLoading = false
              ..error = err)
            .build(),
      );
    }
  }
}
