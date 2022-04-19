import 'package:test_web/domain/entities/catalogue_item.dart';
import 'package:test_web/domain/repositories/catalogue_repository.dart';

class CatalogueMockRepository implements CatalogueRepository {
  CatalogueItem generateForId(String id) {
    final idx = int.tryParse(id);

    const max = 4;

    if (idx != null) {
      if (idx % max == 0) {
        return CatalogueItem(
          id: id,
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          title: 'shirt 1',
          imageUrl: 'https://5.imimg.com/data5/YJ/BO/MY-10973479/mens-designer-casual-shirt-500x500.jpg',
        );
      }
      if (idx % max == 1) {
        return CatalogueItem(
          id: id,
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          title: 'shirt 2',
          imageUrl: 'https://contents.mediadecathlon.com/p1484240/k\$ab565f3675dbdd7e3c486175e2c16583/men-s-travel-trekking-shirt-travel100-warm-bordeaux.jpg?&f=800x800',
        );
      }
      if (idx % max == 2) {
        return CatalogueItem(
          id: id,
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          title: 'shirt 3',
          imageUrl: 'https://www.collinsdictionary.com/images/full/shirt_378037390_1000.jpg',
        );
      }
    }

    return CatalogueItem(
      id: id,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      title: 't shirt 1',
      imageUrl:
          'https://res.cloudinary.com/teepublic/image/private/s--5SeW7XMT--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,h_416/c_crop,g_north_west,h_554,w_416,x_-52,y_-3/g_north_west,u_upload:v1446840612:production:blanks:cmnytzrskw2rtarpswec,x_-476,y_-328/b_rgb:eeeeee/c_limit,f_auto,h_630,q_90,w_630/v1631909150/production/designs/24369335_0.jpg',
    );
  }

  @override
  Future<Iterable<CatalogueItem>> getCatalogue() async {
    await Future.delayed(
      const Duration(milliseconds: 400),
    );

    return List.generate(
      30,
      (index) => generateForId(index.toString()),
    );
  }

  @override
  Future<CatalogueItem> getCatalogueItem(String id) async {
    await Future.delayed(
      const Duration(milliseconds: 400),
    );

    return generateForId(id);
  }
}
