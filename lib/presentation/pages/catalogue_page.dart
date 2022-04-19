import 'package:flutter/material.dart';
import 'package:test_web/domain/controllers/catalogue_controller.dart';
import 'package:test_web/domain/state/catalogue_state.dart';
import 'package:test_web/presentation/components/catalogue_card.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({
    Key? key,
    required this.catalogueController,
  }) : super(key: key);
  final CatalogueController catalogueController;

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  @override
  void initState() {
    widget.catalogueController.loadCatalogue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<CatalogueState>(
        stream: widget.catalogueController.stream,
        builder: (context, snapshot) {
          final state = snapshot.data ?? widget.catalogueController.value;

          if (state.error != null) {
            return Center(
              child: Text(state.error!.message),
            );
          }

          if (state.catalogue != null) {
            int crossAxisCount = 2;

            if (MediaQuery.of(context).size.width > 1000) {
              crossAxisCount = 4;
            }

            return Container(
                color: Colors.blue,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: state.catalogue!
                              .map(
                                (e) => CatalogueCard(
                                  catalogueItem: e,
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/catalogue-item/${e.id}');
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
