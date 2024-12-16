//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../model/user_model.dart';
//======= PROJECT IMPORTS =======//
import '../../screens/export_screens.dart';
import '../../utils/export_utils.dart';

class AddUserController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController phoneNoCont = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();

  XFile? imageProfile;
  bool isLoading = false;
  bool isUpdate = false;

  UserResponse? userData;

  @override
  void onInit() async {
    super.onInit();

    if (Get.arguments is UserResponse) {
      userData = Get.arguments;
      isUpdate = true;
      update();
    }

    if (userData != null) {
      nameCont.text = userData!.name.validate();
      emailCont.text = userData!.emailAddress.validate();
      phoneNoCont.text = userData!.phoneNo.validate();
      imageProfile = XFile(userData!.profileImage.validate());
    }
  }

  Future<void> btnAddPhoto(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultRadius), topRight: Radius.circular(defaultRadius))),
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ImageSourceDialog(
            onCamera: () async {
              Navigator.pop(context);
              imageProfile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 100);
              update();
            },
            onGallery: () async {
              Navigator.pop(context);
              imageProfile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100);
              update();
            },
          ),
        );
      },
    );
  }

  Future<void> btnSaveUser(BuildContext context) async {
    hideKeyboard(context);
    Future.delayed(const Duration(milliseconds: 1000));

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (imageProfile == null) {
        return toast(StringConst.selectImage);
      }

      isLoading = true;
      update();

      UserResponse userRes = UserResponse();
      if(isUpdate) userRes.id = userData!.id.validate();
      userRes.name = nameCont.text.validate();
      userRes.emailAddress = emailCont.text.validate();
      userRes.phoneNo = phoneNoCont.text.validate();
      userRes.profileImage = imageProfile != null ? imageProfile!.path : "";

      log("UserData: ${userRes.toJson()}");

      if (!isUpdate) {
        await UserDatabaseHelper().insertUserData(userRes).then((value) {
          toast(StringConst.addUserSuccessfully, print: true);

          Get.back(result: true);
        }).catchError((e) {
          toast(e.toString(), print: true);
        }).whenComplete(() {
          isLoading = false;
          update();
        });
      } else {
        await UserDatabaseHelper().updateUserData(userRes.id!.toInt(), userRes).then((value) {
          toast(StringConst.updateUserSuccessfully, print: true);

          Get.back(result: true);
        }).catchError((e) {
          toast(e.toString(), print: true);
        }).whenComplete(() {
          isLoading = false;
          update();
        });
      }
    }
  }
}
