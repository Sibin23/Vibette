import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/presentation/screens/home_screen/widget/home_screen_loading.dart';
import 'package:vibette/presentation/screens/home_screen/widget/story_section.dart';
import 'package:vibette/presentation/screens/home_screen/widget/user_post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Check if widget is still mounted before setState
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
     
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
         
          title: Text(
            'vibette',
            style: Theme.of(context).brightness == Brightness.dark
                ? appbarTextW
                : appbarTextB,
          ),
          actions: [
            IconButton(
              iconSize: 35,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? HomeScreenLoading(size: size)
              : ListView(
                  // Use ListView directly
                  children: [
                    StorySection(size: size),
                    h20,
                    // User Posts
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(), // Important!
                      shrinkWrap: true, // Important!
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
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
