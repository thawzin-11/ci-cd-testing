import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool isLoggedIn() {
    return _isLoggedIn;
  }

  dynamic get currentUser {}
}
