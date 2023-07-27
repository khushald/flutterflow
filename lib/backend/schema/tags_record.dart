import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Tag_category" field.
  String? _tagCategory;
  String get tagCategory => _tagCategory ?? '';
  bool hasTagCategory() => _tagCategory != null;

  // "tagname" field.
  String? _tagname;
  String get tagname => _tagname ?? '';
  bool hasTagname() => _tagname != null;

  void _initializeFields() {
    _tagCategory = snapshotData['Tag_category'] as String?;
    _tagname = snapshotData['tagname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tags');

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  String? tagCategory,
  String? tagname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Tag_category': tagCategory,
      'tagname': tagname,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    return e1?.tagCategory == e2?.tagCategory && e1?.tagname == e2?.tagname;
  }

  @override
  int hash(TagsRecord? e) =>
      const ListEquality().hash([e?.tagCategory, e?.tagname]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
