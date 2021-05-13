import 'package:curi_blog/data/interface/iPosts_repository.dart';
import 'package:curi_blog/data/models/posts/post.dart';
import 'package:curi_blog/data/models/posts/posts.dart';
import 'package:curi_blog/data/network/api.dart';
import 'package:curi_blog/data/network/network_urils.dart';

class PostsRepository implements IPostsRepository {
  @override
  Future<List<Posts>> posts() async {
    var responseBody = await Network.handleResponse(await Network.getRequest(API.posts));
    List<Posts> posts = (responseBody as List<dynamic>).map((e) => Posts.fromJson(e)).toList();
    return posts;
  }

  @override
  Future<Post> post(postID) async {
    var responseBody = await Network.handleResponse(await Network.getRequest(API.post(postID)));
    Post post = Post.fromJson(responseBody);
    return post;
  }

  @override
  Future<List<Posts>> postsByCategory(categoryID) async {
    var responseBody = await Network.handleResponse(await Network.getRequest(API.postsByCategory(categoryID)));
    List<Posts> posts = (responseBody as List<dynamic>).map((e) => Posts.fromJson(e)).toList();
    return posts;
  }
}
