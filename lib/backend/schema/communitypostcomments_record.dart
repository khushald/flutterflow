import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunitypostcommentsRecord extends FirestoreRecord {
  CommunitypostcommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "useroneline" field.
  String? _useroneline;
  String get useroneline => _useroneline ?? '';
  bool hasUseroneline() => _useroneline != null;

  // "userimage" field.
  String? _userimage;
  String get userimage => _userimage ?? '';
  bool hasUserimage() => _userimage != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _useroneline = snapshotData['useroneline'] as String?;
    _userimage = snapshotData['userimage'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('communitypostcomments')
          : FirebaseFirestore.instance.collectionGroup('communitypostcomments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('communitypostcomments').doc();

  static Stream<CommunitypostcommentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CommunitypostcommentsRecord.fromSnapshot(s));

  static Future<CommunitypostcommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CommunitypostcommentsRecord.fromSnapshot(s));

  static CommunitypostcommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunitypostcommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunitypostcommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunitypostcommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunitypostcommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunitypostcommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunitypostcommentsRecordData({
  String? username,
  DocumentReference? userref,
  String? useroneline,
  String? userimage,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'userref': userref,
      'useroneline': useroneline,
      'userimage': userimage,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunitypostcommentsRecordDocumentEquality
    implements Equality<CommunitypostcommentsRecord> {
  const CommunitypostcommentsRecordDocumentEquality();

  @override
  bool equals(
      CommunitypostcommentsRecord? e1, CommunitypostcommentsRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.userref == e2?.userref &&
        e1?.useroneline == e2?.useroneline &&
        e1?.userimage == e2?.userimage &&
        e1?.description == e2?.description;
  }

  @override
  int hash(CommunitypostcommentsRecord? e) => const ListEquality().hash(
      [e?.username, e?.userref, e?.useroneline, e?.userimage, e?.description]);

  @override
  bool isValidKey(Object? o) => o is CommunitypostcommentsRecord;
}
