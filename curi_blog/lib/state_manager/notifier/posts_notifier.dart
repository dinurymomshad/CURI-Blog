import 'package:curi_blog/data/interface/iPosts_repository.dart';
import 'package:curi_blog/data/network/network_exception.dart';
import 'package:curi_blog/state_manager/state/posts_state.dart';
import 'package:curi_blog/state_manager/state/request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsNotifier extends StateNotifier<PostsState> {
  final IPostsRepository _iPostsRepository;

  PostsNotifier(this._iPostsRepository) : super(PostsInitialState());

  Future posts() async {
    try {
      state = PostsLoadingState();
      final posts = await _iPostsRepository.posts();
      state = PostsLoadedState(posts);
    } on NetworkException {
      state = PostsErrorState("Something went wrong!");
    }
  }
}

class PostNotifier extends StateNotifier<RequestState> {
  final IPostsRepository _iPostsRepository;

  PostNotifier(this._iPostsRepository) : super(RequestInitialState());

  Future post(postID) async {
    try {
      state = RequestLoadingState();
      final post = await _iPostsRepository.post(postID);
      state = RequestLoadedState(post);
    } on NetworkException {
      state = RequestErrorState("Something went wrong!");
    }
  }
}

class PostsByCategoryNotifier extends StateNotifier<RequestState> {
  final IPostsRepository _iPostsRepository;

  PostsByCategoryNotifier(this._iPostsRepository) : super(RequestInitialState());

  Future postsByCategory(categoryID) async {
    try {
      state = RequestLoadingState();
      final post = await _iPostsRepository.postsByCategory(categoryID);
      state = RequestLoadedState(post);
    } on NetworkException {
      state = RequestErrorState("Something went wrong!");
    }
  }
}
