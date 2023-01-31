import 'package:flutter/foundation.dart';

import 'dart:core';

import 'package:realm/realm.dart';

part 'memo_database.g.dart';

@RealmModel()
class _Memo {
  late int id;
  late String title;
  late String content;
  late DateTime createdDate;
}

class IdGenerator {
  static int startId = 0;

  static int getId() {
    return startId++;
  }
}

class MemoDatabase extends ChangeNotifier {
  late Realm realm;

  MemoDatabase() {
    realm = Realm(Configuration.local([Memo.schema]));
  }

  @override
  void dispose() {
    super.dispose();

    if (!realm.isClosed) {
      realm.close();
    }
  }

  int length() {
    return realm.all<Memo>().length;
  }

  Memo getMemo(int index) {
    return realm.all<Memo>()[index];
  }

  Memo createNewMemo() {
    var memo = Memo(IdGenerator.getId(), "", "", DateTime.now());
    realm.write(() => realm.add(memo));

    notifyListeners();
    return memo;
  }

  void updateMemoTitle(Memo memo, String title) {
    realm.write(() => memo.title = title);
    notifyListeners();
  }

  void updateMemoContent(Memo memo, String content) {
    realm.write(() => memo.content = content);
    notifyListeners();
  }


}