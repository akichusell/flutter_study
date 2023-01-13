import 'package:flutter/material.dart';

import 'memo_data.dart';
import 'memo_database.dart';

class SelectedMemo extends ChangeNotifier {
  MemoData selectedMemo = MemoDatabase.dataList[0];

  void changeSelectedMemo(MemoData memo) {
    selectedMemo = memo;
    notifyListeners();
  }

  void updateMemoTitle(String title) {
    selectedMemo.title = title;
    notifyListeners();
  }

  void updateMemoContent(String content) {
    selectedMemo.content = content;
    notifyListeners();
  }
}