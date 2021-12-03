import 'package:blog_app/screens/home/components/company_info.dart';
import 'package:flutter/material.dart';

class BlogHome extends StatelessWidget {
  const BlogHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Column(
          children: [
            CompanyInfo(),
          ],
        ),
      ),
    );
  }
}
