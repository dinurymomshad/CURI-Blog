import 'package:curi_blog/data/interface/iCategory_repository.dart';
import 'package:curi_blog/data/models/categories.dart';
import 'package:curi_blog/data/network/api.dart';
import 'package:curi_blog/data/network/network_urils.dart';

class CategoriesRepository implements ICategoriesRepository {
  @override
  Future<List<Categories>> categories() async {
    var responseBody = await Network.handleResponse(await Network.getRequest(API.categories));
    List<Categories> categories = (responseBody as List<dynamic>).map((e) => Categories.fromJson(e)).toList();
    return categories;
  }
}
