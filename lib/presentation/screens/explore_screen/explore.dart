import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/domain/repository/search_repository/search_repository.dart';
import 'package:vibette/presentation/bloc/cubit/search_cubit/search_cubit.dart';
import 'package:vibette/presentation/screens/explore_screen/widget/explore_screen_loading.dart';
import 'package:vibette/presentation/screens/explore_screen/widget/search_screen.dart';

class ExploreScreen extends StatelessWidget {
  // Use StatelessWidget if possible
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(SearchRepository()),
      child: _ExploreScreenContent(), // Separate widget for rebuilds
    );
  }
}

class _ExploreScreenContent extends StatefulWidget {
  @override
  State<_ExploreScreenContent> createState() => _ExploreScreenContentState();
}

class _ExploreScreenContentState extends State<_ExploreScreenContent> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;

  bool _isLoading = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  void _performSearch() {
    final query = _searchController.text;
    context.read<SearchCubit>().search(query);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepository()),
      child: Scaffold(
        backgroundColor: appTheme(context),
        body: SafeArea(
          child: _isLoading
              ? ExploreScreenLoading()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          _isSearchActive
                              ? IconButton(
                                  onPressed: () {
                                    context.read<SearchCubit>().search('');
                                    _searchController.clear();
                                    setState(() {
                                      _isSearchActive = false;
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_back))
                              : const SizedBox(),
                          Expanded(
                            child: CupertinoSearchTextField(
                              onTap: () {
                                setState(() {
                                  _isSearchActive = true;
                                });

                                context
                                    .read<SearchCubit>()
                                    .search(_searchController.text);
                              },
                              onChanged: (value) {
                                setState(() {
                                  _isSearchActive = value.isNotEmpty;
                                  _searchController.text = value;
                                });
                              },
                              controller: _searchController,
                              suffixIcon: Icon(
                                CupertinoIcons.clear_circled,
                                color: grey300,
                              ),
                              onSubmitted: (value) {
                                _performSearch();
                              },
                              onSuffixTap: () {
                                _searchController.clear();
                                context.read<SearchCubit>().search('');
                                setState(() {
                                  _isSearchActive = true;
                                });
                              },
                              placeholder: 'Search',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (_isSearchActive && state is SearchSuccess) {
                            // Show SearchScreen if active
                            return SearchScreen(
                              searchController: _searchController!,
                              isSearchActive: _isSearchActive,
                              onSearchScreenClosed: () {
                                setState(() {
                                  _isSearchActive = false;
                                });
                              },
                            );
                          } else {
                            return _buildGridView(); // Show grid view otherwise
                          }
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: 32,
        (context, index) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://static.jdmexport.com/wp-content/uploads/sites/9/2022/12/01074926/how-fast-is-a-nissan-gtr.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
