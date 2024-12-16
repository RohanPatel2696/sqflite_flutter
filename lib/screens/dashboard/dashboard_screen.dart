//======= DART IMPORTS =======//
import 'dart:io';

//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';

//======= PROJECT IMPORTS =======//
import '../../controller/export_controllers.dart';
import '../../model/user_model.dart';
import '../../utils/export_utils.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarWidget(
            StringConst.userData,
            showBack: Navigator.canPop(context),
            color: defaultPrimaryColor,
            actions: [
              IconButton(
                onPressed: controller.btnAddUser,
                icon: const Icon(Icons.add_circle_outline_outlined, color: black),
              )
            ],
          ),
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                if (controller.userList != null && controller.userList!.isNotEmpty)
                  AnimatedListView(
                    itemCount: controller.userList!.length,
                    padding: const EdgeInsets.all(AppPadding.padding16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      UserResponse data = controller.userList![index];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: AppPadding.padding8),
                        padding: const EdgeInsets.all(AppPadding.padding16),
                        decoration: boxDecorationRoundedWithShadow(defaultRadius.toInt()),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.file(
                                File(data.profileImage.validate()),
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(defaultRadius),
                            ),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name.validate(), style: boldTextStyle(size: AppTextSize.textSize16)),
                                Text(data.emailAddress.validate(), style: primaryTextStyle(size: AppTextSize.textSize14)),
                                Text(data.phoneNo.validate(), style: secondaryTextStyle(size: AppTextSize.textSize14)),
                              ],
                            ).expand(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.btnEditUser(data);
                                  },
                                  icon: Icon(Icons.edit),
                                  padding: EdgeInsets.zero,
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.btnDeleteUser(context, id: data.id.validate());
                                  },
                                  icon: Icon(Icons.delete),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                if (!controller.isLoading && (controller.userList == null))
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: NoDataWidget(
                      title: 'Data Not Found',
                      subTitle: 'Currently user\'s not found in database',
                    ),
                  ).expand(),
                if (controller.isLoading) Loader().center(),
              ],
            ),
          ),
        );
      },
    );
  }
}
