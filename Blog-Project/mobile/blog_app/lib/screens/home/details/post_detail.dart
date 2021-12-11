import 'package:blog_app/models/Post.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      post.body,
                      style: TextStyle(
                        fontSize: 24.0,
                        letterSpacing: 1.7,
                        height: 1.5,
                        wordSpacing: 2.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: mDefaultSize * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.amber[900],
                              size: 18.0,
                            ),
                            SizedBox(width: mDefaultSize / 4),
                            Text(
                              '${post.author}',
                              style: TextStyle(
                                fontSize: 21.0,
                                letterSpacing: 1.2,
                                height: 1.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[900],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              color: Colors.amber[900],
                              size: 18.0,
                            ),
                            SizedBox(width: mDefaultSize / 4),
                            Text(
                              '${DateFormat.yMMMEd().format(post.date)}',
                              style: TextStyle(
                                fontSize: 21.0,
                                letterSpacing: 1.2,
                                height: 1.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[900],
                              ),
                            ),
                          ],
                        ),
                      ],
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
