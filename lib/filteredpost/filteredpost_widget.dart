import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/imageshow_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'filteredpost_model.dart';
export 'filteredpost_model.dart';

class FilteredpostWidget extends StatefulWidget {
  const FilteredpostWidget({
    Key? key,
    required this.community,
  }) : super(key: key);

  final DocumentReference? community;

  @override
  _FilteredpostWidgetState createState() => _FilteredpostWidgetState();
}

class _FilteredpostWidgetState extends State<FilteredpostWidget> {
  late FilteredpostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilteredpostModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'filteredpost'});
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

    return StreamBuilder<List<PostRecord>>(
      stream: queryPostRecord(
        queryBuilder: (postRecord) => postRecord
            .where(
              'post_community',
              isEqualTo: widget.community,
            )
            .where(
              'posttag',
              isEqualTo: FFAppState().filtervalue,
            ),
      ),
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
        List<PostRecord> filteredpostPostRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF01080E),
          appBar: AppBar(
            backgroundColor: Color(0xFF01080E),
            automaticallyImplyLeading: false,
            title: Text(
              'POST',
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: PagedListView<DocumentSnapshot<Object?>?, PostRecord>(
                pagingController: _model.setListViewController(
                  PostRecord.collection
                      .where(
                        'post_community',
                        isEqualTo: widget.community,
                      )
                      .where(
                        'posttag',
                        isEqualTo: FFAppState().filtervalue,
                      ),
                ),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                reverse: false,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<PostRecord>(
                  // Customize what your widget looks like when it's loading the first page.
                  firstPageProgressIndicatorBuilder: (_) => Center(
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
                  // Customize what your widget looks like when it's loading another page.
                  newPageProgressIndicatorBuilder: (_) => Center(
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

                  itemBuilder: (context, _, listViewIndex) {
                    final listViewPostRecord = _model
                        .listViewPagingController!.itemList![listViewIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 45.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      listViewPostRecord.userimage,
                                    ),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'FILTEREDPOST_PAGE_Text_9rb1v7c5_ON_TAP');
                                        logFirebaseEvent('Text_navigate_to');

                                        context.pushNamed(
                                          'Profile_friends',
                                          queryParameters: {
                                            'friend': serializeParam(
                                              listViewPostRecord.postUser,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: AutoSizeText(
                                        listViewPostRecord.username,
                                        maxLines: 4,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xDAFF5963),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                listViewPostRecord.posttag,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF01080E),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Color(0xFFF7EFEF),
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  listViewPostRecord.posttype,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w300,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            child: custom_widgets.CustomLinkifyWidget(
                              width: double.infinity,
                              text: listViewPostRecord.postdescrition,
                              characterLimit: 256,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                        if (listViewPostRecord.multipleimage.length >= 1)
                          ImageshowWidget(
                            key: Key(
                                'Key39v_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                            parameter1: listViewPostRecord.multipleimage,
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ToggleIcon(
                                onPressed: () async {
                                  final likedbyuserElement =
                                      currentUserReference;
                                  final likedbyuserUpdate = listViewPostRecord
                                          .likedbyuser
                                          .contains(likedbyuserElement)
                                      ? FieldValue.arrayRemove(
                                          [likedbyuserElement])
                                      : FieldValue.arrayUnion(
                                          [likedbyuserElement]);
                                  await listViewPostRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'likedbyuser': likedbyuserUpdate,
                                      },
                                    ),
                                  });
                                  logFirebaseEvent(
                                      'FILTEREDPOST_ToggleIcon_a2ibs1bz_ON_TOGG');
                                  if (listViewPostRecord.likedbyuser
                                      .contains(currentUserReference)) {
                                    logFirebaseEvent('ToggleIcon_backend_call');

                                    await listViewPostRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'likedbyuser': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    return;
                                  } else {
                                    logFirebaseEvent('ToggleIcon_backend_call');

                                    await listViewPostRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'likedbyuser': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    return;
                                  }
                                },
                                value: listViewPostRecord.likedbyuser
                                    .contains(currentUserReference),
                                onIcon: Icon(
                                  Icons.favorite,
                                  color: Color(0xDAFF5963),
                                  size: 25.0,
                                ),
                                offIcon: Icon(
                                  Icons.favorite_border,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 25.0,
                                ),
                              ),
                              Text(
                                listViewPostRecord.likedbyuser.length
                                    .toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.comment,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'FILTEREDPOST_PAGE_comment_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

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
                                ),
                              ),
                              FutureBuilder<int>(
                                future: queryCommentRecordCount(
                                  parent: listViewPostRecord.reference,
                                ),
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
                                  int text123Count = snapshot.data!;
                                  return Text(
                                    text123Count.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
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
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
