import 'package:flutter/material.dart';

class MobileScreenProvider with ChangeNotifier {
  int _screen = 0;

  get screen => _screen;

  set screen(value) {
    _screen = value;
    notifyListeners();
  }

  
}
