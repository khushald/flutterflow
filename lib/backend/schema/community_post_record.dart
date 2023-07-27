import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityPostRecord extends FirestoreRecord {
  CommunityPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "communityname" field.
  String? _communityname;
  String get communityname => _communityname ?? '';
  bool hasCommunityname() => _communityname != null;

  // "communityref" field.
  DocumentReference? _communityref;
  DocumentReference? get communityref => _communityref;
  bool hasCommunityref() => _communityref != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "communityprofieimage" field.
  String? _communityprofieimage;
  String get communityprofieimage => _communityprofieimage ?? '';
  bool hasCommunityprofieimage() => _communityprofieimage != null;

  // "likedbyuser" field.
  List<DocumentReference>? _likedbyuser;
  List<DocumentReference> get likedbyuser => _likedbyuser ?? const [];
  bool hasLikedbyuser() => _likedbyuser != null;

  void _initializeFields() {
    _communityname = snapshotData['communityname'] as String?;
    _communityref = snapshotData['communityref'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _tag = snapshotData['tag'] as String?;
    _type = snapshotData['type'] as String?;
    _communityprofieimage = snapshotData['communityprofieimage'] as String?;
    _likedbyuser = getDataList(snapshotData['likedbyuser']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('community_post');

  static Stream<CommunityPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityPostRecord.fromSnapshot(s));

  static Future<CommunityPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityPostRecord.fromSnapshot(s));

  static CommunityPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityPostRecordData({
  String? communityname,
  DocumentReference? communityref,
  String? description,
  String? image,
  String? tag,
  String? type,
  String? communityprofieimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'communityname': communityname,
      'communityref': communityref,
      'description': description,
      'image': image,
      'tag': tag,
      'type': type,
      'communityprofieimage': communityprofieimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityPostRecordDocumentEquality
    implements Equality<CommunityPostRecord> {
  const CommunityPostRecordDocumentEquality();

  @override
  bool equals(CommunityPostRecord? e1, CommunityPostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.communityname == e2?.communityname &&
        e1?.communityref == e2?.communityref &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.tag == e2?.tag &&
        e1?.type == e2?.type &&
        e1?.communityprofieimage == e2?.communityprofieimage &&
        listEquality.equals(e1?.likedbyuser, e2?.likedbyuser);
  }

  @override
  int hash(CommunityPostRecord? e) => const ListEquality().hash([
        e?.communityname,
        e?.communityref,
        e?.description,
        e?.image,
        e?.tag,
        e?.type,
        e?.communityprofieimage,
        e?.likedbyuser
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityPostRecord;
}
