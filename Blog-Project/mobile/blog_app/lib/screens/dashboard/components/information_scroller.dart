import 'package:blog_app/providers/author_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationScroller extends StatefulWidget {
  const InformationScroller({Key? key}) : super(key: key);

  @override
  _InformationScrollerState createState() => _InformationScrollerState();
}

class _InformationScrollerState extends State<InformationScroller> {
  @override
  Widget build(BuildContext context) {
    // bring in provider
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);
    final AuthorProvider _authorProvider = Provider.of<AuthorProvider>(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Container(
                width: 230,
                margin: EdgeInsets.only(right: 20),
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent[400],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 2),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    )),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Number of Blog posts',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        (_blogProvider.posts.length).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 230,
                margin: EdgeInsets.only(right: 20),
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent[400],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 2),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.orange,
                      ],
                    )),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Number of Authors',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${_authorProvider.authors.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
