import 'package:blog_app/screens/auth/components/rounded_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/screens/auth/components/background.dart';
import 'package:flutter_svg/svg.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this size provide us with total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: SvgPicture.asset(
              'assets/icons/login2.svg',
              height: size.height * 0.2,
            ),
          ),
          RoundedInputField(
            //for email
            hintText: "Email Address",
            onChanged: (value) {},
            icon: Icons.email,
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          RoundedInputField(
            //for password
            hintText: 'Password',
            icon: Icons.lock,
            onChanged: (value) {},
            suffix: Icons.visibility,
            obscureText: true,
          ),
          TextButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('LOGIN')),
        ],
      ),
    );
  }
}
