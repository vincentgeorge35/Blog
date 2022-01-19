import 'package:blog_app/models/Author.dart';
import 'package:blog_app/services/author_service.dart';
import 'package:flutter/material.dart';

class AuthorProvider extends ChangeNotifier {
  // field variables
  bool _loading = false;
  List<Author> _authors = [];
  AuthorService _authorService = AuthorService();

  List<Author> get authors => _authors;
  bool get loading => _loading; // getter

  AuthorProvider() {
    setupAuthors();
  }

  Future<void> setupAuthors() async {
    await getDataFromApi();
  }

  getDataFromApi() async {
    _loading = true;
    _authors = await _authorService.getApiDataFromAuthor();
    _loading = false;
    notifyListeners();
  }
}
