//======= FLUTTER IMPORTS: =======//
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';
import 'package:get_storage/get_storage.dart';

//======= PROJECT IMPORTS =======//
import '../../screens/export_screens.dart';
import '../utils/export_utils.dart';
import 'utils/themes/app_themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: mAppName,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
