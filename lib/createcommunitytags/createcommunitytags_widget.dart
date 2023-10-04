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
import 'createcommunitytags_model.dart';
export 'createcommunitytags_model.dart';

class CreatecommunitytagsWidget extends StatefulWidget {
  const CreatecommunitytagsWidget({
    Key? key,
    required this.createdcommunity,
  }) : super(key: key);

  final DocumentReference? createdcommunity;

  @override
  _CreatecommunitytagsWidgetState createState() =>
      _CreatecommunitytagsWidgetState();
}

class _CreatecommunitytagsWidgetState extends State<CreatecommunitytagsWidget> {
  late CreatecommunitytagsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatecommunitytagsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createcommunitytags'});
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
      stream: CommunitiesRecord.getDocument(widget.createdcommunity!),
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
        final createcommunitytagsCommunitiesRecord = snapshot.data!;
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
                  colors: [
                    Color(0xC9010912),
                    FlutterFlowTheme.of(context).error
                  ],
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData('webd'),
                          ChipData('frontend'),
                          ChipData('backend'),
                          ChipData('ML'),
                          ChipData('Data science'),
                          ChipData('AI'),
                          ChipData('finance'),
                          ChipData('investing'),
                          ChipData('economics'),
                          ChipData('PM'),
                          ChipData('Growth PM'),
                          ChipData('Graphic desing'),
                          ChipData('UI/UX'),
                          ChipData('Branding'),
                          ChipData('video editing'),
                          ChipData('Marketing'),
                          ChipData('Content'),
                          ChipData('Business'),
                          ChipData('Startup'),
                          ChipData('Leadership'),
                          ChipData('Sales'),
                          ChipData('Consulting'),
                          ChipData('Funding')
                        ],
                        onChanged: (val) async {
                          setState(() => _model.choiceChipsValues = val);
                          logFirebaseEvent(
                              'CREATECOMMUNITYTAGS_ChoiceChips_1sou7cvv');
                          logFirebaseEvent('ChoiceChips_update_app_state');
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
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 80.0, 0.0, 80.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATECOMMUNITYTAGS_PAGE_NEXT_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await widget.createdcommunity!.update({
                              ...mapToFirestore(
                                {
                                  'tag': FieldValue.arrayUnion(
                                      [_model.choiceChipsValues?[0]]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_backend_call');

                            await widget.createdcommunity!.update({
                              ...mapToFirestore(
                                {
                                  'tag': FieldValue.arrayUnion(
                                      [_model.choiceChipsValues?[1]]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_backend_call');

                            await widget.createdcommunity!.update({
                              ...mapToFirestore(
                                {
                                  'tag': FieldValue.arrayUnion(
                                      [_model.choiceChipsValues?[2]]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_backend_call');

                            await widget.createdcommunity!.update({
                              ...mapToFirestore(
                                {
                                  'tag': FieldValue.arrayUnion(
                                      [_model.choiceChipsValues?[3]]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_backend_call');

                            await widget.createdcommunity!.update({
                              ...mapToFirestore(
                                {
                                  'tag': FieldValue.arrayUnion(
                                      [_model.choiceChipsValues?[4]]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!.update({
                              ...createUserProfileRecordData(
                                createdTime: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'communityownedlist': FieldValue.arrayUnion(
                                      [widget.createdcommunity]),
                                  'communityjoined': FieldValue.arrayUnion(
                                      [widget.createdcommunity]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed('communitylist');
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
      },
    );
  }
}
