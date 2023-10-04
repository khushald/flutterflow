import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentrepliesRecord extends FirestoreRecord {
  CommentrepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "oneline" field.
  String? _oneline;
  String get oneline => _oneline ?? '';
  bool hasOneline() => _oneline != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "userimage" field.
  String? _userimage;
  String get userimage => _userimage ?? '';
  bool hasUserimage() => _userimage != null;

  // "timecomment" field.
  DateTime? _timecomment;
  DateTime? get timecomment => _timecomment;
  bool hasTimecomment() => _timecomment != null;

  // "commentref" field.
  DocumentReference? _commentref;
  DocumentReference? get commentref => _commentref;
  bool hasCommentref() => _commentref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _oneline = snapshotData['oneline'] as String?;
    _body = snapshotData['body'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _userimage = snapshotData['userimage'] as String?;
    _timecomment = snapshotData['timecomment'] as DateTime?;
    _commentref = snapshotData['commentref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('commentreplies')
          : FirebaseFirestore.instance.collectionGroup('commentreplies');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('commentreplies').doc();

  static Stream<CommentrepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentrepliesRecord.fromSnapshot(s));

  static Future<CommentrepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentrepliesRecord.fromSnapshot(s));

  static CommentrepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentrepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentrepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentrepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentrepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentrepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentrepliesRecordData({
  String? username,
  String? oneline,
  String? body,
  DocumentReference? userref,
  String? userimage,
  DateTime? timecomment,
  DocumentReference? commentref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'oneline': oneline,
      'body': body,
      'userref': userref,
      'userimage': userimage,
      'timecomment': timecomment,
      'commentref': commentref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentrepliesRecordDocumentEquality
    implements Equality<CommentrepliesRecord> {
  const CommentrepliesRecordDocumentEquality();

  @override
  bool equals(CommentrepliesRecord? e1, CommentrepliesRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.oneline == e2?.oneline &&
        e1?.body == e2?.body &&
        e1?.userref == e2?.userref &&
        e1?.userimage == e2?.userimage &&
        e1?.timecomment == e2?.timecomment &&
        e1?.commentref == e2?.commentref;
  }

  @override
  int hash(CommentrepliesRecord? e) => const ListEquality().hash([
        e?.username,
        e?.oneline,
        e?.body,
        e?.userref,
        e?.userimage,
        e?.timecomment,
        e?.commentref
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentrepliesRecord;
}
