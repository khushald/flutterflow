import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileRecord extends FirestoreRecord {
  UserProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "coveerimage" field.
  String? _coveerimage;
  String get coveerimage => _coveerimage ?? '';
  bool hasCoveerimage() => _coveerimage != null;

  // "useroneline" field.
  String? _useroneline;
  String get useroneline => _useroneline ?? '';
  bool hasUseroneline() => _useroneline != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "communityjoined" field.
  List<DocumentReference>? _communityjoined;
  List<DocumentReference> get communityjoined => _communityjoined ?? const [];
  bool hasCommunityjoined() => _communityjoined != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "communityownedlist" field.
  List<DocumentReference>? _communityownedlist;
  List<DocumentReference> get communityownedlist =>
      _communityownedlist ?? const [];
  bool hasCommunityownedlist() => _communityownedlist != null;

  // "followedby" field.
  List<DocumentReference>? _followedby;
  List<DocumentReference> get followedby => _followedby ?? const [];
  bool hasFollowedby() => _followedby != null;

  // "moderator" field.
  List<DocumentReference>? _moderator;
  List<DocumentReference> get moderator => _moderator ?? const [];
  bool hasModerator() => _moderator != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bio = snapshotData['Bio'] as String?;
    _coveerimage = snapshotData['coveerimage'] as String?;
    _useroneline = snapshotData['useroneline'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _displayName = snapshotData['display_name'] as String?;
    _communityjoined = getDataList(snapshotData['communityjoined']);
    _friends = getDataList(snapshotData['friends']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _communityownedlist = getDataList(snapshotData['communityownedlist']);
    _followedby = getDataList(snapshotData['followedby']);
    _moderator = getDataList(snapshotData['moderator']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User_profile');

  static Stream<UserProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfileRecord.fromSnapshot(s));

  static Future<UserProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfileRecord.fromSnapshot(s));

  static UserProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfileRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? bio,
  String? coveerimage,
  String? useroneline,
  String? displayName,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'Bio': bio,
      'coveerimage': coveerimage,
      'useroneline': useroneline,
      'display_name': displayName,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProfileRecordDocumentEquality implements Equality<UserProfileRecord> {
  const UserProfileRecordDocumentEquality();

  @override
  bool equals(UserProfileRecord? e1, UserProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bio == e2?.bio &&
        e1?.coveerimage == e2?.coveerimage &&
        e1?.useroneline == e2?.useroneline &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.communityjoined, e2?.communityjoined) &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.communityownedlist, e2?.communityownedlist) &&
        listEquality.equals(e1?.followedby, e2?.followedby) &&
        listEquality.equals(e1?.moderator, e2?.moderator);
  }

  @override
  int hash(UserProfileRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.bio,
        e?.coveerimage,
        e?.useroneline,
        e?.tags,
        e?.displayName,
        e?.communityjoined,
        e?.friends,
        e?.phoneNumber,
        e?.communityownedlist,
        e?.followedby,
        e?.moderator
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProfileRecord;
}
