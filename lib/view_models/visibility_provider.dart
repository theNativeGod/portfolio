import 'package:flutter/material.dart';

class VisibilityProvider with ChangeNotifier {
  bool _hasVisited = false;
  bool _triggered = false;

  get hasVisited => _hasVisited;
  get triggered => _triggered;

  set hasVisited(value) {
    _hasVisited = value;
    notifyListeners();
  }

  set triggered(value) {
    _triggered = value;
    notifyListeners();
  }
}
