import 'package:curi_blog/data/interface/iCategory_repository.dart';
import 'package:curi_blog/data/repository/categories_repository.dart';
import 'package:curi_blog/state_manager/notifier/categories_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _categoriesRepositoryProvider = Provider<ICategoriesRepository>((ref) => CategoriesRepository());
final categoriesProvider = StateNotifierProvider((ref) => CategoriesNotifier(ref.watch(_categoriesRepositoryProvider)));
