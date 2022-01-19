import 'package:blog_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _userToken = "";
  bool _loading = false;
  AuthService _authService = AuthService();

  bool get loading => _loading;
  String get token => _userToken;

  Future<void> signAdminIn(
      {required String email, required String password}) async {
    _loading = true;
    _userToken = await _authService.signIn(email: email, password: password);
    _loading = false;
    notifyListeners();
  }
}
