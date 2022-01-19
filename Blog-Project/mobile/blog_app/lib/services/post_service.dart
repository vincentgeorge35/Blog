import 'dart:convert';

import 'package:blog_app/models/Post.dart';
import 'package:http/http.dart' as http;

class PostService {
  List<Post> postList = [];

  //* Fetch posts function(Read)
  Future<List<Post>> getApiDataFromPost() async {
    try {
      // getting posts from api
      var response =
          await http.get(Uri.parse('https://10.0.2.2:5001/api/post'));
      var jsonResponse = jsonDecode(response.body);
      List itemCount = jsonResponse;

      itemCount.forEach((item) {
        postList.add(Post.fromJson(item));
      });

      return postList;
    } catch (e) {
      throw e;
    }
  }

  //* Create post function
  Future<Map<String, dynamic>> createNewPostFromData(
      {required String title,
      required String author,
      required String body}) async {
    try {
      // sending data to api
      var response = await http.post(
        Uri.parse('https://10.0.2.2:5001/api/post/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Title": title,
          "Author": author,
          "Body": body,
        }),
      );
      var jsonResponse = jsonDecode(response.body);
      var item = jsonResponse;

      return item;
    } catch (e) {
      return {
        'error_title': 'Error while sending new post to server',
        'fromRoute': '/create_post'
      };
    }
  }

  //* Update post function
  Future<Map<String, dynamic>> updateExistingPostFromData(
      {required int id,
      required String title,
      required String author,
      required String body}) async {
    try {
      // sending data to api
      var response = await http.put(
        Uri.parse('https://10.0.2.2:5001/api/post/update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "Id": id,
          "Title": title,
          "Author": author,
          "Body": body,
        }),
      );
      var jsonResponse = jsonDecode(response.body);
      var item = jsonResponse;

      return {'success': item};
    } catch (e) {
      return {
        'error_title': 'Error while trying to update post',
        'fromRoute': '/edit_post'
      };
    }
  }

  //* Delete post function
  Future<Map<String, dynamic>> deletePostFromServer({required int id}) async {
    try {
      // deleting post from api
      var response = await http
          .delete(Uri.parse('https://10.0.2.2:5001/api/post/Delete/$id'));
      var item = response.body.toString();

      return {'success': item};
    } catch (e) {
      return {
        'error_title': 'Error while deleting new post from server',
        'fromRoute': '/dashboard'
      };
    }
  }
}
