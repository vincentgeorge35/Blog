import 'package:blog_app/models/Post.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:blog_app/shared/post_info.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0.0,
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.body,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: mDefaultSize * 0.6),
                    PostInfo(
                      icon: Icons.person,
                      text: post.author,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: PostInfo(
                        icon: Icons.date_range_outlined,
                        text: post.date,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: mDefaultSize / 1.5),
        child: Text(
          post.title,
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.blue[400],
    );
  }
}
