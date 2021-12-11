import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getPosts() {
    Future.delayed(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 65.0,
        ),
      ),
    );
  }
}
