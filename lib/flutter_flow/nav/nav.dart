import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'createprofile',
              path: 'createprofile',
              builder: (context, params) => CreateprofileWidget(),
            ),
            FFRoute(
              name: 'postcreation',
              path: 'postcreation',
              builder: (context, params) => PostcreationWidget(
                community: params.getParam('community',
                    ParamType.DocumentReference, false, ['Communities']),
              ),
            ),
            FFRoute(
              name: 'Communitypage',
              path: 'communitypage',
              builder: (context, params) => CommunitypageWidget(
                community: params.getParam('community',
                    ParamType.DocumentReference, false, ['Communities']),
              ),
            ),
            FFRoute(
              name: 'communitylist',
              path: 'communitylist',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'communitylist')
                  : CommunitylistWidget(),
            ),
            FFRoute(
              name: 'search',
              path: 'search',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'search')
                  : SearchWidget(),
            ),
            FFRoute(
              name: 'createcommunityimage',
              path: 'createcommunityimage',
              builder: (context, params) => CreatecommunityimageWidget(),
            ),
            FFRoute(
              name: 'createprofile_tags',
              path: 'createprofileTags',
              builder: (context, params) => CreateprofileTagsWidget(),
            ),
            FFRoute(
              name: 'Signup',
              path: 'signup',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'Profile_friends',
              path: 'profileFriends',
              builder: (context, params) => ProfileFriendsWidget(
                friend: params.getParam('friend', ParamType.DocumentReference,
                    false, ['User_profile']),
              ),
            ),
            FFRoute(
              name: 'post',
              path: 'post',
              builder: (context, params) => PostWidget(
                post: params.getParam(
                    'post', ParamType.DocumentReference, false, ['Post']),
              ),
            ),
            FFRoute(
              name: 'postcreationcomm',
              path: 'postcreationcomm',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'postcreationcomm')
                  : PostcreationcommWidget(),
            ),
            FFRoute(
              name: 'addcommunity',
              path: 'addcommunity',
              builder: (context, params) => AddcommunityWidget(),
            ),
            FFRoute(
              name: 'createcommunitytags',
              path: 'createcommunitytags',
              builder: (context, params) => CreatecommunitytagsWidget(
                createdcommunity: params.getParam('createdcommunity',
                    ParamType.DocumentReference, false, ['Communities']),
              ),
            ),
            FFRoute(
              name: 'createcommunity',
              path: 'createcommunity',
              builder: (context, params) => CreatecommunityWidget(),
            ),
            FFRoute(
              name: 'profileimage',
              path: 'profileimage',
              builder: (context, params) => ProfileimageWidget(),
            ),
            FFRoute(
              name: 'userprofile',
              path: 'userprofile',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'userprofile')
                  : UserprofileWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'notifications',
              builder: (context, params) => NotificationsWidget(),
            ),
            FFRoute(
              name: 'onboarding',
              path: 'onboarding',
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'settingspage',
              path: 'settingspage',
              builder: (context, params) => SettingspageWidget(),
            ),
            FFRoute(
              name: 'postCopy',
              path: 'postCopy',
              asyncParams: {
                'comment':
                    getDoc(['Post', 'Comment'], CommentRecord.fromSnapshot),
              },
              builder: (context, params) => PostCopyWidget(
                comment: params.getParam('comment', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AllChatsPage',
              path: 'allChatsPage',
              builder: (context, params) => AllChatsPageWidget(),
            ),
            FFRoute(
              name: 'AllChatsPageCopy',
              path: 'allChatsPageCopy',
              builder: (context, params) => AllChatsPageCopyWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser':
                    getDoc(['User_profile'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'Robin3PhoneAuth',
              path: 'robin3PhoneAuth',
              builder: (context, params) => Robin3PhoneAuthWidget(),
            ),
            FFRoute(
              name: 'PinCode',
              path: 'pinCode',
              builder: (context, params) => PinCodeWidget(),
            ),
            FFRoute(
              name: 'createprofileCopy',
              path: 'createprofileCopy',
              builder: (context, params) => CreateprofileCopyWidget(),
            ),
            FFRoute(
              name: 'followers',
              path: 'followers',
              builder: (context, params) => FollowersWidget(
                communityref: params.getParam('communityref',
                    ParamType.DocumentReference, false, ['Communities']),
              ),
            ),
            FFRoute(
              name: 'filteredpost',
              path: 'filteredpost',
              builder: (context, params) => FilteredpostWidget(
                community: params.getParam('community',
                    ParamType.DocumentReference, false, ['Communities']),
              ),
            ),
            FFRoute(
              name: 'Requests',
              path: 'requests',
              asyncParams: {
                'comunitiesdoc':
                    getDoc(['Communities'], CommunitiesRecord.fromSnapshot),
              },
              builder: (context, params) => RequestsWidget(
                community: params.getParam('community',
                    ParamType.DocumentReference, false, ['Communities']),
                comunitiesdoc:
                    params.getParam('comunitiesdoc', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF01080E),
                  child: Image.asset(
                    'assets/images/Flares_(4).png',
                    fit: BoxFit.fill,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
