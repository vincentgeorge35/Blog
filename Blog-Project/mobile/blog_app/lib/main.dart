import 'package:blog_app/screens/dashboard/dashboard.dart';
import 'package:blog_app/screens/home/blog_home.dart';
import 'package:blog_app/screens/auth/login.dart';
import 'package:blog_app/shared/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLOG APP',
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => BlogHome(),
        '/login':(context) => Login(),
        '/dashboard':(context) => Dashboard(),
      },
    );
  }
}

