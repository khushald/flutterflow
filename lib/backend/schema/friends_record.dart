import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendsRecord extends FirestoreRecord {
  FriendsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "friendref" field.
  DocumentReference? _friendref;
  DocumentReference? get friendref => _friendref;
  bool hasFriendref() => _friendref != null;

  // "friendname" field.
  String? _friendname;
  String get friendname => _friendname ?? '';
  bool hasFriendname() => _friendname != null;

  // "freindoneline" field.
  String? _freindoneline;
  String get freindoneline => _freindoneline ?? '';
  bool hasFreindoneline() => _freindoneline != null;

  // "friendimage" field.
  String? _friendimage;
  String get friendimage => _friendimage ?? '';
  bool hasFriendimage() => _friendimage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _friendref = snapshotData['friendref'] as DocumentReference?;
    _friendname = snapshotData['friendname'] as String?;
    _freindoneline = snapshotData['freindoneline'] as String?;
    _friendimage = snapshotData['friendimage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Friends')
          : FirebaseFirestore.instance.collectionGroup('Friends');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Friends').doc();

  static Stream<FriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRecord.fromSnapshot(s));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRecord.fromSnapshot(s));

  static FriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRecordData({
  DocumentReference? friendref,
  String? friendname,
  String? freindoneline,
  String? friendimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'friendref': friendref,
      'friendname': friendname,
      'freindoneline': freindoneline,
      'friendimage': friendimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRecordDocumentEquality implements Equality<FriendsRecord> {
  const FriendsRecordDocumentEquality();

  @override
  bool equals(FriendsRecord? e1, FriendsRecord? e2) {
    return e1?.friendref == e2?.friendref &&
        e1?.friendname == e2?.friendname &&
        e1?.freindoneline == e2?.freindoneline &&
        e1?.friendimage == e2?.friendimage;
  }

  @override
  int hash(FriendsRecord? e) => const ListEquality()
      .hash([e?.friendref, e?.friendname, e?.freindoneline, e?.friendimage]);

  @override
  bool isValidKey(Object? o) => o is FriendsRecord;
}
