import 'memo_data.dart';
import 'dart:core';

class MemoDatabase {
  static final dataList = List<MemoData>.generate(100,
          (i) => MemoData(title: "title $i",
                          content: "content $i"),
      growable: true);
}