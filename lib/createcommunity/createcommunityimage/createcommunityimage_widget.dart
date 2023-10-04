import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'createcommunityimage_model.dart';
export 'createcommunityimage_model.dart';

class CreatecommunityimageWidget extends StatefulWidget {
  const CreatecommunityimageWidget({Key? key}) : super(key: key);

  @override
  _CreatecommunityimageWidgetState createState() =>
      _CreatecommunityimageWidgetState();
}

class _CreatecommunityimageWidgetState
    extends State<CreatecommunityimageWidget> {
  late CreatecommunityimageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatecommunityimageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createcommunityimage'});
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

    return StreamBuilder<List<CommunitiesRecord>>(
      stream: queryCommunitiesRecord(
        queryBuilder: (communitiesRecord) => communitiesRecord
            .where(
              'owner',
              isEqualTo: currentUserReference,
            )
            .orderBy('createdtime', descending: true),
        singleRecord: true,
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
        List<CommunitiesRecord> createcommunityimageCommunitiesRecordList =
            snapshot.data!;
        final createcommunityimageCommunitiesRecord =
            createcommunityimageCommunitiesRecordList.isNotEmpty
                ? createcommunityimageCommunitiesRecordList.first
                : null;
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Add Cover image',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                              ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  _model.uploadedFileUrl1,
                                ).image,
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Color(0xFF01080E),
                          borderRadius: 1.0,
                          borderWidth: 2.0,
                          buttonSize: 64.0,
                          icon: Icon(
                            Icons.upload,
                            color: Color(0xFF01080E),
                            size: 10.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATECOMMUNITYIMAGE_upload_ICN_ON_TAP');
                            logFirebaseEvent(
                                'IconButton_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 99,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading1 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading1 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile1 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Add Profile image',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                              ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                _model.uploadedFileUrl2,
                              ).image,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFF7EFEF),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Color(0xFF01080E),
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload,
                            color: Color(0xFF01080E),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATECOMMUNITYIMAGE_upload_ICN_ON_TAP');
                            logFirebaseEvent(
                                'IconButton_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 98,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.05),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 64.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATECOMMUNITYIMAGE_NEXT_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await createcommunityimageCommunitiesRecord!
                                .reference
                                .update(createCommunitiesRecordData(
                              communityimage: _model.uploadedFileUrl2,
                              communitycover: _model.uploadedFileUrl1,
                            ));
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'createcommunitytags',
                              queryParameters: {
                                'createdcommunity': serializeParam(
                                  createcommunityimageCommunitiesRecord
                                      ?.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Next',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
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
                            borderRadius: BorderRadius.circular(8.0),
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
