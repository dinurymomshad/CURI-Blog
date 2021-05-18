import 'package:curi_blog/data/models/posts/posts.dart';

abstract class PostsState {
  const PostsState();
}

class PostsInitialState extends PostsState {
  const PostsInitialState();
}

class PostsLoadingState extends PostsState {
  const PostsLoadingState();
}

class PostsLoadedState extends PostsState {
  final List<Posts> posts;

  const PostsLoadedState(this.posts);
}

class PostsErrorState extends PostsState {
  final String message;

  const PostsErrorState(this.message);
}

/*Featured posts*/

abstract class FeaturedPostsState {
  const FeaturedPostsState();
}

class FeaturedPostsInitialState extends FeaturedPostsState {
  const FeaturedPostsInitialState();
}

class FeaturedPostsLoadingState extends FeaturedPostsState {
  const FeaturedPostsLoadingState();
}

class FeaturedPostsLoadedState extends FeaturedPostsState {
  final List<Posts> posts;

  const FeaturedPostsLoadedState(this.posts);
}

class FeaturedPostsErrorState extends FeaturedPostsState {
  final String message;

  const FeaturedPostsErrorState(this.message);
}
