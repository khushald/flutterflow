import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsertagsRecord extends FirestoreRecord {
  UsertagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tagname" field.
  String? _tagname;
  String get tagname => _tagname ?? '';
  bool hasTagname() => _tagname != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tagname = snapshotData['tagname'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('usertags')
          : FirebaseFirestore.instance.collectionGroup('usertags');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('usertags').doc();

  static Stream<UsertagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsertagsRecord.fromSnapshot(s));

  static Future<UsertagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsertagsRecord.fromSnapshot(s));

  static UsertagsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsertagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsertagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsertagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsertagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsertagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsertagsRecordData({
  String? tagname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tagname': tagname,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsertagsRecordDocumentEquality implements Equality<UsertagsRecord> {
  const UsertagsRecordDocumentEquality();

  @override
  bool equals(UsertagsRecord? e1, UsertagsRecord? e2) {
    return e1?.tagname == e2?.tagname;
  }

  @override
  int hash(UsertagsRecord? e) => const ListEquality().hash([e?.tagname]);

  @override
  bool isValidKey(Object? o) => o is UsertagsRecord;
}
