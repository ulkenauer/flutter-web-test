import 'package:test_web/domain/entities/catalogue_item.dart';

abstract class CatalogueRepository {
  Future<CatalogueItem> getCatalogueItem(String id);
  Future<Iterable<CatalogueItem>> getCatalogue();
}
