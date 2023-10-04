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
import 'profileimage_model.dart';
export 'profileimage_model.dart';

class ProfileimageWidget extends StatefulWidget {
  const ProfileimageWidget({Key? key}) : super(key: key);

  @override
  _ProfileimageWidgetState createState() => _ProfileimageWidgetState();
}

class _ProfileimageWidgetState extends State<ProfileimageWidget> {
  late ProfileimageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileimageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'profileimage'});
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
      body: Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Add Profile image',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
              ),
              Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7EFEF),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          _model.uploadedFileUrl1,
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
                    showLoadingIndicator: true,
                    onPressed: () async {
                      logFirebaseEvent('PROFILEIMAGE_PAGE_upload_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_upload_media_to_firebase');
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        imageQuality: 83,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
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
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }
                    },
                  ),
                ],
              ),
              Text(
                'Add Cover image',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF7EFEF),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        _model.uploadedFileUrl2,
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xFF01080E),
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
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
                              'PROFILEIMAGE_PAGE_upload_ICN_ON_TAP');
                          logFirebaseEvent(
                              'IconButton_upload_media_to_firebase');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            imageQuality: 100,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
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
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
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
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 64.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('PROFILEIMAGE_PAGE_NEXT_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!
                          .update(createUserProfileRecordData(
                        photoUrl: _model.uploadedFileUrl1,
                        coveerimage: _model.uploadedFileUrl2,
                      ));
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('createprofile_tags');
                    },
                    text: 'Next',
                    options: FFButtonOptions(
                      width: 150.0,
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xFF01080E),
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
    );
  }
}
