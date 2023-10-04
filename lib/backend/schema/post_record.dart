import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postdescrition" field.
  String? _postdescrition;
  String get postdescrition => _postdescrition ?? '';
  bool hasPostdescrition() => _postdescrition != null;

  // "postimage" field.
  String? _postimage;
  String get postimage => _postimage ?? '';
  bool hasPostimage() => _postimage != null;

  // "posttag" field.
  String? _posttag;
  String get posttag => _posttag ?? '';
  bool hasPosttag() => _posttag != null;

  // "posttype" field.
  String? _posttype;
  String get posttype => _posttype ?? '';
  bool hasPosttype() => _posttype != null;

  // "post_community" field.
  DocumentReference? _postCommunity;
  DocumentReference? get postCommunity => _postCommunity;
  bool hasPostCommunity() => _postCommunity != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "communityname" field.
  String? _communityname;
  String get communityname => _communityname ?? '';
  bool hasCommunityname() => _communityname != null;

  // "communityimage" field.
  String? _communityimage;
  String get communityimage => _communityimage ?? '';
  bool hasCommunityimage() => _communityimage != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "userimage" field.
  String? _userimage;
  String get userimage => _userimage ?? '';
  bool hasUserimage() => _userimage != null;

  // "likedbyuser" field.
  List<DocumentReference>? _likedbyuser;
  List<DocumentReference> get likedbyuser => _likedbyuser ?? const [];
  bool hasLikedbyuser() => _likedbyuser != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "communitypost" field.
  bool? _communitypost;
  bool get communitypost => _communitypost ?? false;
  bool hasCommunitypost() => _communitypost != null;

  // "posttime" field.
  DateTime? _posttime;
  DateTime? get posttime => _posttime;
  bool hasPosttime() => _posttime != null;

  // "sharedby" field.
  List<DocumentReference>? _sharedby;
  List<DocumentReference> get sharedby => _sharedby ?? const [];
  bool hasSharedby() => _sharedby != null;

  // "commentby" field.
  List<DocumentReference>? _commentby;
  List<DocumentReference> get commentby => _commentby ?? const [];
  bool hasCommentby() => _commentby != null;

  // "multipleimage" field.
  List<String>? _multipleimage;
  List<String> get multipleimage => _multipleimage ?? const [];
  bool hasMultipleimage() => _multipleimage != null;

  // "comment" field.
  List<String>? _comment;
  List<String> get comment => _comment ?? const [];
  bool hasComment() => _comment != null;

  void _initializeFields() {
    _postdescrition = snapshotData['postdescrition'] as String?;
    _postimage = snapshotData['postimage'] as String?;
    _posttag = snapshotData['posttag'] as String?;
    _posttype = snapshotData['posttype'] as String?;
    _postCommunity = snapshotData['post_community'] as DocumentReference?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _communityname = snapshotData['communityname'] as String?;
    _communityimage = snapshotData['communityimage'] as String?;
    _username = snapshotData['username'] as String?;
    _userimage = snapshotData['userimage'] as String?;
    _likedbyuser = getDataList(snapshotData['likedbyuser']);
    _uid = snapshotData['uid'] as String?;
    _communitypost = snapshotData['communitypost'] as bool?;
    _posttime = snapshotData['posttime'] as DateTime?;
    _sharedby = getDataList(snapshotData['sharedby']);
    _commentby = getDataList(snapshotData['commentby']);
    _multipleimage = getDataList(snapshotData['multipleimage']);
    _comment = getDataList(snapshotData['comment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? postdescrition,
  String? postimage,
  String? posttag,
  String? posttype,
  DocumentReference? postCommunity,
  DocumentReference? postUser,
  String? communityname,
  String? communityimage,
  String? username,
  String? userimage,
  String? uid,
  bool? communitypost,
  DateTime? posttime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postdescrition': postdescrition,
      'postimage': postimage,
      'posttag': posttag,
      'posttype': posttype,
      'post_community': postCommunity,
      'post_user': postUser,
      'communityname': communityname,
      'communityimage': communityimage,
      'username': username,
      'userimage': userimage,
      'uid': uid,
      'communitypost': communitypost,
      'posttime': posttime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postdescrition == e2?.postdescrition &&
        e1?.postimage == e2?.postimage &&
        e1?.posttag == e2?.posttag &&
        e1?.posttype == e2?.posttype &&
        e1?.postCommunity == e2?.postCommunity &&
        e1?.postUser == e2?.postUser &&
        e1?.communityname == e2?.communityname &&
        e1?.communityimage == e2?.communityimage &&
        e1?.username == e2?.username &&
        e1?.userimage == e2?.userimage &&
        listEquality.equals(e1?.likedbyuser, e2?.likedbyuser) &&
        e1?.uid == e2?.uid &&
        e1?.communitypost == e2?.communitypost &&
        e1?.posttime == e2?.posttime &&
        listEquality.equals(e1?.sharedby, e2?.sharedby) &&
        listEquality.equals(e1?.commentby, e2?.commentby) &&
        listEquality.equals(e1?.multipleimage, e2?.multipleimage) &&
        listEquality.equals(e1?.comment, e2?.comment);
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postdescrition,
        e?.postimage,
        e?.posttag,
        e?.posttype,
        e?.postCommunity,
        e?.postUser,
        e?.communityname,
        e?.communityimage,
        e?.username,
        e?.userimage,
        e?.likedbyuser,
        e?.uid,
        e?.communitypost,
        e?.posttime,
        e?.sharedby,
        e?.commentby,
        e?.multipleimage,
        e?.comment
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
