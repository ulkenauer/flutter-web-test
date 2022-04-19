import 'package:flutter/material.dart';
import 'package:test_web/domain/controllers/catalogue_item_controller.dart';
import 'package:test_web/domain/entities/catalogue_item.dart';
import 'package:test_web/domain/state/catalogue_item_state.dart';
import 'package:test_web/presentation/routes/catalogue_item_route.dart';
import 'package:test_web/services.dart';

class CatalogueItemPage extends StatefulWidget {
  final CatalogueItemController catalogueItemController =
      CatalogueItemController(
    catalogueRepository: appServices.catalogueRepository,
  );
  final CatalogueItemRouteParams params;

  CatalogueItemPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<CatalogueItemPage> createState() => _CatalogueItemPageState();
}

class _CatalogueItemPageState extends State<CatalogueItemPage> {
  @override
  void initState() {
    widget.catalogueItemController
        .fetchCatalogueItem(widget.params.catalogueItemId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<CatalogueItemState>(
          stream: widget.catalogueItemController.stream,
          builder: (context, snapshot) {
            final state = snapshot.data ?? widget.catalogueItemController.value;

            if (!state.isLoading) {
              if (state.catalogueItem != null) {
                final item = state.catalogueItem!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 500,
                            child: Image.network(item.imageUrl),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.description),
                      ),
                    ],
                  ),
                );
              }
              if (state.error != null) {
                return Center(
                  child: Text(
                    state.error!.message,
                  ),
                );
              }
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
