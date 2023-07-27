import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityownedRecord extends FirestoreRecord {
  CommunityownedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "communityname" field.
  String? _communityname;
  String get communityname => _communityname ?? '';
  bool hasCommunityname() => _communityname != null;

  // "communityimage" field.
  String? _communityimage;
  String get communityimage => _communityimage ?? '';
  bool hasCommunityimage() => _communityimage != null;

  // "communityoneline" field.
  String? _communityoneline;
  String get communityoneline => _communityoneline ?? '';
  bool hasCommunityoneline() => _communityoneline != null;

  // "communityref" field.
  DocumentReference? _communityref;
  DocumentReference? get communityref => _communityref;
  bool hasCommunityref() => _communityref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _communityname = snapshotData['communityname'] as String?;
    _communityimage = snapshotData['communityimage'] as String?;
    _communityoneline = snapshotData['communityoneline'] as String?;
    _communityref = snapshotData['communityref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('communityowned')
          : FirebaseFirestore.instance.collectionGroup('communityowned');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('communityowned').doc();

  static Stream<CommunityownedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityownedRecord.fromSnapshot(s));

  static Future<CommunityownedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityownedRecord.fromSnapshot(s));

  static CommunityownedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityownedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityownedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityownedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityownedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityownedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityownedRecordData({
  String? communityname,
  String? communityimage,
  String? communityoneline,
  DocumentReference? communityref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'communityname': communityname,
      'communityimage': communityimage,
      'communityoneline': communityoneline,
      'communityref': communityref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityownedRecordDocumentEquality
    implements Equality<CommunityownedRecord> {
  const CommunityownedRecordDocumentEquality();

  @override
  bool equals(CommunityownedRecord? e1, CommunityownedRecord? e2) {
    return e1?.communityname == e2?.communityname &&
        e1?.communityimage == e2?.communityimage &&
        e1?.communityoneline == e2?.communityoneline &&
        e1?.communityref == e2?.communityref;
  }

  @override
  int hash(CommunityownedRecord? e) => const ListEquality().hash([
        e?.communityname,
        e?.communityimage,
        e?.communityoneline,
        e?.communityref
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityownedRecord;
}
