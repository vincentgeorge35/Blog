import 'dart:convert';

import 'package:blog_app/models/Author.dart';
import 'package:http/http.dart' as http;

class AuthorService {
  List<Author> authorList = [];

  Future<List<Author>> getApiDataFromAuthor() async {
    try {
      // getting posts from api
      var response =
          await http.get(Uri.parse('https://localhost:5001/api/author/getall'));
      var jsonResponse = jsonDecode(response.body);
      List itemCount = jsonResponse;

      itemCount.forEach((item) {
        authorList.add(Author.fromJson(item));
      });

      return authorList;
    } catch (e) {
      print('Error while fetching authors from api');
      throw e;
    }
  }
}
