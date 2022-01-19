import 'package:blog_app/providers/author_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/error_provider.dart';
import 'package:blog_app/screens/auth/components/rounded_inputfield.dart';
import 'package:blog_app/screens/auth/components/textfield_container.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/screens/auth/components/background.dart';
import 'package:blog_app/models/Post.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
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
              title: Text("Create a Post"),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() {
                          title = value;
                        }),
                        hintText: "Title",
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
                              hint: Text('Select author'),
                              icon: Icon(Icons.keyboard_arrow_down),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              items: _authorProvider.authors
                                  .map(
                                    (author) => DropdownMenuItem(
                                      value: author.firstName + ' ' + author.lastName,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Body is required';
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                body = value;
                              }),
                              maxLines: null,
                              minLines: 6,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration.collapsed(
                                hintText: "...type the post body here...",
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
                            if (_formKey.currentState!.validate()) {
                              _blogProvider.setLoading(true);
                              Map<String, dynamic> _result =
                                  await _postService.createNewPostFromData(
                                      title: title, author: author, body: body);
                              if (_result.containsKey('error_title')) {
                                _errorProvider.setError(_result);
                                _blogProvider.setLoading(false);
                                Navigator.pushNamed(context, '/error');
                              } else {
                                _blogProvider
                                    .addNewPost(Post.fromJson(_result));
                                _blogProvider.setLoading(false);
                                Navigator.pop(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Can't Submit Post!")),
                              );
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
