import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? newCustomFunction(
  DateTime? currenttime,
  DateTime? posttime,
) {
  // calculate when was this post posted in hours or days ago using the current time and the time of post
  final difference = currenttime!.difference(posttime!);
  if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
  } else {
    final hours = difference.inHours;
    if (hours > 0) {
      return '$hours hour${hours == 1 ? '' : 's'} ago';
    } else {
      final minutes = difference.inMinutes;
      return '$minutes minute${minutes == 1 ? '' : 's'} ago';
    }
  }
}
