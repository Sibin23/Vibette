import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';

class UserPostWidget extends StatelessWidget {
  const UserPostWidget({
    super.key,
    required this.size,
    required this.postImage,
    required this.postText,
    required this.postUsername,
    required this.postDate,
    required this.postLikes,
    required this.postComments,
  });

  final Size size;
  final String postImage;
  final String postText;
  final String postUsername;
  final String postDate;
  final String postLikes;
  final String postComments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://mastmedia.plu.edu/wp-content/uploads/2024/05/IMG_0881.webp'),
                        fit: BoxFit.cover),
                    color: white,
                    shape: BoxShape.circle,
                  ),
                ),
                w10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(postUsername,
                        style: Theme.of(context).brightness == Brightness.dark
                            ? subtitleNormalW
                            : subtitleNormalB),
                    Text(
                      postDate,
                      style: const TextStyle(color: grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Post Image
          SizedBox(
            width: size.width,
            height: 400,
            child: Image.network(
              postImage,
              fit: BoxFit.cover,
            ),
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
                          Icons.favorite,
                          color: red,
                          size: 30,
                        ),
                      ),
                      Text(postLikes,
                          style: Theme.of(context).brightness == Brightness.dark
                              ? subtitleNormalW
                              : subtitleNormalB),
                      w20,
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          CupertinoIcons.chat_bubble,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? white
                              : black,
                          size: 25,
                        ),
                      ),
                      Text(postComments,
                          style: Theme.of(context).brightness == Brightness.dark
                              ? subtitleNormalW
                              : subtitleNormalB),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/save_post.webp',
                      color: Theme.of(context).brightness == Brightness.dark
                          ? white
                          : black,fit: BoxFit.cover,
                    ),
                  ),
                ]),
          ),

          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ReadMoreText(
              '$postUsername $postText',
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: grey,
              annotations: [
                Annotation(
                  regExp: RegExp(
                      r'^(\w+)'), // Regex for the username at the beginning
                  spanBuilder: ({required String text, TextStyle? textStyle}) =>
                      TextSpan(
                    text: text,
                    style: textStyle?.copyWith(
                        fontWeight: FontWeight.bold), // Make username bold
                  ),
                ),
                Annotation(
                  regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
                  spanBuilder: ({required String text, TextStyle? textStyle}) =>
                      TextSpan(
                    text: text,
                    style: textStyle?.copyWith(color: Colors.blue),
                  ),
                ),
                Annotation(
                  regExp: RegExp(r'<@(\d+)>'),
                  spanBuilder: ({required String text, TextStyle? textStyle}) =>
                      TextSpan(
                    text: '@User123',
                    style: textStyle?.copyWith(color: Colors.green),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('heheh');
                      },
                  ),
                ),
              ],
              
            ),
          )
         
          // main Ui
        ],
      ),
    );
  }
}
