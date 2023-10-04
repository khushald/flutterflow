import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/imageshow_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final DocumentReference? post;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'post'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.post!),
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
        final postPostRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: true,
              title: Text(
                'Post',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: (isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible)
                            ? (MediaQuery.sizeOf(context).height * .6)
                            : (MediaQuery.sizeOf(context).height * 0.8),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                postPostRecord.communityimage,
                                              ).image,
                                            ),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFF7EFEF),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'POST_PAGE_Text_ot2e7ku4_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_navigate_to');

                                              context.pushNamed(
                                                'Communitypage',
                                                queryParameters: {
                                                  'community': serializeParam(
                                                    postPostRecord
                                                        .postCommunity,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Text(
                                              postPostRecord.communityname,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!postPostRecord.communitypost)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 45.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  postPostRecord.userimage,
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
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
                                                        'POST_PAGE_Text_flzm7t7p_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_navigate_to');

                                                    context.pushNamed(
                                                      'Profile_friends',
                                                      queryParameters: {
                                                        'friend':
                                                            serializeParam(
                                                          postPostRecord
                                                              .postUser,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: AutoSizeText(
                                                    postPostRecord.username,
                                                    maxLines: 4,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 72.0,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xDAFF5963),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFF7EFEF),
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Text(
                                                          postPostRecord
                                                              .posttag,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 10.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                                        child: Container(
                                                          width: 72.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF01080E),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFF7EFEF),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
                                                            postPostRecord
                                                                .posttype,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Color(
                                                                      0xFFF7EFEF),
                                                                  fontSize:
                                                                      10.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: custom_widgets.CustomLinkifyWidget(
                                        width: double.infinity,
                                        text: postPostRecord.postdescrition,
                                        characterLimit: 3000,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                  if (postPostRecord.postimage != null &&
                                      postPostRecord.postimage != '')
                                    wrapWithModel(
                                      model: _model.imageshowModel,
                                      updateCallback: () => setState(() {}),
                                      child: ImageshowWidget(
                                        parameter1:
                                            postPostRecord.multipleimage,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ToggleIcon(
                                          onPressed: () async {
                                            final likedbyuserElement =
                                                currentUserReference;
                                            final likedbyuserUpdate =
                                                postPostRecord
                                                        .likedbyuser
                                                        .contains(
                                                            likedbyuserElement)
                                                    ? FieldValue.arrayRemove(
                                                        [likedbyuserElement])
                                                    : FieldValue.arrayUnion(
                                                        [likedbyuserElement]);
                                            await postPostRecord.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'likedbyuser':
                                                      likedbyuserUpdate,
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'POST_PAGE_ToggleIcon_kn6v2ahr_ON_TOGGLE');
                                            if (postPostRecord.likedbyuser
                                                .contains(
                                                    currentUserReference)) {
                                              logFirebaseEvent(
                                                  'ToggleIcon_backend_call');

                                              await widget.post!.update({
                                                ...mapToFirestore(
                                                  {
                                                    'likedbyuser':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'ToggleIcon_backend_call');

                                              await NotificationuserRecord
                                                      .createDoc(postPostRecord
                                                          .postUser!)
                                                  .set(
                                                      createNotificationuserRecordData(
                                                post: postPostRecord.reference,
                                                time: getCurrentTimestamp,
                                                reactiontype: 'liked',
                                                reactionby:
                                                    currentUserDisplayName,
                                              ));
                                              return;
                                            } else {
                                              logFirebaseEvent(
                                                  'ToggleIcon_backend_call');

                                              await widget.post!.update({
                                                ...mapToFirestore(
                                                  {
                                                    'likedbyuser':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              return;
                                            }
                                          },
                                          value: postPostRecord.likedbyuser
                                              .contains(currentUserReference),
                                          onIcon: Icon(
                                            Icons.favorite,
                                            color: Color(0xDAFF5963),
                                            size: 25.0,
                                          ),
                                          offIcon: Icon(
                                            Icons.favorite_border,
                                            color: Color(0xFFF7EFEF),
                                            size: 25.0,
                                          ),
                                        ),
                                        Text(
                                          postPostRecord.likedbyuser.length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 0.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.comment,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                        FutureBuilder<int>(
                                          future: queryCommentRecordCount(
                                            parent: widget.post,
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
                                            int textCount = snapshot.data!;
                                            return Text(
                                              textCount.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                ],
                              ),
                              FutureBuilder<List<CommentRecord>>(
                                future: (_model.firestoreRequestCompleter ??=
                                        Completer<List<CommentRecord>>()
                                          ..complete(queryCommentRecordOnce(
                                            parent: widget.post,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
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
                                    );
                                  }
                                  List<CommentRecord>
                                      listViewCommentRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewCommentRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewCommentRecord =
                                          listViewCommentRecordList[
                                              listViewIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        listViewCommentRecord
                                                            .userimage,
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
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
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listViewCommentRecord
                                                                      .username
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
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                listViewCommentRecord
                                                                    .oneline,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  listViewCommentRecord
                                                                      .body,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POST_PAGE_Text_ltvfab85_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'postCopy',
                                                                          queryParameters:
                                                                              {
                                                                            'comment':
                                                                                serializeParam(
                                                                              listViewCommentRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'comment':
                                                                                listViewCommentRecord,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Reply',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 10.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: FutureBuilder<
                                                                          int>(
                                                                        future:
                                                                            queryCommentrepliesRecordCount(
                                                                          parent:
                                                                              widget.post,
                                                                          queryBuilder: (commentrepliesRecord) =>
                                                                              commentrepliesRecord.where(
                                                                            'commentref',
                                                                            isEqualTo:
                                                                                listViewCommentRecord.reference,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          int textCount =
                                                                              snapshot.data!;
                                                                          return Text(
                                                                            textCount.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontSize: 10.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF01080E),
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 1.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Label here...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                          cursorColor: Colors.white,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.send_sharp,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_PAGE_send_sharp_ICN_ON_TAP');
                                      if (_model.textController.text != null &&
                                          _model.textController.text != '') {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await widget.post!.update({
                                          ...mapToFirestore(
                                            {
                                              'commentby':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await CommentRecord.createDoc(
                                                widget.post!)
                                            .set(createCommentRecordData(
                                          username: currentUserDisplayName,
                                          oneline: valueOrDefault(
                                              currentUserDocument?.useroneline,
                                              ''),
                                          body: _model.textController.text,
                                          userref: currentUserReference,
                                          userimage: currentUserPhoto,
                                          uid: '',
                                          timecomment: getCurrentTimestamp,
                                        ));
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await NotificationuserRecord.createDoc(
                                                postPostRecord.postUser!)
                                            .set(
                                                createNotificationuserRecordData(
                                          post: postPostRecord.reference,
                                          time: getCurrentTimestamp,
                                          reactiontype: 'commented',
                                          reactionby: currentUserDisplayName,
                                        ));
                                        logFirebaseEvent(
                                            'IconButton_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                        logFirebaseEvent(
                                            'IconButton_trigger_push_notification');
                                        triggerPushNotification(
                                          notificationTitle: 'comment',
                                          notificationText:
                                              '${currentUserDisplayName} commented on your post',
                                          notificationSound: 'default',
                                          userRefs: [postPostRecord.postUser!],
                                          initialPageName: 'post',
                                          parameterData: {
                                            'post': widget.post,
                                          },
                                        );
                                        logFirebaseEvent(
                                            'IconButton_clear_text_fields_pin_codes');
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        logFirebaseEvent(
                                            'IconButton_refresh_database_request');
                                        setState(() => _model
                                            .firestoreRequestCompleter = null);
                                        await _model
                                            .waitForFirestoreRequestCompleted();
                                        return;
                                      } else {
                                        return;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
