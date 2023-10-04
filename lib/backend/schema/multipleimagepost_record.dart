import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultipleimagepostRecord extends FirestoreRecord {
  MultipleimagepostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('multipleimagepost')
          : FirebaseFirestore.instance.collectionGroup('multipleimagepost');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('multipleimagepost').doc();

  static Stream<MultipleimagepostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MultipleimagepostRecord.fromSnapshot(s));

  static Future<MultipleimagepostRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MultipleimagepostRecord.fromSnapshot(s));

  static MultipleimagepostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MultipleimagepostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MultipleimagepostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MultipleimagepostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MultipleimagepostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MultipleimagepostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMultipleimagepostRecordData({
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MultipleimagepostRecordDocumentEquality
    implements Equality<MultipleimagepostRecord> {
  const MultipleimagepostRecordDocumentEquality();

  @override
  bool equals(MultipleimagepostRecord? e1, MultipleimagepostRecord? e2) {
    return e1?.image == e2?.image;
  }

  @override
  int hash(MultipleimagepostRecord? e) => const ListEquality().hash([e?.image]);

  @override
  bool isValidKey(Object? o) => o is MultipleimagepostRecord;
}
