import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/deletepost_widget.dart';
import '/components/imageshow_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Flares',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(180.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.notifications,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('HOME_PAGE_PAGE_notifications_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('Notifications');
                  },
                ),
              ),
              FutureBuilder<int>(
                future: queryChatsRecordCount(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where(
                        'users',
                        arrayContains: currentUserReference,
                      )
                      .where(
                        'last_message_sent_by',
                        isNotEqualTo: currentUserReference,
                      ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xDAFF5963),
                          ),
                        ),
                      ),
                    );
                  }
                  int badgeCount = snapshot.data!;
                  return badges.Badge(
                    badgeContent: Text(
                      badgeCount.toString(),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                    ),
                    showBadge: true,
                    shape: badges.BadgeShape.circle,
                    badgeColor: Color(0xDAFF5963),
                    elevation: 2.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: true,
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.chat,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_PAGE_chat_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('AllChatsPage');
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).primaryText,
                        labelStyle: FlutterFlowTheme.of(context).titleMedium,
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                        tabs: [
                          Tab(
                            text: 'Community',
                          ),
                          Tab(
                            text: 'Friends',
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
                            child: AuthUserStreamWidget(
                              builder: (context) => RefreshIndicator(
                                onRefresh: () async {
                                  logFirebaseEvent(
                                      'HOME_ListView_u0y0mgk1_ON_PULL_TO_REFRES');
                                  logFirebaseEvent('ListView_navigate_to');

                                  context.pushNamed('HomePage');
                                },
                                child: PagedListView<DocumentSnapshot<Object?>?,
                                    PostRecord>(
                                  pagingController:
                                      _model.setListViewController1(
                                    PostRecord.collection
                                        .whereIn(
                                            'post_community',
                                            (currentUserDocument
                                                    ?.communityjoined
                                                    ?.toList() ??
                                                []))
                                        .orderBy('posttime', descending: true),
                                  ),
                                  padding: EdgeInsets.zero,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<PostRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xDAFF5963),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xDAFF5963),
                                          ),
                                        ),
                                      ),
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) =>
                                        Image.asset(
                                      'assets/images/WhatsApp_Image_2023-07-31_at_20.11.48.jpeg',
                                    ),
                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewPostRecord = _model
                                          .listViewPagingController1!
                                          .itemList![listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_Column_dex1cawd_ON_TAP');
                                          logFirebaseEvent(
                                              'Column_navigate_to');

                                          context.pushNamed(
                                            'post',
                                            queryParameters: {
                                              'post': serializeParam(
                                                listViewPostRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 45.0,
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  CachedNetworkImageProvider(
                                                                listViewPostRecord
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
                                                                  'HOME_PAGE_PAGE_Text_l638vklc_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (listViewPostRecord
                                                            .postUser ==
                                                        currentUserReference)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.00, -1.00),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons
                                                                .border_color_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOME_border_color_outlined_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xDAFF5963),
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100.0,
                                                                      child:
                                                                          DeletepostWidget(
                                                                        post:
                                                                            listViewPostRecord,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              if (!listViewPostRecord
                                                  .communitypost)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 0.0),
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
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                CachedNetworkImageProvider(
                                                              listViewPostRecord
                                                                  .userimage,
                                                            ),
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
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
                                                              MainAxisSize.max,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HOME_PAGE_PAGE_Text_giqw0s82_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Profile_friends',
                                                                  queryParameters:
                                                                      {
                                                                    'friend':
                                                                        serializeParam(
                                                                      listViewPostRecord
                                                                          .postUser,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Text(
                                                                listViewPostRecord
                                                                    .username,
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
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xDAFF5963),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xDAFF5963),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
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
                                                                        listViewPostRecord
                                                                            .posttag,
                                                                        textAlign:
                                                                            TextAlign.center,
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
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        20.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF01080E),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset: Offset(
                                                                              0.0,
                                                                              2.0),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            0.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
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
                                                                        listViewPostRecord
                                                                            .posttype,
                                                                        textAlign:
                                                                            TextAlign.center,
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
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: custom_widgets
                                                        .CustomLinkifyWidget(
                                                      width: double.infinity,
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
                                                      .multipleimage.length >=
                                                  1)
                                                ImageshowWidget(
                                                  key: Key(
                                                      'Key0xp_${listViewIndex}_of_${_model.listViewPagingController1!.itemList!.length}'),
                                                  parameter1: listViewPostRecord
                                                      .multipleimage,
                                                ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        ToggleIcon(
                                                          onPressed: () async {
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
                                                                'HOME_ToggleIcon_sl56t6d9_ON_TOGGLE');
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

                                                              await NotificationuserRecord
                                                                      .createDoc(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
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
                                                            borderRadius: 20.0,
                                                            borderWidth: 0.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.comment,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_comment_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_navigate_to');

                                                              context.pushNamed(
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
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
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
                                                                snapshot.data!;
                                                            return Text(
                                                              text123Count
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => PagedListView<
                                  DocumentSnapshot<Object?>?, PostRecord>(
                                pagingController: _model.setListViewController2(
                                  PostRecord.collection
                                      .whereIn(
                                          'post_user',
                                          (currentUserDocument?.friends
                                                  ?.toList() ??
                                              []))
                                      .where(
                                        'communitypost',
                                        isEqualTo: false,
                                      )
                                      .orderBy('posttime', descending: true),
                                ),
                                padding: EdgeInsets.zero,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<PostRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xDAFF5963),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xDAFF5963),
                                        ),
                                      ),
                                    ),
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) =>
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      'assets/images/WhatsApp_Image_2023-07-31_at_20.11.48.jpeg',
                                    ),
                                  ),
                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewPostRecord = _model
                                        .listViewPagingController2!
                                        .itemList![listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_PAGE_Column_5ygy9h6t_ON_TAP');
                                        logFirebaseEvent('Column_navigate_to');

                                        context.pushNamed(
                                          'post',
                                          queryParameters: {
                                            'post': serializeParam(
                                              listViewPostRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        listViewPostRecord
                                                            .communityimage,
                                                      ),
                                                    ),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
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
                                                          'HOME_PAGE_PAGE_Text_78u2f246_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        'Communitypage',
                                                        queryParameters: {
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
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
                                          if (!listViewPostRecord.communitypost)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          listViewPostRecord
                                                              .userimage,
                                                        ),
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_PAGE_Text_adti5ckr_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Text_navigate_to');

                                                            context.pushNamed(
                                                              'Profile_friends',
                                                              queryParameters: {
                                                                'friend':
                                                                    serializeParam(
                                                                  listViewPostRecord
                                                                      .postUser,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: AutoSizeText(
                                                            listViewPostRecord
                                                                .username,
                                                            maxLines: 4,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xDAFF5963),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewPostRecord
                                                                        .posttag,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
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
                                            alignment: AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: custom_widgets
                                                    .CustomLinkifyWidget(
                                                  width: double.infinity,
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
                                                  .multipleimage.length >=
                                              1)
                                            ImageshowWidget(
                                              key: Key(
                                                  'Keypp5_${listViewIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                                              parameter1: listViewPostRecord
                                                  .multipleimage,
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final likedbyuserElement =
                                                        currentUserReference;
                                                    final likedbyuserUpdate =
                                                        listViewPostRecord
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
                                                        'HOME_ToggleIcon_xjunduvh_ON_TOGGLE');
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

                                                      await NotificationuserRecord
                                                              .createDoc(
                                                                  listViewPostRecord
                                                                      .postUser!)
                                                          .set(
                                                              createNotificationuserRecordData(
                                                        post: listViewPostRecord
                                                            .reference,
                                                        time:
                                                            getCurrentTimestamp,
                                                        reactiontype: 'liked',
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
                                                    color: Color(0xDAFF5963),
                                                    size: 25.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.favorite_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 25.0,
                                                  ),
                                                ),
                                                Text(
                                                  listViewPostRecord
                                                      .likedbyuser.length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 0.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.comment,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_PAGE_comment_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_navigate_to');

                                                      context.pushNamed(
                                                        'post',
                                                        queryParameters: {
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
                                                    parent: listViewPostRecord
                                                        .reference,
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
                                                    int text123Count =
                                                        snapshot.data!;
                                                    return Text(
                                                      text123Count.toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
      ),
    );
  }
}
