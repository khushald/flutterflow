import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

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
