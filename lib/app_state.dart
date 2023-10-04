import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _Tag = [];
  List<String> get Tag => _Tag;
  set Tag(List<String> _value) {
    _Tag = _value;
  }

  void addToTag(String _value) {
    _Tag.add(_value);
  }

  void removeFromTag(String _value) {
    _Tag.remove(_value);
  }

  void removeAtIndexFromTag(int _index) {
    _Tag.removeAt(_index);
  }

  void updateTagAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Tag[_index] = updateFn(_Tag[_index]);
  }

  void insertAtIndexInTag(int _index, String _value) {
    _Tag.insert(_index, _value);
  }

  bool _following = false;
  bool get following => _following;
  set following(bool _value) {
    _following = _value;
  }

  String _flares =
      'gs://social-media-6e09e.appspot.com/WhatsApp Image 2023-07-31 at 20.11.48 (1).jpeg\n';
  String get flares => _flares;
  set flares(String _value) {
    _flares = _value;
  }

  String _filtervalue = '';
  String get filtervalue => _filtervalue;
  set filtervalue(String _value) {
    _filtervalue = _value;
  }

  final _prfilecommunityManager =
      StreamRequestManager<List<CommunitiesRecord>>();
  Stream<List<CommunitiesRecord>> prfilecommunity({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CommunitiesRecord>> Function() requestFn,
  }) =>
      _prfilecommunityManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPrfilecommunityCache() => _prfilecommunityManager.clear();
  void clearPrfilecommunityCacheKey(String? uniqueKey) =>
      _prfilecommunityManager.clearRequest(uniqueKey);

  final _profilepostManager = StreamRequestManager<List<PostRecord>>();
  Stream<List<PostRecord>> profilepost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostRecord>> Function() requestFn,
  }) =>
      _profilepostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfilepostCache() => _profilepostManager.clear();
  void clearProfilepostCacheKey(String? uniqueKey) =>
      _profilepostManager.clearRequest(uniqueKey);

  final _friendspostManager = StreamRequestManager<List<PostRecord>>();
  Stream<List<PostRecord>> friendspost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostRecord>> Function() requestFn,
  }) =>
      _friendspostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFriendspostCache() => _friendspostManager.clear();
  void clearFriendspostCacheKey(String? uniqueKey) =>
      _friendspostManager.clearRequest(uniqueKey);

  final _freindsprofilecommunityManager =
      StreamRequestManager<List<CommunitiesRecord>>();
  Stream<List<CommunitiesRecord>> freindsprofilecommunity({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CommunitiesRecord>> Function() requestFn,
  }) =>
      _freindsprofilecommunityManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFreindsprofilecommunityCache() =>
      _freindsprofilecommunityManager.clear();
  void clearFreindsprofilecommunityCacheKey(String? uniqueKey) =>
      _freindsprofilecommunityManager.clearRequest(uniqueKey);

  final _communityjoinedManager =
      StreamRequestManager<List<CommunitiesRecord>>();
  Stream<List<CommunitiesRecord>> communityjoined({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CommunitiesRecord>> Function() requestFn,
  }) =>
      _communityjoinedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommunityjoinedCache() => _communityjoinedManager.clear();
  void clearCommunityjoinedCacheKey(String? uniqueKey) =>
      _communityjoinedManager.clearRequest(uniqueKey);

  final _allCommunititesManager =
      StreamRequestManager<List<CommunitiesRecord>>();
  Stream<List<CommunitiesRecord>> allCommunitites({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CommunitiesRecord>> Function() requestFn,
  }) =>
      _allCommunititesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllCommunititesCache() => _allCommunititesManager.clear();
  void clearAllCommunititesCacheKey(String? uniqueKey) =>
      _allCommunititesManager.clearRequest(uniqueKey);

  final _communitypostManager = StreamRequestManager<List<PostRecord>>();
  Stream<List<PostRecord>> communitypost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostRecord>> Function() requestFn,
  }) =>
      _communitypostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommunitypostCache() => _communitypostManager.clear();
  void clearCommunitypostCacheKey(String? uniqueKey) =>
      _communitypostManager.clearRequest(uniqueKey);

  final _feedcommunityManager = FutureRequestManager<List<PostRecord>>();
  Future<List<PostRecord>> feedcommunity({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostRecord>> Function() requestFn,
  }) =>
      _feedcommunityManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFeedcommunityCache() => _feedcommunityManager.clear();
  void clearFeedcommunityCacheKey(String? uniqueKey) =>
      _feedcommunityManager.clearRequest(uniqueKey);

  final _feedfriendsManager = StreamRequestManager<List<PostRecord>>();
  Stream<List<PostRecord>> feedfriends({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostRecord>> Function() requestFn,
  }) =>
      _feedfriendsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFeedfriendsCache() => _feedfriendsManager.clear();
  void clearFeedfriendsCacheKey(String? uniqueKey) =>
      _feedfriendsManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
