import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'apps_recomendadas_record.g.dart';

abstract class AppsRecomendadasRecord
    implements Built<AppsRecomendadasRecord, AppsRecomendadasRecordBuilder> {
  static Serializer<AppsRecomendadasRecord> get serializer =>
      _$appsRecomendadasRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  BuiltList<String> get name;

  @nullable
  @BuiltValueField(wireName: 'Urlmage')
  BuiltList<String> get urlmage;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppsRecomendadasRecordBuilder builder) =>
      builder
        ..name = ListBuilder()
        ..urlmage = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appsRecomendadas');

  static Stream<AppsRecomendadasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AppsRecomendadasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  AppsRecomendadasRecord._();
  factory AppsRecomendadasRecord(
          [void Function(AppsRecomendadasRecordBuilder) updates]) =
      _$AppsRecomendadasRecord;

  static AppsRecomendadasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppsRecomendadasRecordData() =>
    serializers.toFirestore(
        AppsRecomendadasRecord.serializer,
        AppsRecomendadasRecord((a) => a
          ..name = null
          ..urlmage = null));
