import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pages_record.g.dart';

abstract class PagesRecord implements Built<PagesRecord, PagesRecordBuilder> {
  static Serializer<PagesRecord> get serializer => _$pagesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'PageName')
  String get pageName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PagesRecordBuilder builder) =>
      builder..pageName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pages');

  static Stream<PagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PagesRecord._();
  factory PagesRecord([void Function(PagesRecordBuilder) updates]) =
      _$PagesRecord;

  static PagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPagesRecordData({
  String pageName,
}) =>
    serializers.toFirestore(
        PagesRecord.serializer, PagesRecord((p) => p..pageName = pageName));
