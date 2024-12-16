//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/export_utils.dart';

InputDecoration appInputDecoration({String? hintText, String? labelText, IconData? prefixIcon, String? errorText, Color? hintTextColor, Widget? prefix, double? borderRadius}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: secondaryTextStyle(size: 14, color: hintTextColor ?? textSecondaryColorGlobal),
    labelText: labelText,
    labelStyle: secondaryTextStyle(size: 16),
    errorText: errorText,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(borderRadius ?? defaultRadius),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(borderRadius ?? defaultRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: defaultPrimaryColor),
      borderRadius: BorderRadius.circular(borderRadius ?? defaultRadius),
    ),
  );
}
