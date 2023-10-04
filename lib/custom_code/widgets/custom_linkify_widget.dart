// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinkifyWidget extends StatefulWidget {
  const CustomLinkifyWidget({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.characterLimit = 0,
    this.textColor = Colors.black,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String text;
  final int characterLimit;
  final Color textColor;

  @override
  _CustomLinkifyWidgetState createState() => _CustomLinkifyWidgetState();
}

class _CustomLinkifyWidgetState extends State<CustomLinkifyWidget> {
  @override
  Widget build(BuildContext context) {
    String truncatedText = widget.text;
    if (widget.characterLimit > 0 &&
        truncatedText.length > widget.characterLimit) {
      truncatedText = truncatedText.substring(0, widget.characterLimit);
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: Linkify(
        onOpen: (link) async {
          if (!await launch(link.url)) {
            throw Exception('Could not launch ${link.url}');
          }
        },
        text: truncatedText,
        style: TextStyle(
          color: widget.textColor,
        ),
        linkStyle: TextStyle(
          color: Colors.blue, // Set the color of URLs to blue
        ),
      ),
    );
  }
}
