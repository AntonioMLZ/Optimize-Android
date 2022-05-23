import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'anime_record.g.dart';

abstract class AnimeRecord implements Built<AnimeRecord, AnimeRecordBuilder> {
  static Serializer<AnimeRecord> get serializer => _$animeRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnimeRecordBuilder builder) => builder
    ..name = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('anime');

  static Stream<AnimeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AnimeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AnimeRecord._();
  factory AnimeRecord([void Function(AnimeRecordBuilder) updates]) =
      _$AnimeRecord;

  static AnimeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAnimeRecordData({
  String name,
  String img,
}) =>
    serializers.toFirestore(
        AnimeRecord.serializer,
        AnimeRecord((a) => a
          ..name = name
          ..img = img));
