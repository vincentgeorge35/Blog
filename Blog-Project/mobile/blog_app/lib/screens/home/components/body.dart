import 'package:blog_app/models/Post.dart';
import 'package:blog_app/screens/home/components/post_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) => PostCard(
              post: posts[index],
            ));
  }
}