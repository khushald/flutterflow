import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunitymemberRecord extends FirestoreRecord {
  CommunitymemberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "membername" field.
  String? _membername;
  String get membername => _membername ?? '';
  bool hasMembername() => _membername != null;

  // "memberref" field.
  DocumentReference? _memberref;
  DocumentReference? get memberref => _memberref;
  bool hasMemberref() => _memberref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _membername = snapshotData['membername'] as String?;
    _memberref = snapshotData['memberref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Communitymember')
          : FirebaseFirestore.instance.collectionGroup('Communitymember');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Communitymember').doc();

  static Stream<CommunitymemberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunitymemberRecord.fromSnapshot(s));

  static Future<CommunitymemberRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunitymemberRecord.fromSnapshot(s));

  static CommunitymemberRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunitymemberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunitymemberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunitymemberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunitymemberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunitymemberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunitymemberRecordData({
  String? membername,
  DocumentReference? memberref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'membername': membername,
      'memberref': memberref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunitymemberRecordDocumentEquality
    implements Equality<CommunitymemberRecord> {
  const CommunitymemberRecordDocumentEquality();

  @override
  bool equals(CommunitymemberRecord? e1, CommunitymemberRecord? e2) {
    return e1?.membername == e2?.membername && e1?.memberref == e2?.memberref;
  }

  @override
  int hash(CommunitymemberRecord? e) =>
      const ListEquality().hash([e?.membername, e?.memberref]);

  @override
  bool isValidKey(Object? o) => o is CommunitymemberRecord;
}
