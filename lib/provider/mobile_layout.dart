import 'package:flutter/foundation.dart';

class MobileLayout extends ChangeNotifier {
  bool mobileLayout = false;

  void updateMobileLayout(bool mobileLayout) {
    if (this.mobileLayout != mobileLayout) {
      this.mobileLayout = mobileLayout;
      notifyListeners();
    }
  }
}