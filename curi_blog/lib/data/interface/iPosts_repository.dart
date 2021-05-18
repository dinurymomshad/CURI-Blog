import 'package:curi_blog/data/models/posts/post.dart';
import 'package:curi_blog/data/models/posts/posts.dart';

abstract class IPostsRepository {
  Future<List<Posts>> posts();
  Future<List<Posts>> featuredPosts();
  Future<List<Posts>> morePosts();

  Future<Post> post(postID);
  Future<List<Posts>> postsByCategory(categoryID);
  Future<List<Posts>> morePostsByCategory();
}