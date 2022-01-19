import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class AuthService {
  // admin sign in function
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      var response = await http.post(
        // make sign in request to api
        Uri.parse('https://localhost:5001/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, String>{
          "Email": email,
          "Password": password,
        }),
      );

      var stringResponse = response.body.toString();

      return stringResponse;
    } catch (e) {
      print('Error while calling api');
      throw e;
    }
  }
}
