import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'alertas_record.g.dart';

abstract class AlertasRecord
    implements Built<AlertasRecord, AlertasRecordBuilder> {
  static Serializer<AlertasRecord> get serializer => _$alertasRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name_Alert')
  String get nameAlert;

  @nullable
  @BuiltValueField(wireName: 'Desc')
  double get desc;

  @nullable
  @BuiltValueField(wireName: 'Image')
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AlertasRecordBuilder builder) => builder
    ..nameAlert = ''
    ..desc = 0.0
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alertas');

  static Stream<AlertasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AlertasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AlertasRecord._();
  factory AlertasRecord([void Function(AlertasRecordBuilder) updates]) =
      _$AlertasRecord;

  static AlertasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAlertasRecordData({
  String nameAlert,
  double desc,
  String image,
}) =>
    serializers.toFirestore(
        AlertasRecord.serializer,
        AlertasRecord((a) => a
          ..nameAlert = nameAlert
          ..desc = desc
          ..image = image));
