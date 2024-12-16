//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import '../../model/user_model.dart';
import '../../screens/export_screens.dart';
import '../../utils/export_utils.dart';

class DashboardController extends GetxController {
  bool isLoading = false;
  List<UserResponse>? userList;

  @override
  void onInit() async {
    super.onInit();
    await getAllUser();
  }

  Future<void> btnAddUser() async {
    bool? res = await Get.to(() => const AddUserScreen());

    if (res ?? false) {
      await getAllUser();
      update();
    }
  }

  Future<void> getAllUser() async {
    isLoading = true;
    update();

    Future.delayed(const Duration(seconds: 2));

    await UserDatabaseHelper().getAllUserData().then((value) {
      userList = value;

      isLoading = false;
      update();
    }).catchError((e) {
      isLoading = false;
      update();
      toast(errorSomethingWentWrong, print: true);
    });
  }

  Future<void> btnEditUser(UserResponse userData) async {
    bool? res = await Get.to(() => AddUserScreen(), arguments: userData);

    if (res ?? false) {
      await getAllUser();
      update();
    }
  }

  Future<void> btnDeleteUser(BuildContext context, {required int id}) async {
    showConfirmDialogCustom(
      context,
      dialogType: DialogType.DELETE,
      title: StringConst.confirmationForDelete,
      positiveText: StringConst.yes,
      negativeText: StringConst.no,
      onAccept: (v) async {
        await UserDatabaseHelper().deleteUserData(id).then((value) async {
          if (value == 1) {
            log('Delete User: $value');
            await getAllUser();
            update();
            toast(StringConst.deleteUserSuccessfully);
          }
        }).catchError((e) {
          isLoading = false;
          update();
          toast(errorSomethingWentWrong, print: true);
        });
      },
    );
  }
}
