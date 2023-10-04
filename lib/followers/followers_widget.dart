import '/backend/backend.dart';
import '/components/userprofilefollowers_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'followers_model.dart';
export 'followers_model.dart';

class FollowersWidget extends StatefulWidget {
  const FollowersWidget({
    Key? key,
    required this.communityref,
  }) : super(key: key);

  final DocumentReference? communityref;

  @override
  _FollowersWidgetState createState() => _FollowersWidgetState();
}

class _FollowersWidgetState extends State<FollowersWidget>
    with TickerProviderStateMixin {
  late FollowersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'followers'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<CommunitiesRecord>(
      stream: CommunitiesRecord.getDocument(widget.communityref!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF01080E),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xDAFF5963),
                  ),
                ),
              ),
            ),
          );
        }
        final followersCommunitiesRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF01080E),
          appBar: AppBar(
            backgroundColor: Color(0xFF01080E),
            automaticallyImplyLeading: false,
            title: Text(
              'Followers',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle: FlutterFlowTheme.of(context).titleMedium,
                    unselectedLabelStyle: TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).primary,
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    tabs: [
                      Tab(
                        text: 'Followers',
                      ),
                      Tab(
                        text: 'blocked',
                      ),
                      Tab(
                        text: 'Moderator',
                      ),
                    ],
                    controller: _model.tabBarController,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final followers =
                                followersCommunitiesRecord.members.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: followers.length,
                              itemBuilder: (context, followersIndex) {
                                final followersItem = followers[followersIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'FOLLOWERS_PAGE_Row_vf2nlkyp_ON_TAP');
                                      logFirebaseEvent('Row_navigate_to');

                                      context.pushNamed(
                                        'Profile_friends',
                                        queryParameters: {
                                          'friend': serializeParam(
                                            followersItem,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: UserprofilefollowersWidget(
                                            key: Key(
                                                'Key34d_${followersIndex}_of_${followers.length}'),
                                            parameter5: followersItem,
                                            community:
                                                followersCommunitiesRecord,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final blocked =
                              followersCommunitiesRecord.blockedusers.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: blocked.length,
                            itemBuilder: (context, blockedIndex) {
                              final blockedItem = blocked[blockedIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final followers = followersCommunitiesRecord
                                        .members
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: followers.length,
                                      itemBuilder: (context, followersIndex) {
                                        final followersItem =
                                            followers[followersIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 16.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'FOLLOWERS_PAGE_Row_psuiiem9_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                'Profile_friends',
                                                queryParameters: {
                                                  'friend': serializeParam(
                                                    blockedItem,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child:
                                                      UserprofilefollowersWidget(
                                                    key: Key(
                                                        'Key5p7_${followersIndex}_of_${followers.length}'),
                                                    parameter5: blockedItem,
                                                    community:
                                                        followersCommunitiesRecord,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          final moderator =
                              followersCommunitiesRecord.moderator.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: moderator.length,
                            itemBuilder: (context, moderatorIndex) {
                              final moderatorItem = moderator[moderatorIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final followers = followersCommunitiesRecord
                                        .members
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: followers.length,
                                      itemBuilder: (context, followersIndex) {
                                        final followersItem =
                                            followers[followersIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 16.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'FOLLOWERS_PAGE_Row_30ohl0hh_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                'Profile_friends',
                                                queryParameters: {
                                                  'friend': serializeParam(
                                                    moderatorItem,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child:
                                                      UserprofilefollowersWidget(
                                                    key: Key(
                                                        'Keync2_${followersIndex}_of_${followers.length}'),
                                                    parameter5: moderatorItem,
                                                    community:
                                                        followersCommunitiesRecord,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
