import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary_outline.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

showPopUp({
  String? title,
  String? description,
  String? labelButton,
  String? imageUri,
  double? imageSize,
  bool? dismissible,
  Widget? widget,
  Function()? onPress,
  Color? outlineButtonColor,
  Color? labelButtonColor,
}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.medBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? "",
                  style: TextStyles.subtitle1,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xxl),
                imageUri != null
                    ? SvgPicture.asset(
                        imageUri,
                        height: imageSize ?? IconSizes.xxl,
                        width: imageSize ?? IconSizes.xxl,
                      )
                    : Container(),
                verticalSpace(Insets.xl),
                widget ?? Container(),
                Text(
                  description ?? "",
                  style: TextStyles.body2.copyWith(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                SizedBox(
                  child: labelButton != null
                      ? ButtonPrimaryOutline(
                          onPressed: onPress ?? () => Get.back(),
                          label: labelButton,
                          color: AppColor.whiteColor,
                          outlineColor:
                              outlineButtonColor ?? AppColor.primaryColor,
                          labelStyle: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            fontWeight: FontWeight.w500,
                            color: labelButtonColor ?? AppColor.primaryColor,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible ?? true);
}
showPopUpPng({
  String? title,
  String? description,
  String? labelButton,
  String? imageUri,
  double? imageSize,
  bool? dismissible,
  Widget? widget,
  Function()? onPress,
  Color? outlineButtonColor,
  Color? labelButtonColor,
}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.medBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? "",
                  style: TextStyles.subtitle1,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xxl),
                imageUri != null
                    ? Image.asset(
                        imageUri,
                        height: imageSize ?? IconSizes.xxl,
                        width: imageSize ?? IconSizes.xxl,
                      )
                    : Container(),
                verticalSpace(Insets.xl),
                widget ?? Container(),
                Text(
                  description ?? "",
                  style: TextStyles.body2.copyWith(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                SizedBox(
                  child: labelButton != null
                      ? ButtonPrimaryOutline(
                          onPressed: onPress ?? () => Get.back(),
                          label: labelButton,
                          color: AppColor.whiteColor,
                          outlineColor:
                              outlineButtonColor ?? AppColor.primaryColor,
                          labelStyle: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            fontWeight: FontWeight.w500,
                            color: labelButtonColor ?? AppColor.primaryColor,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible ?? true);
}

showPopUpError({
  Function()? onError,
  String? errorTitle,
  required String errorMessage,
}) {
  if (onError != null) onError();
  showPopUp(
      title: errorTitle ?? "Informasi",
      description: errorMessage,
      imageUri: PopUpIcons.error,
      labelButton: "Kembali",
      onPress: () {
        Get.back();
      });
}

showPopUpChoice({
  String? title,
  String? description,
  String? labelNegatif,
  String? labelPositif,
  String? imageUri,
  double? imageSize,
  bool? dismissible,
  Function()? onConfirm,
  Function()? onCancel,
}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.lgBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? "",
                  style: TextStyles.subtitle1,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                if (imageUri != null)
                  SvgPicture.asset(
                    imageUri,
                    height: imageSize ?? IconSizes.xxl,
                    width: imageSize ?? IconSizes.xxl,
                  ),
                Text(
                  description ?? "",
                  style: TextStyles.body2.copyWith(color: AppColor.greyColor),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                Row(
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                        onPressed: onCancel ?? () => Get.back(),
                        label: labelNegatif ?? "Batal",
                        labelStyle: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    horizontalSpace(Insets.xl),
                    Expanded(
                      child: ButtonPrimary(
                        onPressed: onConfirm ?? () => Get.back(),
                        label: labelPositif ?? "Ya",
                        color: AppColor.whiteColor,
                        borderColor: AppColor.primaryColor,
                        labelStyle: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible ?? true);
}
showPopUpChoicePng({
  String? title,
  String? description,
  String? labelNegatif,
  String? labelPositif,
  String? imageUri,
  double? imageSize,
  bool? dismissible,
  Function()? onConfirm,
  Function()? onCancel,
}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.lgBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? "",
                  style: TextStyles.subtitle1,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                if (imageUri != null)
                  Image.asset(
                    imageUri,
                    height: imageSize ?? IconSizes.xxl,
                    width: imageSize ?? IconSizes.xxl,
                  ),
                Text(
                  description ?? "",
                  style: TextStyles.body2.copyWith(color: AppColor.greyColor),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                Row(
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                        onPressed: onCancel ?? () => Get.back(),
                        label: labelNegatif ?? "Batal",
                        labelStyle: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    horizontalSpace(Insets.xl),
                    Expanded(
                      child: ButtonPrimary(
                        onPressed: onConfirm ?? () => Get.back(),
                        label: labelPositif ?? "Ya",
                        color: AppColor.whiteColor,
                        borderColor: AppColor.primaryColor,
                        labelStyle: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible ?? true);
}

// dialogConfirmation({
//   String? title,
//   String? desc1,
//   String? desc2,
//   String? desc3,
//   String label = "Ya",
//   Function? onPressed,
//   bool iconCancel = false,
// }) {
//   Get.dialog(
//     Dialog(
//       shape: RoundedRectangleBorder(borderRadius: Corners.lgBorder),
//       child: Container(
//         padding: EdgeInsets.zero,
//         width: double.infinity,
//         decoration: BoxDecoration(borderRadius: Corners.lgBorder),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             (iconCancel == true)
//                 ? Align(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                       icon: const Icon(
//                         Icons.cancel,
//                         color: Colors.grey,
//                         size: 25,
//                       ),
//                       onPressed: () {
//                         Get.back();
//                       },
//                     ),
//                   )
//                 : Container(height: 25),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Text(title ?? '',
//                     textAlign: TextAlign.center,
//                     style: TextStyles.subtitle2
//                         .apply(color: AppColor.primaryColor)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               child: Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     desc1 != null
//                         ? Text(desc1,
//                             textAlign: TextAlign.center,
//                             style: TextStyles.small1)
//                         : const SizedBox(),
//                     desc3 != null
//                         ? Text(desc3,
//                             textAlign: TextAlign.center,
//                             style: TextStyles.small1
//                                 .copyWith(color: AppColor.primaryColor))
//                         : const SizedBox(),
//                     verticalSpace(Insets.lg),
//                     desc2 != null
//                         ? Text(desc2,
//                             textAlign: TextAlign.center,
//                             style: TextStyles.small1)
//                         : const SizedBox(),
//                     verticalSpace(Insets.lg),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ButtonPrimaryOutline(
//                             onTap: () => Get.back(),
//                             label: "Batal",
//                           ),
//                         ),
//                         horizontalSpace(Insets.lg),
//                         Expanded(
//                           child: ButtonPrimary(
//                             onTap: onPressed != null
//                                 ? () {
//                                     Get.back();
//                                     onPressed();
//                                   }
//                                 : () => Get.back(),
//                             label: label,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 26)
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );
// }

// showQrCode({required BuildContext context, required String qrCode}) {
//   Get.dialog(Dialog(
//     backgroundColor: Colors.transparent,
//     child: CardRounded(
//         padding: EdgeInsets.all(Insets.xl),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text('QR Code Berhasil di Buat !',
//                 style: TextStyles.subtitle3
//                     .copyWith(color: AppColor.primaryColor)),
//             verticalSpace(Insets.lg),
//             QrImage(
//               data: qrCode,
//               size: 170,
//               gapless: true,
//               // foregroundColor: Colo,
//             ),
//             verticalSpace(Insets.lg),
//             ButtonPrimary(
//               onTap: () {
//                 Get.back();
//               },
//               label: "Kembali",
//             )
//           ],
//         )),
//   ));
// }

// Widget showError(
//     {String? title,
//     String? description,
//     String? labelButton,
//     Function()? onPress}) {
//   return Padding(
//     padding: EdgeInsets.all(Insets.lg),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           title ?? "",
//           style: TextStyles.h6,
//           textAlign: TextAlign.center,
//         ),
//         verticalSpace(Insets.xxl),
//         Image.asset(
//           AppIllustrations.error,
//           height: Get.height * 0.25,
//         ),
//         verticalSpace(Insets.xl),
//         Text(
//           description ?? "",
//           style: TextStyles.body2,
//           textAlign: TextAlign.center,
//         ),
//         verticalSpace(Insets.xl),
//         ButtonPrimary(
//           onTap: () {
//             onPress != null ? onPress() : Get.back();
//           },
//           label: labelButton ?? "OK",
//         ),
//       ],
//     ),
//   );
// }

showToast(
    {required String message,
    Color? color,
    Color? textColor,
    ToastGravity? gravity}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? AppColor.primaryColor.withOpacity(.4),
      textColor: textColor ?? AppColor.bodyColor,
      fontSize: 12);
}

showPopUpImage({
  String? imageUri,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: Corners.lgBorder),
      child: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: Corners.lgBorder),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageUri != null
                ? Image.network(
                    imageUri,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}
// choiceShowDialog({
//   required dynamic Function() onPress,
//   required dynamic Function() onPress2,
//   String? title,
//   String? description,
//   String? imageUri,
//   String? labelButton,
//   String? labelButton2,
//   bool useTwoButton = false,
//   double? bottomWidth,
//   bool dismissible = true,
// }) {
//   Get.dialog(
//       Dialog(
//         child: SizedBox(
//           child: Padding(
//             padding: EdgeInsets.all(20.w),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 imageUri != null
//                     ? Padding(
//                         padding: EdgeInsets.only(top: 10.w, bottom: 35.w),
//                         child: SizedBox(
//                           width: 244.w,
//                           height: 175.w,
//                           child: CardRounded(
//                               margin: EdgeInsets.zero,
//                               padding: EdgeInsets.zero,
//                               borderRadius: 100.w,
//                               child:
//                                   Image.asset(imageUri, fit: BoxFit.contain)),
//                         ),
//                       )
//                     : const SizedBox(),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 40.w),
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: Text(
//                       title ?? '',
//                       style: TextStyles.subtitle1,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 verticalSpace(10.w),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 15.w),
//                       child: SizedBox(
//                           width: bottomWidth ?? 194.w,
//                           child: ButtonPrimary(
//                             gradient: AppColor.gradientPrimaryLeft,
//                             onTap: onPress,
//                             label: labelButton ?? '',
//                             width: 247.w,
//                           )),
//                     ),
//                     useTwoButton
//                         ? Container(
//                             margin: EdgeInsets.only(top: 15.0),
//                             width: bottomWidth ?? 194,
//                             child: ButtonPrimary(
//                               color: Colors.grey,
//                               onTap: onPress2,
//                               label: labelButton2 ?? '',
//                               width: 247.w,
//                             ))
//                         : const SizedBox(),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       barrierDismissible: dismissible);
// }

dialogUpdateApp({
  String? title,
  String? desc,
  String labelUpdate = "Update",
  String labelCancel = "Nanti Saja",
  Function()? onConfirm,
  Function()? onCancel,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: Corners.lgBorder),
      child: Container(
        padding: EdgeInsets.only(
          top: Insets.xl,
          left: Insets.xl,
          right: Insets.xl,
          bottom: Insets.xl,
        ),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: Corners.lgBorder),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(title ?? '',
                  style: TextStyles.textLg.apply(
                    color: AppColor.neutral,
                  )),
            ),
            verticalSpace(Insets.sm),
            desc != null
                ? Text(desc, style: TextStyles.textSm)
                : const SizedBox(),
            verticalSpace(Insets.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonText(
                  onPressed: onCancel != null
                      ? () {
                          onCancel();
                        }
                      : () => Get.back(),
                  label: labelCancel,
                  textStyle: TextStyles.textSm.copyWith(
                    height: 1.71,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                horizontalSpace(Insets.lg),
                ButtonText(
                  color: AppColor.primaryColor,
                  onPressed: onConfirm != null
                      ? () {
                          onConfirm();
                        }
                      : () => Get.back(),
                  label: labelUpdate,
                  textStyle: TextStyles.textSm.copyWith(
                    height: 1.71,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

dialogError({var errorTitle, required var message}) {
  Get.defaultDialog(
      title: errorTitle ?? "Terjadi Kesalahan",
      content: Column(
        children: <Widget>[
          Text(
            message ?? "Informasi",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ButtonPrimary(
              onPressed: () => Get.back(),
              size: Get.width * 0.5,
              label: 'Kembali')
        ],
      ));
}