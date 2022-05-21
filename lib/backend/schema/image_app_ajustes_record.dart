import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'image_app_ajustes_record.g.dart';

abstract class ImageAppAjustesRecord
    implements Built<ImageAppAjustesRecord, ImageAppAjustesRecordBuilder> {
  static Serializer<ImageAppAjustesRecord> get serializer =>
      _$imageAppAjustesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Image')
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImageAppAjustesRecordBuilder builder) =>
      builder..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ImageAppAjustes');

  static Stream<ImageAppAjustesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ImageAppAjustesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImageAppAjustesRecord._();
  factory ImageAppAjustesRecord(
          [void Function(ImageAppAjustesRecordBuilder) updates]) =
      _$ImageAppAjustesRecord;

  static ImageAppAjustesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createImageAppAjustesRecordData({
  String image,
}) =>
    serializers.toFirestore(ImageAppAjustesRecord.serializer,
        ImageAppAjustesRecord((i) => i..image = image));
