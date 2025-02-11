import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';

class HomeScreenLoading extends StatelessWidget {
  final Size size;
  const HomeScreenLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[100]!,
      child: ListView(
        children: [
          SizedBox(
            height: 110,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 5, top: 5, bottom: 5),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    margin: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                        )
                                      ],
                                      CupertinoIcons.add_circled_solid,
                                      size: 30,
                                      color: grey300,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Your Story',
                                  style: GoogleFonts.roboto(),
                                )
                              ],
                            ),
                          ),
                        )
                      : Padding(
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
                                ),
                              ),
                              //   Container(width: 80, height: 10)
                            ],
                          ),
                        );
                }),
          ),
          h20,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(), // Important!
            shrinkWrap: true, // Important!
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      children: [
                        // profile name
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 10,
                                    width: 90,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(8)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color: Theme.of(context).brightness ==
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 15,
                                  width: size.width,
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    ));
  }
}
