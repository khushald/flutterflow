import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'createprofile_tags_model.dart';
export 'createprofile_tags_model.dart';

class CreateprofileTagsWidget extends StatefulWidget {
  const CreateprofileTagsWidget({Key? key}) : super(key: key);

  @override
  _CreateprofileTagsWidgetState createState() =>
      _CreateprofileTagsWidgetState();
}

class _CreateprofileTagsWidgetState extends State<CreateprofileTagsWidget> {
  late CreateprofileTagsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateprofileTagsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<TagsRecord>>(
      stream: queryTagsRecord(),
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
        List<TagsRecord> createprofileTagsTagsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF01080E),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF01080E),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/images_(1).jpeg',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData('product '),
                          ChipData('desing'),
                          ChipData('video editing'),
                          ChipData('marketing'),
                          ChipData('copywriting'),
                          ChipData('gamedev'),
                          ChipData('')
                        ],
                        onChanged: (val) async {
                          setState(() => _model.choiceChipsValues = val);
                          setState(() {
                            FFAppState().addToTag('');
                          });
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xDAFF5963),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          [''],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 80.0, 0.0, 80.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await currentUserReference!.update({
                              'tags': FieldValue.arrayUnion(
                                  [_model.choiceChipsValues?.first]),
                            });

                            await currentUserReference!.update({
                              'tags': FieldValue.arrayUnion(
                                  [_model.choiceChipsValues?[1]]),
                            });

                            await currentUserReference!.update({
                              'tags': FieldValue.arrayUnion(
                                  [_model.choiceChipsValues?[2]]),
                            });

                            await currentUserReference!.update({
                              'tags': FieldValue.arrayUnion(
                                  [_model.choiceChipsValues?[3]]),
                            });

                            await currentUserReference!.update({
                              'tags': FieldValue.arrayUnion(
                                  [_model.choiceChipsValues?[4]]),
                            });

                            context.pushNamed('addcommunity');
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
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
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
      },
    );
  }
}
