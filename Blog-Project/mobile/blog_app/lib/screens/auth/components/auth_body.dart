import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/auth/components/rounded_inputfield.dart';
import 'package:blog_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/screens/auth/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  // form input states
  String _email = "";
  String _password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    //this size provide us with total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return _authProvider.loading
        ? Loading()
        : Background(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Invalid email!';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _email = value;
                      }),
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedInputField(
                      //for password
                      hintText: 'Password',
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Invalid password!';
                        } else if (value.length < 5) {
                          return 'Enter at least 5 characters';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _password = value;
                      }),
                      obscureText: true,
                    ),
                    TextButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _authProvider.signAdminIn(
                              email: _email, password: _password);
                          if (_authProvider.token == 'User not found' ||
                              _authProvider.token.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Invalid Credentials'),
                              ),
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                                context, "/dashboard");
                          }
                        }
                      },
                      child: Text('LOGIN'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
