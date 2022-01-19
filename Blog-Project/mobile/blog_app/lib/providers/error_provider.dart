import 'package:flutter/material.dart';

class ErrorProvider extends ChangeNotifier {
  Map<String, dynamic> _error = {};

  Map<String, dynamic> get error => _error;

  setError(Map<String, dynamic> error) {
    _error = error;
    notifyListeners();
  }
}
