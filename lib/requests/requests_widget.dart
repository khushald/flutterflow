import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'requests_model.dart';
export 'requests_model.dart';

class RequestsWidget extends StatefulWidget {
  const RequestsWidget({
    Key? key,
    required this.community,
    required this.comunitiesdoc,
  }) : super(key: key);

  final DocumentReference? community;
  final CommunitiesRecord? comunitiesdoc;

  @override
  _RequestsWidgetState createState() => _RequestsWidgetState();
}

class _RequestsWidgetState extends State<RequestsWidget> {
  late RequestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Requests'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF01080E),
      appBar: AppBar(
        backgroundColor: Color(0xFF01080E),
        automaticallyImplyLeading: false,
        title: Text(
          'Request',
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Builder(
                builder: (context) {
                  final request = widget.comunitiesdoc?.request?.toList() ?? [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: request.length,
                    itemBuilder: (context, requestIndex) {
                      final requestItem = request[requestIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: FutureBuilder<UserProfileRecord>(
                          future: (_model.documentRequestCompleter ??=
                                  Completer<UserProfileRecord>()
                                    ..complete(
                                        UserProfileRecord.getDocumentOnce(
                                            requestItem)))
                              .future,
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
                            final rowUserProfileRecord = snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: CachedNetworkImageProvider(
                                                rowUserProfileRecord.photoUrl,
                                              ),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  rowUserProfileRecord
                                                      .displayName
                                                      .maybeHandleOverflow(
                                                          maxChars: 16),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.00, -1.00),
                                  child: Stack(
                                    children: [
                                      if (rowUserProfileRecord.communityjoined
                                          .contains(widget.community))
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Joined',
                                          options: FFButtonOptions(
                                            width: 60.0,
                                            height: 20.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      if (!rowUserProfileRecord.communityjoined
                                          .contains(widget.community))
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'REQUESTS_PAGE_ACCEPT_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await widget.community!.update({
                                              ...mapToFirestore(
                                                {
                                                  'members':
                                                      FieldValue.arrayUnion(
                                                          [requestItem]),
                                                  'request':
                                                      FieldValue.arrayRemove(
                                                          [requestItem]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await requestItem.update({
                                              ...mapToFirestore(
                                                {
                                                  'communityjoined':
                                                      FieldValue.arrayUnion(
                                                          [widget.community]),
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
                                          text: 'Accept',
                                          options: FFButtonOptions(
                                            width: 60.0,
                                            height: 20.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xDAFF5963),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
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
    );
  }
}
