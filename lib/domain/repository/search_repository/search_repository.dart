import 'package:vibette/presentation/screens/widgets/sample.dart';

class SearchRepository {
  Future<List<SearchResult>> search(String query) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay

    if (query.isEmpty) {
      return []; // Return empty list if query is empty
    }

    final filteredResults = searchResults
        .where((result) =>
            result.name!.toLowerCase().contains(query.toLowerCase()) ||
            result.description!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return filteredResults;
  }
}
