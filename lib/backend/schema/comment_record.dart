import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _oneline = snapshotData['oneline'] as String?;
    _body = snapshotData['body'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _userimage = snapshotData['userimage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Comment')
          : FirebaseFirestore.instance.collectionGroup('Comment');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Comment').doc();

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  String? username,
  String? oneline,
  String? body,
  DocumentReference? userref,
  String? userimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'oneline': oneline,
      'body': body,
      'userref': userref,
      'userimage': userimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.oneline == e2?.oneline &&
        e1?.body == e2?.body &&
        e1?.userref == e2?.userref &&
        e1?.userimage == e2?.userimage;
  }

  @override
  int hash(CommentRecord? e) => const ListEquality()
      .hash([e?.username, e?.oneline, e?.body, e?.userref, e?.userimage]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
