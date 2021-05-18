import 'package:curi_blog/state_manager/notifier/scroll_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allArticleScrollProvider = StateNotifierProvider((ref) => AllArticleScrollNotifier());
final postByCategoryScrollProvider = StateNotifierProvider((ref) => PostByCategoryScrollNotifier());
