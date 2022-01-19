import 'package:blog_app/models/Post.dart';
import 'package:blog_app/providers/author_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/error_provider.dart';
import 'package:blog_app/screens/auth/components/background.dart';
import 'package:blog_app/screens/auth/components/rounded_inputfield.dart';
import 'package:blog_app/screens/auth/components/textfield_container.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:blog_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPost extends StatefulWidget {
  const EditPost({Key? key}) : super(key: key);

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  // form input states
  String title = "";
  String author = "";
  String body = "";

  final _formKey = GlobalKey<FormState>(); // form validation
  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    // bring in provider
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);
    final AuthorProvider _authorProvider = Provider.of<AuthorProvider>(context);
    final ErrorProvider _errorProvider = Provider.of<ErrorProvider>(context);

    return _blogProvider.loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text("Edit Post"),
              centerTitle: true,
            ),
            body: Background(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      RoundedInputField(
                        initialValue:
                            "${_blogProvider.posts.firstWhere((post) => post.id == _blogProvider.selectedPostId).title}",
                        onChanged: (value) => setState(() {
                          title = value;
                        }),
                        hintText:
                            "${_blogProvider.posts.firstWhere((post) => post.id == _blogProvider.selectedPostId).title}",
                        icon: Icons.title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldContainer(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: author.isNotEmpty ? author : null,
                              hint: Text('${_blogProvider.posts.firstWhere((post) => post.id == _blogProvider.selectedPostId).author}'),
                              icon: Icon(Icons.keyboard_arrow_down),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              items: _authorProvider.authors
                                  .map(
                                    (author) => DropdownMenuItem(
                                      value: author.firstName +
                                          ' ' +
                                          author.lastName,
                                      child: Text(
                                          '${author.firstName} ${author.lastName}'),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) => setState(() {
                                author = value.toString();
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 300,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: bgColor, blurRadius: 1.0)
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue:
                                  "${_blogProvider.posts.firstWhere((post) => post.id == _blogProvider.selectedPostId).body}",
                              onChanged: (value) => setState(() {
                                body = value;
                              }),
                              maxLines: null,
                              minLines: 6,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration.collapsed(
                                hintText:
                                    "${_blogProvider.posts.firstWhere((post) => post.id == _blogProvider.selectedPostId).body}",
                                border: InputBorder.none,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.blue[300],
                              textStyle: TextStyle(
                                  fontSize: 18, fontFamily: 'Roboto')),
                          onPressed: () async {
                            _blogProvider.setLoading(true);
                            title = title.isEmpty
                                ? _blogProvider.posts
                                    .firstWhere((post) =>
                                        post.id == _blogProvider.selectedPostId)
                                    .title
                                : title;
                            author = author.isEmpty
                                ? _blogProvider.posts
                                    .firstWhere((post) =>
                                        post.id == _blogProvider.selectedPostId)
                                    .author
                                : author;
                            body = body.isEmpty
                                ? _blogProvider.posts
                                    .firstWhere((post) =>
                                        post.id == _blogProvider.selectedPostId)
                                    .body
                                : body;
                            Map<String, dynamic> _result =
                                await _postService.updateExistingPostFromData(
                                    id: _blogProvider.selectedPostId,
                                    title: title,
                                    author: author,
                                    body: body);
                            if (_result.containsKey('error_title')) {
                              _errorProvider.setError(_result);
                              _blogProvider.setLoading(false);
                              Navigator.pushNamed(context, '/error');
                            } else {
                              _blogProvider
                                  .updateExistingPost(Post.fromJson(_result['success']));
                              _blogProvider.setLoading(false);
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Submit')),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
