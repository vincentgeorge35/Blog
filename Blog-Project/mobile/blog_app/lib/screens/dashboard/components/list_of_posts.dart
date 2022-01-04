import 'package:flutter/material.dart';
import 'package:blog_app/models/Post.dart';

class ListOfPosts extends StatelessWidget {
  final Post post;
  const ListOfPosts({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 4.0)
          ],
          color: Colors.white,
        ),
        child: ListTile(
          leading: Icon(Icons.book),
          title: Text(
            (post.title).toUpperCase(),
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(post.author),
          trailing: Wrap(
            spacing: 7,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_post');
                  },
                  icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
