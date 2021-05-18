import 'package:curi_blog/state_manager/state/scroll_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllArticleScrollNotifier extends StateNotifier<ScrollState> {
  AllArticleScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}

class PostByCategoryScrollNotifier extends StateNotifier<ScrollState> {
  PostByCategoryScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}
