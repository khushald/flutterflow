import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunitiesRecord extends FirestoreRecord {
  CommunitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Communityname" field.
  String? _communityname;
  String get communityname => _communityname ?? '';
  bool hasCommunityname() => _communityname != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "tag" field.
  List<String>? _tag;
  List<String> get tag => _tag ?? const [];
  bool hasTag() => _tag != null;

  // "communityimage" field.
  String? _communityimage;
  String get communityimage => _communityimage ?? '';
  bool hasCommunityimage() => _communityimage != null;

  // "communitycover" field.
  String? _communitycover;
  String get communitycover => _communitycover ?? '';
  bool hasCommunitycover() => _communitycover != null;

  // "communityoneline" field.
  String? _communityoneline;
  String get communityoneline => _communityoneline ?? '';
  bool hasCommunityoneline() => _communityoneline != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "createdtime" field.
  DateTime? _createdtime;
  DateTime? get createdtime => _createdtime;
  bool hasCreatedtime() => _createdtime != null;

  // "owners" field.
  List<DocumentReference>? _owners;
  List<DocumentReference> get owners => _owners ?? const [];
  bool hasOwners() => _owners != null;

  // "moderator" field.
  List<DocumentReference>? _moderator;
  List<DocumentReference> get moderator => _moderator ?? const [];
  bool hasModerator() => _moderator != null;

  // "blockedusers" field.
  List<DocumentReference>? _blockedusers;
  List<DocumentReference> get blockedusers => _blockedusers ?? const [];
  bool hasBlockedusers() => _blockedusers != null;

  // "request" field.
  List<DocumentReference>? _request;
  List<DocumentReference> get request => _request ?? const [];
  bool hasRequest() => _request != null;

  // "communitytypeprivate" field.
  bool? _communitytypeprivate;
  bool get communitytypeprivate => _communitytypeprivate ?? false;
  bool hasCommunitytypeprivate() => _communitytypeprivate != null;

  void _initializeFields() {
    _communityname = snapshotData['Communityname'] as String?;
    _description = snapshotData['description'] as String?;
    _tag = getDataList(snapshotData['tag']);
    _communityimage = snapshotData['communityimage'] as String?;
    _communitycover = snapshotData['communitycover'] as String?;
    _communityoneline = snapshotData['communityoneline'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _members = getDataList(snapshotData['members']);
    _createdtime = snapshotData['createdtime'] as DateTime?;
    _owners = getDataList(snapshotData['owners']);
    _moderator = getDataList(snapshotData['moderator']);
    _blockedusers = getDataList(snapshotData['blockedusers']);
    _request = getDataList(snapshotData['request']);
    _communitytypeprivate = snapshotData['communitytypeprivate'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Communities');

  static Stream<CommunitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunitiesRecord.fromSnapshot(s));

  static Future<CommunitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunitiesRecord.fromSnapshot(s));

  static CommunitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunitiesRecordData({
  String? communityname,
  String? description,
  String? communityimage,
  String? communitycover,
  String? communityoneline,
  DocumentReference? owner,
  DateTime? createdtime,
  bool? communitytypeprivate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Communityname': communityname,
      'description': description,
      'communityimage': communityimage,
      'communitycover': communitycover,
      'communityoneline': communityoneline,
      'owner': owner,
      'createdtime': createdtime,
      'communitytypeprivate': communitytypeprivate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunitiesRecordDocumentEquality implements Equality<CommunitiesRecord> {
  const CommunitiesRecordDocumentEquality();

  @override
  bool equals(CommunitiesRecord? e1, CommunitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.communityname == e2?.communityname &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.tag, e2?.tag) &&
        e1?.communityimage == e2?.communityimage &&
        e1?.communitycover == e2?.communitycover &&
        e1?.communityoneline == e2?.communityoneline &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.createdtime == e2?.createdtime &&
        listEquality.equals(e1?.owners, e2?.owners) &&
        listEquality.equals(e1?.moderator, e2?.moderator) &&
        listEquality.equals(e1?.blockedusers, e2?.blockedusers) &&
        listEquality.equals(e1?.request, e2?.request) &&
        e1?.communitytypeprivate == e2?.communitytypeprivate;
  }

  @override
  int hash(CommunitiesRecord? e) => const ListEquality().hash([
        e?.communityname,
        e?.description,
        e?.tag,
        e?.communityimage,
        e?.communitycover,
        e?.communityoneline,
        e?.owner,
        e?.members,
        e?.createdtime,
        e?.owners,
        e?.moderator,
        e?.blockedusers,
        e?.request,
        e?.communitytypeprivate
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunitiesRecord;
}
