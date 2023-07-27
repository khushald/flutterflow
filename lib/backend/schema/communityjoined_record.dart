import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityjoinedRecord extends FirestoreRecord {
  CommunityjoinedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "communityname" field.
  String? _communityname;
  String get communityname => _communityname ?? '';
  bool hasCommunityname() => _communityname != null;

  // "communityrefer" field.
  DocumentReference? _communityrefer;
  DocumentReference? get communityrefer => _communityrefer;
  bool hasCommunityrefer() => _communityrefer != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "communityoneline" field.
  String? _communityoneline;
  String get communityoneline => _communityoneline ?? '';
  bool hasCommunityoneline() => _communityoneline != null;

  // "communityimage" field.
  String? _communityimage;
  String get communityimage => _communityimage ?? '';
  bool hasCommunityimage() => _communityimage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _communityname = snapshotData['communityname'] as String?;
    _communityrefer = snapshotData['communityrefer'] as DocumentReference?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _communityoneline = snapshotData['communityoneline'] as String?;
    _communityimage = snapshotData['communityimage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('communityjoined')
          : FirebaseFirestore.instance.collectionGroup('communityjoined');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('communityjoined').doc();

  static Stream<CommunityjoinedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityjoinedRecord.fromSnapshot(s));

  static Future<CommunityjoinedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityjoinedRecord.fromSnapshot(s));

  static CommunityjoinedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityjoinedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityjoinedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityjoinedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityjoinedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityjoinedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityjoinedRecordData({
  String? communityname,
  DocumentReference? communityrefer,
  DocumentReference? userref,
  String? communityoneline,
  String? communityimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'communityname': communityname,
      'communityrefer': communityrefer,
      'userref': userref,
      'communityoneline': communityoneline,
      'communityimage': communityimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityjoinedRecordDocumentEquality
    implements Equality<CommunityjoinedRecord> {
  const CommunityjoinedRecordDocumentEquality();

  @override
  bool equals(CommunityjoinedRecord? e1, CommunityjoinedRecord? e2) {
    return e1?.communityname == e2?.communityname &&
        e1?.communityrefer == e2?.communityrefer &&
        e1?.userref == e2?.userref &&
        e1?.communityoneline == e2?.communityoneline &&
        e1?.communityimage == e2?.communityimage;
  }

  @override
  int hash(CommunityjoinedRecord? e) => const ListEquality().hash([
        e?.communityname,
        e?.communityrefer,
        e?.userref,
        e?.communityoneline,
        e?.communityimage
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityjoinedRecord;
}
