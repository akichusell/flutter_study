import 'package:flutter/widgets.dart';

import '../data/memo_database.dart';

class SelectedMemo extends ChangeNotifier {
  Memo? selectedMemo;

  void changeSelectedMemo(Memo memo) {
    selectedMemo = memo;
    notifyListeners();
  }
}