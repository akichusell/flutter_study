// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_database.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Memo extends _Memo with RealmEntity, RealmObjectBase, RealmObject {
  Memo(
    int id,
    String title,
    String content,
    DateTime createdDate,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'content', content);
    RealmObjectBase.set(this, 'createdDate', createdDate);
  }

  Memo._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get content => RealmObjectBase.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObjectBase.set(this, 'content', value);

  @override
  DateTime get createdDate =>
      RealmObjectBase.get<DateTime>(this, 'createdDate') as DateTime;
  @override
  set createdDate(DateTime value) =>
      RealmObjectBase.set(this, 'createdDate', value);

  @override
  Stream<RealmObjectChanges<Memo>> get changes =>
      RealmObjectBase.getChanges<Memo>(this);

  @override
  Memo freeze() => RealmObjectBase.freezeObject<Memo>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Memo._);
    return const SchemaObject(ObjectType.realmObject, Memo, 'Memo', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('createdDate', RealmPropertyType.timestamp),
    ]);
  }
}
