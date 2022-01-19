import 'package:flutter/material.dart';

import 'constants.dart';

class PostInfo extends StatelessWidget {
  final String text;
  final IconData icon;

  const PostInfo({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.amber[900],
        ),
        SizedBox(width: mDefaultSize / 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 1.0,
            color: Colors.amber[900],
            fontFamily: 'Pacifico',
          ),
        ),
      ],
    );
  }
}
