import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'createcommunity_model.dart';
export 'createcommunity_model.dart';

class CreatecommunityWidget extends StatefulWidget {
  const CreatecommunityWidget({Key? key}) : super(key: key);

  @override
  _CreatecommunityWidgetState createState() => _CreatecommunityWidgetState();
}

class _CreatecommunityWidgetState extends State<CreatecommunityWidget> {
  late CreatecommunityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatecommunityModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createcommunity'});
    _model.yourNameController1 ??= TextEditingController();
    _model.yourNameController2 ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
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
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xC9010912), FlutterFlowTheme.of(context).error],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: Text(
                    'Create community',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Roboto',
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: _model.yourNameController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'name',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFF7EFEF),
                                ),
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF7EFEF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                      maxLines: null,
                      validator: _model.yourNameController1Validator
                          .asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: _model.yourNameController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText:
                            'one line description eg product | startup | delhi',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFF7EFEF),
                                ),
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF7EFEF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                      maxLines: null,
                      validator: _model.yourNameController2Validator
                          .asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 12.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: _model.myBioController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Community description',
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintText: 'Your bio',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      validator:
                          _model.myBioControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CREATECOMMUNITY_PAGE_NEXT_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');

                        await CommunitiesRecord.collection.doc().set({
                          ...createCommunitiesRecordData(
                            communityname: _model.yourNameController1.text,
                            description: _model.myBioController.text,
                            communityoneline: _model.yourNameController2.text,
                            owner: currentUserReference,
                            communityimage: '',
                            communitycover: '',
                            createdtime: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'members': [currentUserReference],
                            },
                          ),
                        });
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed('createcommunityimage');
                      },
                      text: 'Next',
                      options: FFButtonOptions(
                        width: 240.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                          color: Color(0xC9010912),
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
    );
  }
}
