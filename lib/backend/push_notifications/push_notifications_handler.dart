import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFF01080E),
          child: Image.asset(
            'assets/images/Flares_(4).png',
            fit: BoxFit.fill,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'Login': ParameterData.none(),
  'createprofile': ParameterData.none(),
  'postcreation': (data) async => ParameterData(
        allParams: {
          'community': getParameter<DocumentReference>(data, 'community'),
        },
      ),
  'Communitypage': (data) async => ParameterData(
        allParams: {
          'community': getParameter<DocumentReference>(data, 'community'),
        },
      ),
  'communitylist': ParameterData.none(),
  'search': ParameterData.none(),
  'createcommunityimage': ParameterData.none(),
  'createprofile_tags': ParameterData.none(),
  'Signup': ParameterData.none(),
  'Profile_friends': (data) async => ParameterData(
        allParams: {
          'friend': getParameter<DocumentReference>(data, 'friend'),
        },
      ),
  'post': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
        },
      ),
  'postcreationcomm': ParameterData.none(),
  'addcommunity': ParameterData.none(),
  'createcommunitytags': (data) async => ParameterData(
        allParams: {
          'createdcommunity':
              getParameter<DocumentReference>(data, 'createdcommunity'),
        },
      ),
  'createcommunity': ParameterData.none(),
  'profileimage': ParameterData.none(),
  'userprofile': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'onboarding': ParameterData.none(),
  'settingspage': ParameterData.none(),
  'postCopy': (data) async => ParameterData(
        allParams: {
          'comment': await getDocumentParameter<CommentRecord>(
              data, 'comment', CommentRecord.fromSnapshot),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'AllChatsPageCopy': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UserProfileRecord>(
              data, 'chatUser', UserProfileRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'Robin3PhoneAuth': ParameterData.none(),
  'PinCode': ParameterData.none(),
  'createprofileCopy': ParameterData.none(),
  'followers': (data) async => ParameterData(
        allParams: {
          'communityref': getParameter<DocumentReference>(data, 'communityref'),
        },
      ),
  'filteredpost': (data) async => ParameterData(
        allParams: {
          'community': getParameter<DocumentReference>(data, 'community'),
        },
      ),
  'Requests': (data) async => ParameterData(
        allParams: {
          'community': getParameter<DocumentReference>(data, 'community'),
          'comunitiesdoc': await getDocumentParameter<CommunitiesRecord>(
              data, 'comunitiesdoc', CommunitiesRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
