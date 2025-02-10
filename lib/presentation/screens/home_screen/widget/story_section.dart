import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';

class StorySection extends StatelessWidget {
  const StorySection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: size.width,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
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
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [appThemeColor2, appThemeColor3]),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                  color: white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://e6.365dm.de/22/09/1600x900/skysport_de-ronaldo-portugal_5906577.jpg?20220921112110',
                                      ),
                                      fit: BoxFit.cover)),
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
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                                colors: [
                                  appThemeColor2,
                                  appThemeColor3,
                                ]),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://mastmedia.plu.edu/wp-content/uploads/2024/05/IMG_0881.webp'),
                                  fit: BoxFit.cover),
                              color: white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          child: Text(
                            'Sindrella_lally_stephen',
                            style: GoogleFonts.roboto(),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
