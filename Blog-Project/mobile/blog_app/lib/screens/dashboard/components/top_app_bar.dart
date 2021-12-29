import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.5,
              child: Text(
                'Hello,',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              'Miracle Johnson',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Container(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/bored_ape.png'),
          ),
        )
      ],
    );
  }
}
