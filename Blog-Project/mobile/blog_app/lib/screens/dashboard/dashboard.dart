import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/screens/dashboard/components/list_of_posts.dart';
import 'package:blog_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/shared/constants.dart';
import 'package:blog_app/screens/dashboard/components/top_app_bar.dart';
import 'package:blog_app/screens/dashboard/components/information_scroller.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

  @override
  void initState() {
    super.initState();
    //handle scrolling event
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final BlogProvider _blogProvider = Provider.of<BlogProvider>(context);

    Size size = MediaQuery.of(context).size;

    return _blogProvider.loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TopAppBar(),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                  width: size.width,
                  duration: const Duration(milliseconds: 400),
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : size.height * 0.23,
                  child: InformationScroller()),
              SizedBox(
                height: 8,
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: _blogProvider.posts.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListOfPosts(post: _blogProvider.posts[index]);
                      }))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/create_post");
        },
        backgroundColor: primaryColor,
        tooltip: 'Create Blog',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: bgColor,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(
                context,
                "/home"
              ),
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
