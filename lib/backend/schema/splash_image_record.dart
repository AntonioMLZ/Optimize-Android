import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'splash_image_record.g.dart';

abstract class SplashImageRecord
    implements Built<SplashImageRecord, SplashImageRecordBuilder> {
  static Serializer<SplashImageRecord> get serializer =>
      _$splashImageRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Image')
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SplashImageRecordBuilder builder) =>
      builder..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('splashImage');

  static Stream<SplashImageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SplashImageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SplashImageRecord._();
  factory SplashImageRecord([void Function(SplashImageRecordBuilder) updates]) =
      _$SplashImageRecord;

  static SplashImageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSplashImageRecordData({
  String image,
}) =>
    serializers.toFirestore(SplashImageRecord.serializer,
        SplashImageRecord((s) => s..image = image));
