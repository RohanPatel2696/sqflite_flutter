//======= PACKAGE IMPORTS =======//
import 'package:get/get.dart';

//======= PROJECT IMPORTS =======//
import '../../screens/export_screens.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Get.offAll(() => const DashboardScreen());
  }
}
