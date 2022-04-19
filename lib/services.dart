import 'package:test_web/data/repositories/mock/catalogue_mock_repository.dart';
import 'package:test_web/domain/controllers/catalogue_controller.dart';
import 'package:test_web/domain/controllers/catalogue_item_controller.dart';
import 'package:test_web/domain/repositories/catalogue_repository.dart';

class Services {
  late final CatalogueRepository catalogueRepository;
  late final CatalogueController catalogueController;
  late final CatalogueItemController catalogueItemController;
}

late Services appServices;

void setupServices() {
  appServices = Services();
  appServices.catalogueRepository = CatalogueMockRepository();

  appServices.catalogueController = CatalogueController(
    catalogueRepository: appServices.catalogueRepository,
  );
  appServices.catalogueItemController = CatalogueItemController(
    catalogueRepository: appServices.catalogueRepository,
  );
}
