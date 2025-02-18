import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';

class StoryListView extends StatefulWidget {
  const StoryListView({super.key});

  @override
  State<StoryListView> createState() => _StoryListViewState();
}

class _StoryListViewState extends State<StoryListView> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0; // Track the starting index of visible items
  final int _scrollIncrement = 4;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 130,
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildStoryItem(index);
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.offset -
                      400, // Adjust scroll distance as needed
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  _currentIndex =
                      (_currentIndex - _scrollIncrement).clamp(0, 9);
                });
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.offset +
                      400, // Adjust scroll distance as needed
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );

                setState(() {
                  _currentIndex =
                      (_currentIndex + _scrollIncrement).clamp(0, 9);
                });
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStoryItem(int index) {
    final imageUrl = index == 0
        ? 'https://e6.365dm.de/22/09/1600x900/skysport_de-ronaldo-portugal_5906577.jpg?20220921112110'
        : 'https://mastmedia.plu.edu/wp-content/uploads/2024/05/IMG_0881.webp';
    final name = index == 0 ? 'Your Story' : '$index Sindrella_lally_stephen';

    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? 8 : 5,
        right: 5,
        top: 5,
        bottom: 5,
      ),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [appThemeColor2, appThemeColor3],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  color: white,
                  shape: BoxShape.circle,
                ),
                child: index == 0
                    ? Icon(
                        shadows: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                          )
                        ],
                        CupertinoIcons.add_circled_solid,
                        size: 30,
                        color: grey300,
                      )
                    : null,
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                name,
                style: GoogleFonts.roboto(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
