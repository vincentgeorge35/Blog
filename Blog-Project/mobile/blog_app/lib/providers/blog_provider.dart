import 'package:blog_app/models/Post.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:flutter/material.dart';

class BlogProvider extends ChangeNotifier {
  // field variables
  List<Post> _posts = [];
  PostService _postService = PostService();
  bool _loading = false;
  bool _serverError = false;
  int _selectedPostId = 0;

  //  getters
  bool get serverError => _serverError;
  int get selectedPostId => _selectedPostId;
  bool get loading => _loading;
  List<Post> get posts => _posts;


  selectPost(int postId) {
    _selectedPostId = postId;
    notifyListeners();
  }


  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  BlogProvider() {
    setupBlogs();
  }

  Future<void> setupBlogs() async {
    await getDataFromApi();
  }

  getDataFromApi() async {
    _loading = true;
    _posts = await _postService.getApiDataFromPost().catchError((e) {
      _serverError = true;
      print(e.toString());
      notifyListeners();
    });
    _loading = false;
    notifyListeners();
  }

  // add new post
  addNewPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }

  // update existing post
  updateExistingPost(Post post) {
    var index = _posts.indexWhere((e) => e.id == post.id);
    _posts[index] = post;
    notifyListeners();
  }

  // delete post
  removePost(int id) {
    _posts.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}
