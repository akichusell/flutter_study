import 'package:flutter/material.dart';

import '../data/memo_data.dart';

class SelectedMemo extends ChangeNotifier {
  MemoData? selectedMemo;

  void changeSelectedMemo(MemoData memo) {
    selectedMemo = memo;
    notifyListeners();
  }

  void updateMemoTitle(String title) {
    selectedMemo?.title = title;
    notifyListeners();
  }

  void updateMemoContent(String content) {
    selectedMemo?.content = content;
    notifyListeners();
  }
}