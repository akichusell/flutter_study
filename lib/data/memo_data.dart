class MemoData {
  int id;
  String title;
  String content;
  DateTime createdDate;

  MemoData({
    this.title = "",
    this.content = "",
    int? id,
    DateTime? createdDate
  }): id = id ?? _CreateMemoDataId._getId(),
        createdDate = createdDate ?? DateTime.now();

  static MemoData fromJson(Map<dynamic, dynamic> map) {
    return MemoData(
      id : map["id"] as int,
      title: map["title"] as String,
      content: map["content"] as String,
      createdDate: DateTime.parse(map["createdDate"] as String),
    );
  }

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic> {
    "id" : id,
    "title" : title.toString(),
    "content" : content.toString(),
    "createdDate" : createdDate,
  };

  // @override
  // bool operator ==(Object other) {
  //   return other is MemoData &&
  //     other.runtimeType == runtimeType &&
  //     other.id == id;
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