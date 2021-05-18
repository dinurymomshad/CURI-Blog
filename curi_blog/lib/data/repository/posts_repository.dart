import 'package:curi_blog/data/interface/iPosts_repository.dart';
import 'package:curi_blog/data/models/posts/post.dart';
import 'package:curi_blog/data/models/posts/posts.dart';
import 'package:curi_blog/data/network/api.dart';
import 'package:curi_blog/data/network/network_urils.dart';
import 'package:nb_utils/nb_utils.dart';

class PostsRepository implements IPostsRepository {
  PostsModel postsModel;
  List<Posts> postList;

  @override
  Future<List<Posts>> posts() async {
    if (postList != null) postList.clear();
    var responseBody = await Network.handleResponse(await Network.getRequest(API.posts));
    postsModel = PostsModel.fromJson(responseBody);
    postList = postsModel.data;
    return postList;
  }

  @override
  Future<List<Posts>> morePosts() async {
    var responseBody;
    if (postsModel.pagination.links.next != null) {
      toast("Fetching more posts");
      responseBody = await Network.handleResponse(await Network.getRequest(postsModel.pagination.links.next, noBaseUrl: true));
      postsModel = PostsModel.fromJson(responseBody);
      postList.addAll(postsModel.data);
      return postList;
    } else {
      toast("You have reached the end");
      return postList;
    }
  }

  @override
  Future<List<Posts>> featuredPosts() async {
    if (postList != null) postList.clear();
    var responseBody = await Network.handleResponse(await Network.getRequest(API.postsByCategory(51)));
    PostsModel postsModel = PostsModel.fromJson(responseBody);
    List<Posts> featuredPostList = postsModel.data;
    return featuredPostList;
  }

  @override
  Future<Post> post(postID) async {
    var responseBody = await Network.handleResponse(await Network.getRequest(API.post(postID)));
    Post post = Post.fromJson(responseBody);
    return post;
  }

  PostsModel postsModelByCategory;
  List<Posts> postListByCategory;

  @override
  Future<List<Posts>> postsByCategory(categoryID) async {
    var responseBody = await Network.handleResponse(await Network.getRequest(API.postsByCategory(categoryID)));
    postsModelByCategory = PostsModel.fromJson(responseBody);
    postListByCategory = postsModelByCategory.data;
    return postListByCategory;
  }

  @override
  Future<List<Posts>> morePostsByCategory() async {
    var responseBody;
    if (postsModelByCategory.pagination.links.next != null) {
      toast("Fetching more posts");
      responseBody = await Network.handleResponse(await Network.getRequest(postsModelByCategory.pagination.links.next, noBaseUrl: true));
      postsModelByCategory = PostsModel.fromJson(responseBody);
      postListByCategory.addAll(postsModelByCategory.data);
      return postListByCategory;
    } else {
      toast("You have reached the end");
      return postListByCategory;
    }
  }
}
