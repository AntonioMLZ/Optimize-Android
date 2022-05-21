import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_record.g.dart';

abstract class PostRecord implements Built<PostRecord, PostRecordBuilder> {
  static Serializer<PostRecord> get serializer => _$postRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Image')
  String get image;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Ubicacion')
  String get ubicacion;

  @nullable
  @BuiltValueField(wireName: 'Imagenesadicioonales')
  BuiltList<String> get imagenesadicioonales;

  @nullable
  String get categoria;

  @nullable
  String get cortadescripcion;

  @nullable
  @BuiltValueField(wireName: 'NameButton')
  String get nameButton;

  @nullable
  @BuiltValueField(wireName: 'LinkButton')
  String get linkButton;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostRecordBuilder builder) => builder
    ..image = ''
    ..name = ''
    ..descripcion = ''
    ..ubicacion = ''
    ..imagenesadicioonales = ListBuilder()
    ..categoria = ''
    ..cortadescripcion = ''
    ..nameButton = ''
    ..linkButton = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Post');

  static Stream<PostRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostRecord._();
  factory PostRecord([void Function(PostRecordBuilder) updates]) = _$PostRecord;

  static PostRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostRecordData({
  String image,
  String name,
  String descripcion,
  String ubicacion,
  String categoria,
  String cortadescripcion,
  String nameButton,
  String linkButton,
}) =>
    serializers.toFirestore(
        PostRecord.serializer,
        PostRecord((p) => p
          ..image = image
          ..name = name
          ..descripcion = descripcion
          ..ubicacion = ubicacion
          ..imagenesadicioonales = null
          ..categoria = categoria
          ..cortadescripcion = cortadescripcion
          ..nameButton = nameButton
          ..linkButton = linkButton));
