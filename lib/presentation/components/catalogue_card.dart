import 'package:flutter/widgets.dart';
import 'package:test_web/domain/entities/catalogue_item.dart';

class CatalogueCard extends StatelessWidget {
  const CatalogueCard({
    Key? key,
    required this.catalogueItem,
    required this.onTap,
  }) : super(key: key);

  final CatalogueItem catalogueItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(catalogueItem.imageUrl),
              ),
            ),
            Positioned.fill(
                child: Column(
              children: [
                Expanded(child: Container()),
                Text(
                  catalogueItem.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 16,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
