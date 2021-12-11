import 'package:blog_app/models/Post.dart';
import 'package:blog_app/screens/home/details/post_detail.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shadowColor: Colors.white70,
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                (post.title).toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              subtitle: Text(
                post.body,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('READ MORE'),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetail(
                                  post: post,
                                ))),
                  },
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
