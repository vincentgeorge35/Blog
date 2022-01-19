import 'dart:io';

import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/author_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/error_provider.dart';
import 'package:blog_app/screens/dashboard/components/create_post.dart';
import 'package:blog_app/screens/dashboard/dashboard.dart';
import 'package:blog_app/screens/home/blog_home.dart';
import 'package:blog_app/screens/auth/login.dart';
import 'package:blog_app/shared/errors.dart';
import 'package:blog_app/shared/http_override.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/screens/dashboard/components/edit_post.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BlogProvider()),
        ChangeNotifierProvider(create: (_) => AuthorProvider()),
        ChangeNotifierProvider(create: (_) => ErrorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BLOG APP',
        initialRoute: '/home',
        routes: {
          '/home': (context) => BlogHome(),
          '/login': (context) => Login(),
          '/dashboard': (context) => Dashboard(),
          '/edit_post': (context) => EditPost(),
          '/create_post': (context) => CreatePost(),
          '/error': (context) => DisplayError(),
        },
      ),
    );
  }
}
