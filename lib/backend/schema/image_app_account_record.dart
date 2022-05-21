import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'image_app_account_record.g.dart';

abstract class ImageAppAccountRecord
    implements Built<ImageAppAccountRecord, ImageAppAccountRecordBuilder> {
  static Serializer<ImageAppAccountRecord> get serializer =>
      _$imageAppAccountRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Image')
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImageAppAccountRecordBuilder builder) =>
      builder..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ImageAppAccount');

  static Stream<ImageAppAccountRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ImageAppAccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImageAppAccountRecord._();
  factory ImageAppAccountRecord(
          [void Function(ImageAppAccountRecordBuilder) updates]) =
      _$ImageAppAccountRecord;

  static ImageAppAccountRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createImageAppAccountRecordData({
  String image,
}) =>
    serializers.toFirestore(ImageAppAccountRecord.serializer,
        ImageAppAccountRecord((i) => i..image = image));
