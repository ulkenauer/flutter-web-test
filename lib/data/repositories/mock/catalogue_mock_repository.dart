import 'package:test_web/domain/entities/catalogue_item.dart';
import 'package:test_web/domain/repositories/catalogue_repository.dart';

class CatalogueMockRepository implements CatalogueRepository {
  @override
  Future<Iterable<CatalogueItem>> getCatalogue() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return List.generate(
      10,
      (index) => CatalogueItem(
        id: index.toString(),
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        title: 'Sus imposter',
        imageUrl:
            'https://res.cloudinary.com/teepublic/image/private/s--5SeW7XMT--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,h_416/c_crop,g_north_west,h_554,w_416,x_-52,y_-3/g_north_west,u_upload:v1446840612:production:blanks:cmnytzrskw2rtarpswec,x_-476,y_-328/b_rgb:eeeeee/c_limit,f_auto,h_630,q_90,w_630/v1631909150/production/designs/24369335_0.jpg',
      ),
    );
  }

  @override
  Future<CatalogueItem> getCatalogueItem(String id) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return CatalogueItem(
      id: id,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      title: 'Sus imposter',
      imageUrl:
          'https://res.cloudinary.com/teepublic/image/private/s--5SeW7XMT--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,h_416/c_crop,g_north_west,h_554,w_416,x_-52,y_-3/g_north_west,u_upload:v1446840612:production:blanks:cmnytzrskw2rtarpswec,x_-476,y_-328/b_rgb:eeeeee/c_limit,f_auto,h_630,q_90,w_630/v1631909150/production/designs/24369335_0.jpg',
    );
  }
}
