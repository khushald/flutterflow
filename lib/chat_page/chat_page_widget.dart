import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UserProfileRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatPage'});
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            logFirebaseEvent('CHAT_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    widget.chatUser!.photoUrl,
                  ).image,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('CHAT_PAGE_PAGE_Icon_igxr4619_ON_TAP');
                logFirebaseEvent('Icon_show_snack_bar');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Navigate to add users page!',
                      style: TextStyle(),
                    ),
                    duration: Duration(milliseconds: 4000),
                  ),
                );
              },
              child: Icon(
                Icons.person_add,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: StreamBuilder<FFChatInfo>(
          stream: FFChatManager.instance.getChatInfo(
            otherUserRecord: widget.chatUser,
            chatReference: widget.chatRef,
          ),
          builder: (context, snapshot) => snapshot.hasData
              ? FFChatPage(
                  chatInfo: snapshot.data!,
                  allowImages: true,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                  currentUserBoxDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  otherUsersBoxDecoration: BoxDecoration(
                    color: Color(0xFF4B39EF),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  currentUserTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF1E2429),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                  ),
                  otherUsersTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                  inputHintTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Color(0xFF95A1AC),
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                  inputTextStyle: GoogleFonts.getFont(
                    'DM Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                  emptyChatWidget: Image.asset(
                    'assets/images/images_(1).jpeg',
                    width: MediaQuery.sizeOf(context).width * 0.76,
                  ),
                )
              : Center(
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
        ),
      ),
    );
  }
}
