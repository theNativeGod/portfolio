import 'package:flutter/material.dart';

class FrameProvider with WidgetsBindingObserver, ChangeNotifier {
  bool _isMobile = false;

  @override
  void didChangeMetrics() {
    print('change sized');
    super.didChangeMetrics();
  }
}
