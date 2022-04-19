import 'dart:async';

import 'package:test_web/app_error.dart';
import 'package:test_web/domain/repositories/catalogue_repository.dart';
import 'package:test_web/domain/state/catalogue_state.dart';

class CatalogueController {
  final StreamController<CatalogueState> _controller =
      StreamController<CatalogueState>.broadcast();

  CatalogueState _state = CatalogueState(isLoading: false);

  final CatalogueRepository catalogueRepository;

  CatalogueController({
    required this.catalogueRepository,
  });

  Stream<CatalogueState> get stream => _controller.stream;
  CatalogueState get value => _state;

  void emit(CatalogueState newState) {
    _state = newState;
    _controller.add(newState);
  }

  Future<void> loadCatalogue() async {
    if (value.isLoading) {
      return;
    }

    emit(
      (CatalogueStateBuilder.fromInstance(value)..isLoading = true).build(),
    );

    try {
      final catalogue = await catalogueRepository.getCatalogue();

      emit(
        (CatalogueStateBuilder.fromInstance(value)
              ..isLoading = false
              ..catalogue = catalogue.toList())
            .build(),
      );
    } on AppError catch (err) {
      emit(
        (CatalogueStateBuilder.fromInstance(value)
              ..isLoading = false
              ..error = err)
            .build(),
      );
    }
  }
}
