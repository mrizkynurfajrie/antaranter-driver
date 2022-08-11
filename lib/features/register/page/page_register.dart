import 'dart:developer';

import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageDecorationTop(
        title: '',
        toolbarColor: AppColor.whiteColor,
        toolbarTitleColor: AppColor.primaryColor,
        backgroundColor: AppColor.whiteColor,
        padding: EdgeInsets.zero,
        center: controller.currentPage.value < 2
            ? Center(
                child: Text(
                  'Daftar',
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s16,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: 117.w),
                child: Text(
                  'Daftar',
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s16,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
        enableBack: controller.currentPage.value <= 1 ? false : true,
        onBackPressed: () {
          var nextForm = controller.currentPage.value - 1;
          if (nextForm >= 0) {
            if (controller.currentPage.value == 4) {
              controller.agreementstatus.value = false;
              controller.statusCheck.value = false;
            } else {
              if (controller.currentPage.value == 3) {
                controller.updatedvehicle.value = false;
              } else {
                if (controller.currentPage.value == 2) {
                  controller.updateddata.value = false;
                }
              }
            }
            controller.changePage(nextForm);
            controller.pageController.animateToPage(
              nextForm,
              duration: Times.medium,
              curve: Curves.easeInOut,
            );
          } else {
            Get.back();
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            var nextForm = controller.currentPage.value - 1;
            if (nextForm >= 0 && controller.isRegistered.value == false) {
              if (controller.currentPage.value == 4) {
                controller.agreementstatus.value = false;
                controller.statusCheck.value = false;
              } else {
                if (controller.currentPage.value == 3) {
                  controller.updatedvehicle.value = false;
                } else {
                  if (controller.currentPage.value == 2) {
                    controller.updateddata.value = false;
                  }
                }
              }
              controller.changePage(nextForm);
              controller.pageController.animateToPage(
                nextForm,
                duration: Times.medium,
                curve: Curves.easeInOut,
              );
              return false;
            } else {
              return false;
            }
          },
          child: Stack(children: <Widget>[
            SvgPicture.asset(
              AppIcons.circlebg,
              width: Get.width,
              color: AppColor.primaryColor,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: controller.currentPage.value >= 1
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.h),
                              border: Border.all(
                                color: AppColor.primaryColor,
                              )),
                        ),
                        Expanded(
                          child: Divider(
                            color: controller.currentPage.value >= 1
                                ? AppColor.primaryColor
                                : AppColor.neutral.shade400,
                            thickness: 1,
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value >= 2
                                ? AppColor.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.h),
                            border: Border.all(
                              color: controller.currentPage.value < 1
                                  ? AppColor.neutral.shade400
                                  : AppColor.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: controller.currentPage.value >= 2
                                ? AppColor.primaryColor
                                : AppColor.neutral.shade400,
                            thickness:
                                controller.currentPage.value <= 2 ? 0 : 1,
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value >= 3
                                ? AppColor.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.h),
                            border: Border.all(
                              color: controller.currentPage.value < 2
                                  ? AppColor.neutral.shade400
                                  : AppColor.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: controller.currentPage.value >= 3
                                ? AppColor.primaryColor
                                : AppColor.neutral.shade400,
                            thickness:
                                controller.currentPage.value <= 3 ? 0 : 1,
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value >= 4
                                ? AppColor.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.h),
                            border: Border.all(
                              color: controller.currentPage.value < 3
                                  ? AppColor.neutral.shade400
                                  : AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(Insets.sm),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (pageIndex) {
                      controller.changePage(pageIndex);
                    },
                    children: controller.pages,
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      verticalSpace(5.h),
                      ButtonPrimary(
                        size: 345.w,
                        height: 45.h,
                        enable: controller.currentPage.value == 0
                            ? controller.isValidFormUser.value &&
                                controller.isCheck.value == true
                            : controller.currentPage.value == 1 &&
                                    controller.currentPage.value != 0
                                ? controller.isValidFormData.value
                                : controller.currentPage.value == 2 &&
                                        controller.currentPage.value != 1
                                    ? controller.isValidFormVehicle.value
                                    : controller.currentPage.value == 3 &&
                                            controller.currentPage.value != 2
                                        ? controller.statusCheck.value
                                        : true,
                        onPressed: () async {
                          var nextForm = controller.currentPage.value + 1;
                          if (nextForm < 3) {
                            if (controller.currentPage.value == 0) {
                              showPopUpChoice(
                                title: 'Daftar',
                                description:
                                    'Pastikan data telah terisi dengan benar.',
                                imageUri: AppIcons.socmarket,
                                imageSize: IconSizes.xxxl,
                                labelPositif: 'Ya',
                                labelNegatif: 'Tidak',
                                onConfirm: () async {
                                  Get.back();
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) {
                                      return Center(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 75.h,
                                            maxWidth: 75.w,
                                          ),
                                          child:
                                              const CircularProgressIndicator(
                                            color: AppColor.primaryColor,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  await controller.register();
                                  if (controller.isRegistered.value == true) {
                                    controller.getProvinces();
                                    controller.changePage(nextForm);
                                    controller.pageController.animateToPage(
                                      nextForm,
                                      duration: Times.medium,
                                      curve: Curves.easeInOut,
                                    );
                                    log('current page : ' +
                                        controller.currentPage.toString());
                                    Get.back();
                                  } else {
                                    Get.back();
                                  }
                                },
                                onCancel: () => Get.back(),
                              );
                            } else {
                              if (controller.currentPage.value == 1 &&
                                  controller.isValidFormData.value == true) {
                                showPopUpChoice(
                                  title: 'Perbarui Akun',
                                  description:
                                      'Pastikan data telah terisi dengan benar.',
                                  imageUri: AppIcons.socmarket,
                                  imageSize: IconSizes.xxxl,
                                  labelPositif: 'Ya',
                                  labelNegatif: 'Tidak',
                                  onConfirm: () async {
                                    Get.back();
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) {
                                        return Center(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxHeight: 75.h,
                                              maxWidth: 75.w,
                                            ),
                                            child:
                                                const CircularProgressIndicator(
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    await controller.updateUserAccount();
                                    if (controller.updateddata.value == true) {
                                      controller.getVehicleData();
                                      controller.changePage(nextForm);
                                      controller.pageController.animateToPage(
                                        nextForm,
                                        duration: Times.medium,
                                        curve: Curves.easeInOut,
                                      );
                                      log('current page : ' +
                                          controller.currentPage.toString());
                                      Get.back();
                                    } else {
                                      Get.back();
                                    }
                                  },
                                  onCancel: () => Get.back(),
                                );
                              }
                            }
                          } else {
                            if (controller.currentPage.value == 2 &&
                                controller.isValidFormVehicle.value == true) {
                              showPopUpChoice(
                                title: 'Perbarui Akun',
                                description:
                                    'Pastikan data telah terisi dengan benar.',
                                imageUri: AppIcons.socmarket,
                                imageSize: IconSizes.xxxl,
                                labelPositif: 'Ya',
                                labelNegatif: 'Tidak',
                                onConfirm: () async {
                                  Get.back();
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) {
                                      return Center(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 75.h,
                                            maxWidth: 75.w,
                                          ),
                                          child:
                                              const CircularProgressIndicator(
                                            color: AppColor.primaryColor,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  await controller.updateVehicleAccount();
                                  if (controller.updatedvehicle.value == true) {
                                    controller.getDataAgreement();
                                    controller.getAgreementStatus();
                                    controller.changePage(nextForm);
                                    controller.pageController.animateToPage(
                                      nextForm,
                                      duration: Times.medium,
                                      curve: Curves.easeInOut,
                                    );
                                    log('current page : ' +
                                        controller.currentPage.toString());
                                    Get.back();
                                  } else {
                                    return null;
                                  }
                                },
                                onCancel: () => Get.back(),
                              );
                            } else {
                              if (controller.currentPage.value == 3 &&
                                  controller.statusCheck.value == true) {
                                await controller.updateAgreement();
                                Get.offAndToNamed(Routes.regsuccess);
                                await Future.delayed(
                                    const Duration(seconds: 5));
                                Get.offAllNamed(Routes.main, arguments: 0);
                              }
                            }
                          }
                        },
                        label: controller.currentPage.value < 3
                            ? 'Selanjutnya'
                            : 'Daftar',
                        labelStyle: TextStyles.bottomButton
                            .copyWith(color: AppColor.whiteColor),
                        cornerRadius: Corners.lg,
                      ),
                      verticalSpace(5.h)
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
