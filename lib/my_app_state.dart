import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  String username = "John Doe";
  String email = "johndoe@example.com";

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
