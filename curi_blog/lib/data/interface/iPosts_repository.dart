import 'package:curi_blog/data/models/posts/post.dart';
import 'package:curi_blog/data/models/posts/posts.dart';

abstract class IPostsRepository {
  Future<List<Posts>> posts();

  Future<Post> post(postID);
  Future<List<Posts>> postsByCategory(categoryID);
}