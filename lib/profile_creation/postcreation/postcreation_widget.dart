import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/imageshow_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'postcreation_model.dart';
export 'postcreation_model.dart';

class PostcreationWidget extends StatefulWidget {
  const PostcreationWidget({
    Key? key,
    required this.community,
  }) : super(key: key);

  final DocumentReference? community;

  @override
  _PostcreationWidgetState createState() => _PostcreationWidgetState();
}

class _PostcreationWidgetState extends State<PostcreationWidget> {
  late PostcreationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostcreationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'postcreation'});
    _model.textController ??= TextEditingController();
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
      stream: CommunitiesRecord.getDocument(widget.community!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final postcreationCommunitiesRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xDAFF5963),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('POSTCREATION_arrow_back_sharp_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                ' Post',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.attach_file,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'POSTCREATION_PAGE_attach_file_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_upload_media_to_firebase');
                        final selectedMedia = await selectMedia(
                          imageQuality: 100,
                          includeBlurHash: true,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
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
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFiles = selectedUploadedFiles;
                              _model.uploadedFileUrls = downloadUrls;
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
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('POSTCREATION_PAGE_POST_BTN_ON_TAP');
                      if (postcreationCommunitiesRecord.blockedusers
                          .contains(currentUserReference)) {
                        logFirebaseEvent('Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'you are blocked from posting',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xDAFF5963),
                          ),
                        );
                        return;
                      }
                      if ((currentUserDocument?.communityownedlist?.toList() ??
                              [])
                          .contains(widget.community)) {
                        if (_model.switchValue!) {
                          logFirebaseEvent('Button_backend_call');

                          await PostRecord.collection.doc().set({
                            ...createPostRecordData(
                              postdescrition: _model.textController.text,
                              posttag: _model.dropDownValue,
                              posttype: _model.choiceChipsValue,
                              postCommunity: widget.community,
                              communityname:
                                  postcreationCommunitiesRecord.communityname,
                              communityimage:
                                  postcreationCommunitiesRecord.communityimage,
                              communitypost: true,
                              posttime: getCurrentTimestamp,
                              postUser: currentUserReference,
                            ),
                            ...mapToFirestore(
                              {
                                'sharedby': [currentUserReference],
                                'multipleimage': _model.uploadedFileUrls,
                              },
                            ),
                          });
                        } else {
                          logFirebaseEvent('Button_backend_call');

                          await PostRecord.collection.doc().set({
                            ...createPostRecordData(
                              postdescrition: _model.textController.text,
                              posttag: _model.dropDownValue,
                              posttype: _model.choiceChipsValue,
                              postCommunity: widget.community,
                              communityname:
                                  postcreationCommunitiesRecord.communityname,
                              communityimage:
                                  postcreationCommunitiesRecord.communityimage,
                              posttime: getCurrentTimestamp,
                              postUser: currentUserReference,
                              username: currentUserDisplayName,
                              userimage: currentUserPhoto,
                              communitypost: false,
                            ),
                            ...mapToFirestore(
                              {
                                'sharedby': [currentUserReference],
                                'multipleimage': _model.uploadedFileUrls,
                              },
                            ),
                          });
                        }

                        logFirebaseEvent('Button_wait__delay');
                        await Future.delayed(
                            const Duration(milliseconds: 5000));
                      } else {
                        logFirebaseEvent('Button_backend_call');

                        await PostRecord.collection.doc().set({
                          ...createPostRecordData(
                            postdescrition: _model.textController.text,
                            posttag: _model.dropDownValue,
                            posttype: _model.choiceChipsValue,
                            postCommunity: widget.community,
                            postUser: currentUserReference,
                            communityname:
                                postcreationCommunitiesRecord.communityname,
                            communityimage:
                                postcreationCommunitiesRecord.communityimage,
                            username: currentUserDisplayName,
                            userimage: currentUserPhoto,
                            communitypost: false,
                            posttime: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'sharedby': [currentUserReference],
                              'multipleimage': _model.uploadedFileUrls,
                            },
                          ),
                        });
                        logFirebaseEvent('Button_wait__delay');
                        await Future.delayed(
                            const Duration(milliseconds: 5000));
                      }

                      logFirebaseEvent('Button_trigger_push_notification');
                      triggerPushNotification(
                        notificationTitle:
                            postcreationCommunitiesRecord.communityname,
                        notificationText: _model.textController.text,
                        notificationImageUrl:
                            postcreationCommunitiesRecord.communityimage,
                        notificationSound: 'default',
                        userRefs:
                            postcreationCommunitiesRecord.members.toList(),
                        initialPageName: 'HomePage',
                        parameterData: {},
                      );
                      logFirebaseEvent('Button_navigate_to');

                      context.goNamed('HomePage');
                    },
                    text: 'Post',
                    options: FFButtonOptions(
                      width: 40.0,
                      height: 20.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xDAFF5963),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 48.0, 16.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData('Discuss'),
                            ChipData('Ask '),
                            ChipData('News'),
                            ChipData('Learning')
                          ],
                          onChanged: (val) => setState(
                              () => _model.choiceChipsValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w300,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            elevation: 4.0,
                            borderColor: Color(0xFFF7EFEF),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w300,
                                ),
                            iconColor: Color(0x00000000),
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderColor: Color(0xFFF7EFEF),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            ['Discuss'],
                          ),
                          wrapped: true,
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: postcreationCommunitiesRecord.tag,
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: 320.0,
                              height: 50.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              hintText: 'select post tag',
                              searchHintText: 'Search for a tag',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          width: 320.0,
                          child: TextFormField(
                            controller: _model.textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'write your post',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 9,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      if ((currentUserDocument?.communityownedlist?.toList() ??
                              [])
                          .contains(widget.community))
                        AuthUserStreamWidget(
                          builder: (context) => Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Text(
                                  'As a owner',
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: Switch.adaptive(
                                  value: _model.switchValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue = newValue!);
                                  },
                                  activeColor: Color(0xDAFF5963),
                                  activeTrackColor: Color(0xFFF7EFEF),
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      wrapWithModel(
                        model: _model.imageshowModel,
                        updateCallback: () => setState(() {}),
                        child: ImageshowWidget(
                          parameter1: _model.uploadedFileUrls,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
