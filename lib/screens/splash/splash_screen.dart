//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import '../../controller/export_controllers.dart';
import '../../utils/export_utils.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Text(
          mAppName,
          style: boldTextStyle(size: AppTextSize.textSize28),
        ).center(),
      ),
    );
  }
}
