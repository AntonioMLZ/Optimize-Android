import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pages2_record.g.dart';

abstract class Pages2Record
    implements Built<Pages2Record, Pages2RecordBuilder> {
  static Serializer<Pages2Record> get serializer => _$pages2RecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'PageName')
  String get pageName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(Pages2RecordBuilder builder) =>
      builder..pageName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pages2');

  static Stream<Pages2Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<Pages2Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  Pages2Record._();
  factory Pages2Record([void Function(Pages2RecordBuilder) updates]) =
      _$Pages2Record;

  static Pages2Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPages2RecordData({
  String pageName,
}) =>
    serializers.toFirestore(
        Pages2Record.serializer, Pages2Record((p) => p..pageName = pageName));
