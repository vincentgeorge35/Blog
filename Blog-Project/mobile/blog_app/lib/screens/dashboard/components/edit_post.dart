import 'package:blog_app/screens/auth/components/rounded_inputfield.dart';
import 'package:blog_app/screens/auth/components/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/screens/auth/components/background.dart';
import 'package:blog_app/models/Post.dart';
import 'package:blog_app/shared/constants.dart';

class EditPost extends StatefulWidget {
  const EditPost({Key? key}) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late Post post;
  @override
  Widget build(BuildContext context) {
    //this size provide us with total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Post"),
        centerTitle: true,
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            RoundedInputField(
              //for email
              hintText: "Post Tile",
              onChanged: (value) {
                post.title = value;
              },
              icon: Icons.edit_outlined,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldContainer(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                      isExpanded: true,
                      //value: 'Chelsea',
                      hint: Text('Select an Author'),
                      icon: Icon(Icons.keyboard_arrow_down),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      items: posts
                          .map((post) => DropdownMenuItem(
                              value: post.author, child: Text(post.author)))
                          .toList(),
                      onChanged: (String? author) {
                        setState(() {});
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 300,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: bgColor, blurRadius: 4.0)],
                    border: Border.all(width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: null,
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration.collapsed(
                        hintText: " type the post body here"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.blue[300],
                    textStyle: TextStyle(fontSize: 18, fontFamily: 'Roboto')),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/dashboard');
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
