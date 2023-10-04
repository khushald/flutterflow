import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/moderator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'userprofilefollowers_model.dart';
export 'userprofilefollowers_model.dart';

class UserprofilefollowersWidget extends StatefulWidget {
  const UserprofilefollowersWidget({
    Key? key,
    this.parameter5,
    required this.community,
  }) : super(key: key);

  final DocumentReference? parameter5;
  final CommunitiesRecord? community;

  @override
  _UserprofilefollowersWidgetState createState() =>
      _UserprofilefollowersWidgetState();
}

class _UserprofilefollowersWidgetState
    extends State<UserprofilefollowersWidget> {
  late UserprofilefollowersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserprofilefollowersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: FutureBuilder<UserProfileRecord>(
        future: (_model
                .documentRequestCompleter ??= Completer<UserProfileRecord>()
              ..complete(UserProfileRecord.getDocumentOnce(widget.parameter5!)))
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            rowUserProfileRecord.photoUrl,
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1.00, 1.00),
                        child: StreamBuilder<CommunitiesRecord>(
                          stream: CommunitiesRecord.getDocument(
                              widget.community!.reference),
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
                            final stackCommunitiesRecord = snapshot.data!;
                            return Stack(
                              children: [
                                if (stackCommunitiesRecord.moderator
                                    .contains(widget.parameter5))
                                  Align(
                                    alignment: AlignmentDirectional(1.00, 1.00),
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xDAFF5963),
                                      ),
                                    ),
                                  ),
                                if (stackCommunitiesRecord.blockedusers
                                    .contains(widget.parameter5))
                                  Align(
                                    alignment: AlignmentDirectional(1.00, 1.00),
                                    child: Icon(
                                      Icons.block,
                                      color: Color(0xDAFF5963),
                                      size: 16.0,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                rowUserProfileRecord.displayName
                                    .maybeHandleOverflow(maxChars: 16),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                rowUserProfileRecord.useroneline,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
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
              if (widget.community?.owner == currentUserReference)
                Align(
                  alignment: AlignmentDirectional(1.00, -1.00),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.border_color_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 15.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'USERPROFILEFOLLOWERS_border_color_outlin');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ModeratorWidget(
                              user: rowUserProfileRecord,
                              community: widget.community!,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      logFirebaseEvent('IconButton_refresh_database_request');
                      setState(() => _model.documentRequestCompleter = null);
                      await _model.waitForDocumentRequestCompleted();
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
