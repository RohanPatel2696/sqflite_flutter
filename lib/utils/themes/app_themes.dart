//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//======= PACKAGE IMPORTS =======//
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/export_utils.dart';

class AppTheme {
  //
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        background: const Color(0xFFF1F3F4),
        secondary: secondaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: scaffoldColor,
      cardColor: cardColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: textPrimaryColorGlobal),
      textTheme: GoogleFonts.poppinsTextTheme(),
      dialogBackgroundColor: Colors.white,
      unselectedWidgetColor: Colors.black,
      dividerColor: borderColor.withOpacity(0.5),
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        trackColor: WidgetStateProperty.all(primaryColor.withOpacity(0.3)),
        thumbColor: WidgetStateProperty.all(primaryColor),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: defaultRadius, topRight: defaultRadius),
        ),
        backgroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: cardLightColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      dialogTheme: DialogTheme(shape: dialogShape()),
      pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: createMaterialColor(primaryColor),
      primaryColor: dividerDarkColor,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: cardColor,
        onPrimary: primaryColor,
        onSurface: cardColor,
        brightness: Brightness.dark,
      ),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: primaryColor)),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: scaffoldDarkColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
        ),
      ),
      timePickerTheme: const TimePickerThemeData(
        dayPeriodTextColor: white,
        helpTextStyle: TextStyle(color: white),
      ),
      scaffoldBackgroundColor: scaffoldDarkColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: scaffoldSecondaryDark,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: GoogleFonts.poppinsTextTheme(),
      dialogBackgroundColor: scaffoldSecondaryDark,
      unselectedWidgetColor: Colors.white60,
      useMaterial3: true,
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: defaultRadius, topRight: defaultRadius),
        ),
        backgroundColor: scaffoldDarkColor,
      ),
      dividerColor: borderColor.withOpacity(0.2),
      cardColor: cardDarkColor,
      dialogTheme: DialogTheme(shape: dialogShape()),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
