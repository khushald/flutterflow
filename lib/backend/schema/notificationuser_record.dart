import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationuserRecord extends FirestoreRecord {
  NotificationuserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "reactiontype" field.
  String? _reactiontype;
  String get reactiontype => _reactiontype ?? '';
  bool hasReactiontype() => _reactiontype != null;

  // "reactionby" field.
  String? _reactionby;
  String get reactionby => _reactionby ?? '';
  bool hasReactionby() => _reactionby != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _post = snapshotData['post'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _reactiontype = snapshotData['reactiontype'] as String?;
    _reactionby = snapshotData['reactionby'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notificationuser')
          : FirebaseFirestore.instance.collectionGroup('notificationuser');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notificationuser').doc();

  static Stream<NotificationuserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationuserRecord.fromSnapshot(s));

  static Future<NotificationuserRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NotificationuserRecord.fromSnapshot(s));

  static NotificationuserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationuserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationuserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationuserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationuserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationuserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationuserRecordData({
  DocumentReference? post,
  DateTime? time,
  String? reactiontype,
  String? reactionby,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post': post,
      'time': time,
      'reactiontype': reactiontype,
      'reactionby': reactionby,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationuserRecordDocumentEquality
    implements Equality<NotificationuserRecord> {
  const NotificationuserRecordDocumentEquality();

  @override
  bool equals(NotificationuserRecord? e1, NotificationuserRecord? e2) {
    return e1?.post == e2?.post &&
        e1?.time == e2?.time &&
        e1?.reactiontype == e2?.reactiontype &&
        e1?.reactionby == e2?.reactionby;
  }

  @override
  int hash(NotificationuserRecord? e) => const ListEquality()
      .hash([e?.post, e?.time, e?.reactiontype, e?.reactionby]);

  @override
  bool isValidKey(Object? o) => o is NotificationuserRecord;
}
