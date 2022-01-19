import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/screens/home/components/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);

    return ListView.builder(
        itemCount: _blogProvider.posts.length,
        itemBuilder: (BuildContext context, int index) => PostCard(
              post: _blogProvider.posts[index],
            ));
  }
}
