import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'name_cap_record.g.dart';

abstract class NameCapRecord
    implements Built<NameCapRecord, NameCapRecordBuilder> {
  static Serializer<NameCapRecord> get serializer => _$nameCapRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get link;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(NameCapRecordBuilder builder) => builder
    ..name = ''
    ..link = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('nameCap')
          : FirebaseFirestore.instance.collectionGroup('nameCap');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('nameCap').doc();

  static Stream<NameCapRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NameCapRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NameCapRecord._();
  factory NameCapRecord([void Function(NameCapRecordBuilder) updates]) =
      _$NameCapRecord;

  static NameCapRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNameCapRecordData({
  String name,
  String link,
}) =>
    serializers.toFirestore(
        NameCapRecord.serializer,
        NameCapRecord((n) => n
          ..name = name
          ..link = link));
