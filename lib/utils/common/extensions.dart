//======= DART IMPORTS: =======//
import 'dart:convert';

//======= FLUTTER IMPORTS: =======//
import 'package:flutter/foundation.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';

extension StringExtensions on String {
  void printLog() {
    if (kDebugMode) log("===> $this");
  }

  Map<String, dynamic> stringToMap() {
    try {
      // Decode the JSON string into a Map
      return jsonDecode(this) as Map<String, dynamic>;
    } catch (e) {
      // Handle any errors that occur during decoding
      return {};
    }
  }
}
