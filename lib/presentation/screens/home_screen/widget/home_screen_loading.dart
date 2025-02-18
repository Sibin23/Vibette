import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';

class HomeScreenLoading extends StatelessWidget {
  final Size size;
  const HomeScreenLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(builder: (context, constraints) {
      return Shimmer.fromColors(
        baseColor: isDarkMode
            ? Colors.grey[800]!
            : Colors.grey[300]!, // Conditional base color
        highlightColor: isDarkMode ? Colors.grey[600]! : Colors.grey[100]!,
        child: ListView(
          children: [
            SizedBox(
              height: 110,
              width: constraints.maxWidth,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                              ),
                              child: index == 0
                                  ? Icon(
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
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
                          //   Container(width: 80, height: 10)
                        ],
                      ),
                    );
                  }),
            ),
            h20,
            Center(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 300,
                  maxWidth: size.width > 600 ? 600 : size.width,
                ),
                padding: const EdgeInsets.all(
                    8.0), // Add some padding around the post
                decoration: BoxDecoration(
                  // Optional: Add a border or background
                  border:
                      Border.all(color: Colors.grey.shade300), // Example border
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), // Important!
                  shrinkWrap: true, // Important!
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: SizedBox(
                          width: size.width,
                          child: Column(
                            children: [
                              // profile name
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      margin: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    w10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 5, bottom: 5),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          height: 10,
                                          width: 90,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          height: 10,
                                          width: 150,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Post Image
                              Container(
                                color: white,
                                width: size.width,
                                height: 400,
                              ),
                              // Post Buttons
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Like Button
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: red,
                                              size: 30,
                                            ),
                                          ),
                                          w40,
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Icon(
                                              CupertinoIcons.chat_bubble,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? white
                                                  : black,
                                              size: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        child: Image.asset(
                                          'assets/save_post.webp',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ]),
                              ),

                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 15,
                                        width: size.width,
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 15,
                                        width: size.width / 2,
                                      )
                                    ],
                                  ))

                              // main Ui
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
