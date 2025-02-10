import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/presentation/screens/home_screen/widget/story_section.dart';
import 'package:vibette/presentation/screens/home_screen/widget/user_post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appTheme(context),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            surfaceTintColor: appTheme(context),
            backgroundColor: appTheme(context),
            title: Text(
              'vibette',
              style: Theme.of(context).brightness == Brightness.dark
                  ? appbarTextW
                  : appbarTextB,
            ),
            actions: [
              IconButton(
                iconSize: 30,
                icon: Icon(
                  CupertinoIcons.person_crop_circle_badge_plus,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? white
                      : black,
                ),
                onPressed: () {},
              ),
              w10
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            StorySection(size: size),
            h20,
            // user Post
            SizedBox(
              width: size.width,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: UserPostWidget(
                        size: size,
                        postComments: '306k',
                        postDate: '11 December 2024',
                        postImage:
                            'https://phantom-marca.unidadeditorial.es/4c789dacd093bb3b4213b6a482099385/crop/0x0/2037x1358/resize/828/f/jpg/assets/multimedia/imagenes/2024/09/10/17259965245564.jpg',
                        postText:
                            'This is a sample text with a #hashtag, a mention <@123>, and a URL: https://example.com.ugin that allows for expanding and collapsing text with the added capability to style and interact with specific patterns in the text like hashtags, URLs, and mentions using the new Annotation feature.',
                        postLikes: '22.8M',
                        postUsername: 'cristiano',
                      ),
                    );
                  }),
            ),
          ]),
        ));
  }
}
