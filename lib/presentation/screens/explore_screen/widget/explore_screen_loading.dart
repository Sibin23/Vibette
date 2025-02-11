import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vibette/application/core/constants/colors.dart';

class ExploreScreenLoading extends StatelessWidget {
  const ExploreScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: grey.shade800,
      highlightColor: grey300,
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: CupertinoSearchTextField(),
        ),
        Expanded(
          child: GridView.custom(
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
                    color: white
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
