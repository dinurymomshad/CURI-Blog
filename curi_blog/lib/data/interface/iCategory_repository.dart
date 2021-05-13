
import 'package:curi_blog/data/models/categories.dart';

abstract class ICategoriesRepository {
  Future<List<Categories>> categories();
}