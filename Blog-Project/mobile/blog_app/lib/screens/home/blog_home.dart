import 'package:blog_app/screens/home/components/body.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:flutter/material.dart';

class BlogHome extends StatefulWidget {
  const BlogHome({Key? key}) : super(key: key);

  @override
  State<BlogHome> createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: mDefaultSize / 1.5),
        child: Text(
          'Listacc blog',
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
          ),
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.blue[400],
    );
  }
}
