import 'package:curi_blog/data/interface/iPosts_repository.dart';
import 'package:curi_blog/data/repository/posts_repository.dart';
import 'package:curi_blog/state_manager/notifier/posts_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _postsRepositoryProvider = Provider<IPostsRepository>((ref) => PostsRepository());
final postsProvider = StateNotifierProvider((ref) => PostsNotifier(ref.watch(_postsRepositoryProvider)));
final postProvider = StateNotifierProvider((ref) => PostNotifier(ref.watch(_postsRepositoryProvider)));
final postsByCategoryProvider = StateNotifierProvider((ref) => PostsByCategoryNotifier(ref.watch(_postsRepositoryProvider)));
