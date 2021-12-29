import 'package:flutter/material.dart';

class InformationScroller extends StatefulWidget {
  const InformationScroller({Key? key}) : super(key: key);

  @override
  _InformationScrollerState createState() => _InformationScrollerState();
}

class _InformationScrollerState extends State<InformationScroller> {
  @override
  Widget build(BuildContext context) {
    final infoHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Container(
              width: 200,
              margin: EdgeInsets.only(right: 20),
              height: infoHeight * 0.2,
              decoration: BoxDecoration(color: Colors.purpleAccent[400]),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [Text('Number of Blog posts'), Text('30')],
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(right: 20),
              height: infoHeight * 0.2,
              decoration: BoxDecoration(color: Colors.purpleAccent[400]),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [Text('Number of Blog posts'), Text('30')],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
