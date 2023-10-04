import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addcommunity_model.dart';
export 'addcommunity_model.dart';

class AddcommunityWidget extends StatefulWidget {
  const AddcommunityWidget({Key? key}) : super(key: key);

  @override
  _AddcommunityWidgetState createState() => _AddcommunityWidgetState();
}

class _AddcommunityWidgetState extends State<AddcommunityWidget> {
  late AddcommunityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddcommunityModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addcommunity'});
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
        backgroundColor: Color(0xFF01080E),
        appBar: AppBar(
          backgroundColor: Color(0xFF01080E),
          automaticallyImplyLeading: true,
          title: Text(
            'Select communties to join',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF01080E), Color(0xDAFF5963)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.03, -1.0),
                end: AlignmentDirectional(-0.03, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: StreamBuilder<List<CommunitiesRecord>>(
                      stream: queryCommunitiesRecord(),
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
                        List<CommunitiesRecord> listViewCommunitiesRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCommunitiesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewCommunitiesRecord =
                                listViewCommunitiesRecordList[listViewIndex];
                            return Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              child: CheckboxListTile(
                                value: _model.checkboxListTileValueMap[
                                    listViewCommunitiesRecord] ??= false,
                                onChanged: (newValue) async {
                                  setState(() => _model
                                          .checkboxListTileValueMap[
                                      listViewCommunitiesRecord] = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'ADDCOMMUNITY_CheckboxListTile_ab73hwfz_O');
                                    logFirebaseEvent(
                                        'CheckboxListTile_backend_call');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'communityjoined':
                                              FieldValue.arrayUnion([
                                            listViewCommunitiesRecord.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'CheckboxListTile_backend_call');

                                    await listViewCommunitiesRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'members': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'ADDCOMMUNITY_CheckboxListTile_ab73hwfz_O');
                                    logFirebaseEvent(
                                        'CheckboxListTile_backend_call');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'communityjoined':
                                              FieldValue.arrayRemove([
                                            listViewCommunitiesRecord.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'CheckboxListTile_backend_call');

                                    await listViewCommunitiesRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'members': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  }
                                },
                                title: Text(
                                  listViewCommunitiesRecord.communityname,
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                subtitle: Text(
                                  listViewCommunitiesRecord.communityoneline,
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: FlutterFlowTheme.of(context).info,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.05),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 64.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('ADDCOMMUNITY_PAGE_NEXT_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamed('HomePage');
                        },
                        text: 'Next',
                        options: FFButtonOptions(
                          width: 240.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xDAFF5963),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Color(0xFF01080E),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
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
  }
}
