// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FollowfollowingStruct extends FFFirebaseStruct {
  FollowfollowingStruct({
    bool? following,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _following = following,
        super(firestoreUtilData);

  // "following" field.
  bool? _following;
  bool get following => _following ?? false;
  set following(bool? val) => _following = val;
  bool hasFollowing() => _following != null;

  static FollowfollowingStruct fromMap(Map<String, dynamic> data) =>
      FollowfollowingStruct(
        following: data['following'] as bool?,
      );

  static FollowfollowingStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FollowfollowingStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'following': _following,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'following': serializeParam(
          _following,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FollowfollowingStruct fromSerializableMap(Map<String, dynamic> data) =>
      FollowfollowingStruct(
        following: deserializeParam(
          data['following'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FollowfollowingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FollowfollowingStruct && following == other.following;
  }

  @override
  int get hashCode => const ListEquality().hash([following]);
}

FollowfollowingStruct createFollowfollowingStruct({
  bool? following,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FollowfollowingStruct(
      following: following,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FollowfollowingStruct? updateFollowfollowingStruct(
  FollowfollowingStruct? followfollowing, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    followfollowing
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFollowfollowingStructData(
  Map<String, dynamic> firestoreData,
  FollowfollowingStruct? followfollowing,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (followfollowing == null) {
    return;
  }
  if (followfollowing.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && followfollowing.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final followfollowingData =
      getFollowfollowingFirestoreData(followfollowing, forFieldValue);
  final nestedData =
      followfollowingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = followfollowing.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFollowfollowingFirestoreData(
  FollowfollowingStruct? followfollowing, [
  bool forFieldValue = false,
]) {
  if (followfollowing == null) {
    return {};
  }
  final firestoreData = mapToFirestore(followfollowing.toMap());

  // Add any Firestore field values
  followfollowing.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFollowfollowingListFirestoreData(
  List<FollowfollowingStruct>? followfollowings,
) =>
    followfollowings
        ?.map((e) => getFollowfollowingFirestoreData(e, true))
        .toList() ??
    [];
