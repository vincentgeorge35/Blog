import 'package:blog_app/models/Post.dart';
import 'package:flutter/material.dart';

Card postCard(int index) {
  return Card(
    elevation: 12.0,
    shadowColor: Colors.white70,
    margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              (posts[index].title).toUpperCase(),
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            subtitle: Text(
              posts[index].body,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('READ MORE'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
    ),
  );
}
