import 'package:curi_blog/data/interface/iCategory_repository.dart';
import 'package:curi_blog/data/network/network_exception.dart';
import 'package:curi_blog/state_manager/state/request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNotifier extends StateNotifier<RequestState> {
  final ICategoriesRepository _iCategoriesRepository;

  CategoriesNotifier(this._iCategoriesRepository) : super(RequestInitialState());

  Future categories() async {
    try {
      state = RequestLoadingState();
      final attachment = await _iCategoriesRepository.categories();
      state = RequestLoadedState(attachment);
    } on NetworkException {
      state = RequestErrorState("Something went wrong!");
    }
  }
}
