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
import 'createprofile_copy_model.dart';
export 'createprofile_copy_model.dart';

class CreateprofileCopyWidget extends StatefulWidget {
  const CreateprofileCopyWidget({Key? key}) : super(key: key);

  @override
  _CreateprofileCopyWidgetState createState() =>
      _CreateprofileCopyWidgetState();
}

class _CreateprofileCopyWidgetState extends State<CreateprofileCopyWidget> {
  late CreateprofileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateprofileCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createprofileCopy'});
    _model.yourNameController1 ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameController2 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.useroneline, ''));
    _model.myBioController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF01080E),
        body: Container(
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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 1.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            valueOrDefault(
                                currentUserDocument?.coveerimage, ''),
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
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
                                  'CREATEPROFILE_COPY_upload_ICN_ON_TAP');
                              logFirebaseEvent(
                                  'IconButton_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxHeight: 100.00,
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
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }

                              logFirebaseEvent('IconButton_backend_call');

                              await currentUserReference!
                                  .update(createUserProfileRecordData(
                                coveerimage: _model.uploadedFileUrl1,
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7EFEF),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                currentUserPhoto,
                              ).image,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFF7EFEF),
                            ),
                          ),
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
                        logFirebaseEvent(
                            'CREATEPROFILE_COPY_upload_ICN_ON_TAP');
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
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }

                        logFirebaseEvent('IconButton_backend_call');

                        await currentUserReference!
                            .update(createUserProfileRecordData(
                          photoUrl: _model.uploadedFileUrl2,
                        ));
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: _model.yourNameController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Name',
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
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        maxLines: null,
                        validator: _model.yourNameController1Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: _model.yourNameController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText:
                              'which colleg / company eg IITR 22 | Flares',
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
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        maxLines: null,
                        validator: _model.yourNameController2Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 12.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: _model.myBioController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).bodySmall,
                          hintText: 'Tell us about Yourself',
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        validator: _model.myBioControllerValidator
                            .asValidator(context),
                      ),
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
                            'CREATEPROFILE_COPY_PAGE_SAVE_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');

                        await currentUserReference!.update({
                          ...createUserProfileRecordData(
                            bio: _model.myBioController.text,
                            useroneline: _model.yourNameController2.text,
                            displayName: _model.yourNameController1.text,
                          ),
                          ...mapToFirestore(
                            {
                              'friends':
                                  FieldValue.arrayUnion([currentUserReference]),
                            },
                          ),
                        });
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed('settingspage');
                      },
                      text: 'Save',
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
  }
}
