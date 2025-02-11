import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vibette/domain/repository/search_repository/search_repository.dart';
import 'package:vibette/presentation/screens/widgets/sample.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;
  SearchCubit(this._searchRepository) : super(SearchInitial());

  void search(String query) async {
    emit(SearchLoading());

    try {
      // Simulate network delay (replace with your actual search logic)
      await Future.delayed(const Duration(milliseconds: 500));

      final results = await _searchRepository.search(query);

      emit(SearchSuccess(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
