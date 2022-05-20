import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'apps_record.g.dart';

abstract class AppsRecord implements Built<AppsRecord, AppsRecordBuilder> {
  static Serializer<AppsRecord> get serializer => _$appsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'DescripcionCorta')
  String get descripcionCorta;

  @nullable
  @BuiltValueField(wireName: 'LinkDescargar')
  String get linkDescargar;

  @nullable
  @BuiltValueField(wireName: 'LinkImage')
  String get linkImage;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppsRecordBuilder builder) => builder
    ..name = ''
    ..descripcionCorta = ''
    ..linkDescargar = ''
    ..linkImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('apps');

  static Stream<AppsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AppsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AppsRecord._();
  factory AppsRecord([void Function(AppsRecordBuilder) updates]) = _$AppsRecord;

  static AppsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppsRecordData({
  String name,
  String descripcionCorta,
  String linkDescargar,
  String linkImage,
}) =>
    serializers.toFirestore(
        AppsRecord.serializer,
        AppsRecord((a) => a
          ..name = name
          ..descripcionCorta = descripcionCorta
          ..linkDescargar = linkDescargar
          ..linkImage = linkImage));
