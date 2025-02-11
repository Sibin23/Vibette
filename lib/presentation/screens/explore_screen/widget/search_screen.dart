import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibette/presentation/bloc/cubit/search_cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  final bool isSearchActive;
  final VoidCallback onSearchScreenClosed;
  final TextEditingController searchController;

  const SearchScreen({
    super.key,
    required this.isSearchActive,
    required this.onSearchScreenClosed,
    required this.searchController,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.results.isNotEmpty) {
            print(state.results);
            return ListView.builder(
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                final result = state.results[index];
                return ListTile(
                  leading: result.images != null
                      ? Image.network(
                    result.images!,
                    width: 50,
                    fit: BoxFit.cover,
                  )
                      : null,
                  title: Text(result.name ?? ''),
                  subtitle: Text(result.description ?? ''),
                );
              },
            );
          } else {
            return const Center(child: Text("No results found"));
          }
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const Center(child: Text("Search for something"));
        }
      },
    );
  }
}

