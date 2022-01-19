import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/error_provider.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/models/Post.dart';
import 'package:provider/provider.dart';

class ListOfPosts extends StatelessWidget {
  final Post post;
  const ListOfPosts({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);
    final PostService _postService = PostService();
    final ErrorProvider _errorProvider = Provider.of<ErrorProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                    _blogProvider.selectPost(post.id);
                    Navigator.pushNamed(context, '/edit_post');
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                onPressed: () async {
                  _blogProvider.setLoading(true);
                  Map<String, dynamic> _result =
                      await _postService.deletePostFromServer(id: post.id);
                  if (_result.containsKey('error_title')) {
                    _errorProvider.setError(_result);
                    _blogProvider.setLoading(false);
                    Navigator.pushNamed(context, '/error');
                  } else {
                    _blogProvider.removePost(post.id);
                    _blogProvider.setLoading(false);
                  }
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
