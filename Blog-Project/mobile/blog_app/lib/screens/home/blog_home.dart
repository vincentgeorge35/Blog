import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/screens/home/components/body.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:blog_app/shared/errors.dart';
import 'package:blog_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogHome extends StatefulWidget {
  const BlogHome({Key? key}) : super(key: key);

  @override
  State<BlogHome> createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);

    return _blogProvider.loading ? _blogProvider.serverError ? DisplayError() : Loading() : Scaffold(
      backgroundColor: bgColor,
      appBar: _authProvider.token.isEmpty
          ? buildAppBar()
          : buildAppBar(loggedIn: true),
      body: Body(),
    );
  }

  AppBar buildAppBar({bool loggedIn = false}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(bottom: mDefaultSize / 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Listacc blog',
              style: TextStyle(
                color: Colors.grey[50],
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Manrope',
              ),
            ),
            SizedBox(
              width: 40,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                loggedIn
                    ? Navigator.pushReplacementNamed(context, '/dashboard')
                    : Navigator.pushNamed(context, '/login');
              },
              icon: Icon(
                loggedIn ? Icons.person : Icons.login,
                color: Colors.white,
                size: mDefaultSize,
              ),
              label: Text(
                loggedIn ? 'Dash' : 'Login',
                style: TextStyle(
                  fontSize: mDefaultSize,
                ),
              ),
            )
          ],
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: primaryColor,
    );
  }
}
