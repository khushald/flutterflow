import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/imageshow_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'profile_friends_model.dart';
export 'profile_friends_model.dart';

class ProfileFriendsWidget extends StatefulWidget {
  const ProfileFriendsWidget({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final DocumentReference? friend;

  @override
  _ProfileFriendsWidgetState createState() => _ProfileFriendsWidgetState();
}

class _ProfileFriendsWidgetState extends State<ProfileFriendsWidget>
    with TickerProviderStateMixin {
  late ProfileFriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileFriendsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Profile_friends'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
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

    return FutureBuilder<UserProfileRecord>(
      future:
          (_model.documentRequestCompleter ??= Completer<UserProfileRecord>()
                ..complete(UserProfileRecord.getDocumentOnce(widget.friend!)))
              .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final profileFriendsUserProfileRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.chat,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'PROFILE_FRIENDS_PAGE_chat_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed(
                          'ChatPage',
                          queryParameters: {
                            'chatUser': serializeParam(
                              profileFriendsUserProfileRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'chatUser': profileFriendsUserProfileRecord,
                          },
                        );
                      },
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(280.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                height: 180.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl:
                                              profileFriendsUserProfileRecord
                                                  .coveerimage,
                                          width: double.infinity,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 50.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/2vqf7_',
                                                        ).image,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFF7EFEF),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PROFILE_FRIENDS_Image_ppt6e6jn_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_expand_image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                profileFriendsUserProfileRecord
                                                                    .photoUrl,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  profileFriendsUserProfileRecord
                                                                      .photoUrl,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            profileFriendsUserProfileRecord
                                                                .photoUrl,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            profileFriendsUserProfileRecord
                                                                .photoUrl,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 64.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            profileFriendsUserProfileRecord
                                                                .displayName
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        16),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            profileFriendsUserProfileRecord
                                                                .useroneline,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Stack(
                                              children: [
                                                if (profileFriendsUserProfileRecord
                                                    .followedby
                                                    .contains(
                                                        currentUserReference))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.00, 0.00),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PROFILE_FRIENDS_FOLLOWING_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'friends': FieldValue
                                                                  .arrayRemove([
                                                                profileFriendsUserProfileRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await widget.friend!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'followedby':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        setState(() => _model
                                                                .documentRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForDocumentRequestCompleted();
                                                      },
                                                      text: 'Following',
                                                      options: FFButtonOptions(
                                                        width: 60.0,
                                                        height: 20.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFF01080E),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                if (!profileFriendsUserProfileRecord
                                                    .followedby
                                                    .contains(
                                                        currentUserReference))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.00, 0.00),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PROFILE_FRIENDS_PAGE_FOLLOW_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'friends': FieldValue
                                                                  .arrayUnion([
                                                                profileFriendsUserProfileRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await widget.friend!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'followedby':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        setState(() => _model
                                                                .documentRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForDocumentRequestCompleted();
                                                      },
                                                      text: 'Follow',
                                                      options: FFButtonOptions(
                                                        width: 60.0,
                                                        height: 20.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xDAFF5963),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 1.0, 16.0, 0.0),
                                child: Text(
                                  profileFriendsUserProfileRecord.bio
                                      .maybeHandleOverflow(
                                    maxChars: 250,
                                    replacement: '…',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.w200,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Wrap(
                                    spacing: 16.0,
                                    runSpacing: 8.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 72.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xDAFF5963),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          profileFriendsUserProfileRecord
                                              .tags[0],
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 72.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xDAFF5963),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          profileFriendsUserProfileRecord
                                              .tags[1],
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 72.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xDAFF5963),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          profileFriendsUserProfileRecord
                                              .tags[2],
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 72.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xDAFF5963),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          profileFriendsUserProfileRecord
                                              .tags[3],
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 72.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xDAFF5963),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          profileFriendsUserProfileRecord
                                              .tags[4],
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  elevation: 4.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    unselectedLabelStyle: TextStyle(),
                                    indicatorColor: Color(0xDAFF5963),
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    tabs: [
                                      Tab(
                                        text: 'Post',
                                      ),
                                      Tab(
                                        text: 'Community',
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
                                            16.0, 0.0, 16.0, 0.0),
                                        child: PagedListView<
                                            DocumentSnapshot<Object?>?,
                                            PostRecord>(
                                          pagingController:
                                              _model.setListViewController1(
                                            PostRecord.collection.where(
                                              'post_user',
                                              isEqualTo: widget.friend,
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          reverse: false,
                                          scrollDirection: Axis.vertical,
                                          builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  PostRecord>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xDAFF5963),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Customize what your widget looks like when it's loading another page.
                                            newPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xDAFF5963),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            itemBuilder:
                                                (context, _, listViewIndex) {
                                              final listViewPostRecord = _model
                                                  .listViewPagingController1!
                                                  .itemList![listViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PROFILE_FRIENDS_Column_orfwb3ld_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_navigate_to');

                                                  context.pushNamed(
                                                    'post',
                                                    queryParameters: {
                                                      'post': serializeParam(
                                                        listViewPostRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  listViewPostRecord
                                                                      .communityimage,
                                                                ),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFF7EFEF),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PROFILE_FRIENDS_Text_p5qj34ps_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Communitypage',
                                                                  queryParameters:
                                                                      {
                                                                    'community':
                                                                        serializeParam(
                                                                      listViewPostRecord
                                                                          .postCommunity,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Text(
                                                                listViewPostRecord
                                                                    .communityname,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (!listViewPostRecord
                                                        .communitypost)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 45.0,
                                                              height: 45.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      CachedNetworkImageProvider(
                                                                    listViewPostRecord
                                                                        .userimage,
                                                                  ),
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  AutoSizeText(
                                                                    listViewPostRecord
                                                                        .username,
                                                                    maxLines: 4,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xDAFF5963),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              listViewPostRecord.posttag,
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    color: Colors.white,
                                                                                    fontSize: 10.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                20.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF01080E),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFFF7EFEF),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: Text(
                                                                                listViewPostRecord.posttype,
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: Colors.white,
                                                                                      fontSize: 10.0,
                                                                                      fontWeight: FontWeight.w300,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: custom_widgets
                                                              .CustomLinkifyWidget(
                                                            width:
                                                                double.infinity,
                                                            text: listViewPostRecord
                                                                .postdescrition,
                                                            characterLimit: 256,
                                                            textColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (listViewPostRecord
                                                            .multipleimage
                                                            .length >=
                                                        1)
                                                      ImageshowWidget(
                                                        key: Key(
                                                            'Keyseh_${listViewIndex}_of_${_model.listViewPagingController1!.itemList!.length}'),
                                                        parameter1:
                                                            listViewPostRecord
                                                                .multipleimage,
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              final likedbyuserElement =
                                                                  currentUserReference;
                                                              final likedbyuserUpdate = listViewPostRecord
                                                                      .likedbyuser
                                                                      .contains(
                                                                          likedbyuserElement)
                                                                  ? FieldValue
                                                                      .arrayRemove([
                                                                      likedbyuserElement
                                                                    ])
                                                                  : FieldValue
                                                                      .arrayUnion([
                                                                      likedbyuserElement
                                                                    ]);
                                                              await listViewPostRecord
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'likedbyuser':
                                                                        likedbyuserUpdate,
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'PROFILE_FRIENDS_ToggleIcon_o8zs21mm_ON_T');
                                                              if (listViewPostRecord
                                                                  .likedbyuser
                                                                  .contains(
                                                                      currentUserReference)) {
                                                                logFirebaseEvent(
                                                                    'ToggleIcon_backend_call');

                                                                await listViewPostRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'likedbyuser':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                return;
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'ToggleIcon_backend_call');

                                                                await listViewPostRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'likedbyuser':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                logFirebaseEvent(
                                                                    'ToggleIcon_backend_call');

                                                                await NotificationuserRecord.createDoc(
                                                                        listViewPostRecord
                                                                            .postUser!)
                                                                    .set(
                                                                        createNotificationuserRecordData(
                                                                  post: listViewPostRecord
                                                                      .reference,
                                                                  time:
                                                                      getCurrentTimestamp,
                                                                  reactiontype:
                                                                      'liked',
                                                                  reactionby:
                                                                      currentUserDisplayName,
                                                                ));
                                                                return;
                                                              }
                                                            },
                                                            value: listViewPostRecord
                                                                .likedbyuser
                                                                .contains(
                                                                    currentUserReference),
                                                            onIcon: Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xDAFF5963),
                                                              size: 25.0,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Color(
                                                                  0xFFF7EFEF),
                                                              size: 25.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            listViewPostRecord
                                                                .likedbyuser
                                                                .length
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 0.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.comment,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'PROFILE_FRIENDS_PAGE_comment_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'post',
                                                                  queryParameters:
                                                                      {
                                                                    'post':
                                                                        serializeParam(
                                                                      listViewPostRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          FutureBuilder<int>(
                                                            future:
                                                                queryCommentRecordCount(
                                                              parent:
                                                                  listViewPostRecord
                                                                      .reference,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0xDAFF5963),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              int text123Count =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                text123Count
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: StreamBuilder<
                                            List<CommunitiesRecord>>(
                                          stream: FFAppState()
                                              .freindsprofilecommunity(
                                            requestFn: () =>
                                                queryCommunitiesRecord(
                                              queryBuilder:
                                                  (communitiesRecord) =>
                                                      communitiesRecord.where(
                                                'members',
                                                arrayContains:
                                                    profileFriendsUserProfileRecord
                                                        .reference,
                                              ),
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xDAFF5963),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CommunitiesRecord>
                                                listViewCommunitiesRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewCommunitiesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCommunitiesRecord =
                                                    listViewCommunitiesRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PROFILE_FRIENDS_PAGE_Row_5w1bw123_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                        'Communitypage',
                                                        queryParameters: {
                                                          'community':
                                                              serializeParam(
                                                            listViewCommunitiesRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 45.0,
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  CachedNetworkImageProvider(
                                                                listViewCommunitiesRecord
                                                                    .communityimage,
                                                              ),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFF7EFEF),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PROFILE_FRIENDS_PAGE_Text123_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text123_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'Communitypage',
                                                                    queryParameters:
                                                                        {
                                                                      'community':
                                                                          serializeParam(
                                                                        listViewCommunitiesRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  listViewCommunitiesRecord
                                                                      .communityname
                                                                      .maybeHandleOverflow(
                                                                          maxChars:
                                                                              16),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listViewCommunitiesRecord
                                                                      .communityoneline,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
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
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
