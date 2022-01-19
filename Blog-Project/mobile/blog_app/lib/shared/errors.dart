import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/error_provider.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayError extends StatelessWidget {
  const DisplayError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ErrorProvider _errorProvider = Provider.of<ErrorProvider>(context);
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _blogProvider.serverError
                  ? 'Error connecting to server'
                  : _errorProvider.error['error_title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
                fontSize: 23,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.blue[900],
                backgroundColor: Colors.white,
                elevation: 2.0,
              ),
              onPressed: () {
                if (_blogProvider.serverError) {
                  Navigator.popAndPushNamed(context, '/home');
                } else {
                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.arrow_circle_up_rounded),
              label: _blogProvider.serverError
                  ? Text('Try Again')
                  : Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
