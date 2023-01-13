class MemoData {
  final int id = _CreateMemoDataId._getId();
  String title;
  String content;

  MemoData({required this.title, required this.content});

  // @override
  // bool operator ==(Object other) {
  //   return other is MemoData &&
  //       other.runtimeType == runtimeType &&
  //       other.id == id;
  // }
  //
  // @override
  // int get hashCode => id.hashCode;
}

class _CreateMemoDataId {
  static int startId = 0;

  static int _getId() {
    return startId++;
  }
}