//======= DART IMPORTS =======//
import 'dart:io';

//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/common/cache_image.dart';
import '../../controller/export_controllers.dart';
import '../../utils/export_utils.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUserController>(
        init: AddUserController(),
        builder: (controller) {
          return Scaffold(
            appBar: appBarWidget(
              controller.isUpdate ? StringConst.updateUser : StringConst.addUser,
              showBack: Navigator.canPop(context),
              color: defaultPrimaryColor,
            ),
            body: Stack(
              children: [
                AnimatedScrollView(
                  padding: const EdgeInsets.all(AppPadding.padding16),
                  children: [
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.height,
                          controller.imageProfile != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(AppRadius.radius36),
                                  child: Image.file(File(controller.imageProfile!.path), height: 120, width: 120, fit: BoxFit.fill, alignment: Alignment.center),
                                ).center()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(AppRadius.radius36),
                                  child: cacheImage(url: "", height: 120, width: 120, fit: BoxFit.fill),
                                ).center(),
                          16.height,
                          TextButton(
                            child: Text(StringConst.addImage, style: boldTextStyle()),
                            onPressed: () {
                              controller.btnAddPhoto(context);
                            },
                          ).center(),
                          16.height,
                          AppTextField(
                            controller: controller.nameCont,
                            textFieldType: TextFieldType.NAME,
                            nextFocus: controller.emailFocus,
                            decoration: appInputDecoration(hintText: StringConst.nameHintText, labelText: StringConst.userName),
                          ),
                          16.height,
                          AppTextField(
                            controller: controller.emailCont,
                            textFieldType: TextFieldType.EMAIL,
                            focus: controller.emailFocus,
                            nextFocus: controller.phoneNoFocus,
                            decoration: appInputDecoration(hintText: StringConst.emailHintText, labelText: StringConst.emailAddress),
                          ),
                          16.height,
                          AppTextField(
                            controller: controller.phoneNoCont,
                            textFieldType: TextFieldType.NUMBER,
                            focus: controller.phoneNoFocus,
                            decoration: appInputDecoration(hintText: StringConst.phoneHintText, labelText: StringConst.phoneNo),
                            onFieldSubmitted: (s) {
                              hideKeyboard(context);
                            },
                          ),
                          28.height,
                          AppButton(
                            text: StringConst.save,
                            width: Get.width,
                            color: defaultPrimaryColor,
                            onTap: () {
                              controller.btnSaveUser(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                if (controller.isLoading) Loader(),
              ],
            ),
          );
        });
  }
}
