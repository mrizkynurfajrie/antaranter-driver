import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/assets.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/buttons/button_danger_outline.dart';
import 'package:intakemobile/shared/widgets/buttons/button_primary.dart';
import 'package:intakemobile/shared/widgets/cards/card_rounded.dart';
import 'package:qr_flutter/qr_flutter.dart';

showPopUp(
    {String? title,
    String? description,
    String? labelButton,
    String? imageUri,
    double? imageWidth,
    double? imageHeight,
    bool dismissible = false,
    Function? onPress}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.xlBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.lg),
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
                        height: imageHeight ?? IconSizes.xxl,
                        width: imageWidth ?? IconSizes.xxl,
                      )
                    : Container(),
                verticalSpace(Insets.xl),
                Text(
                  description ?? "",
                  style: TextStyles.body2,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                ButtonPrimary(
                  height: 54.w,
                  onPressed: () {
                    onPress != null ? onPress() : Get.back();
                  },
                  label: labelButton ?? "OK",
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible);
}

showPopUpError({Function? onError, required String errorMessage}) {
  if (onError != null) onError();
  showPopUp(
      title: "Ups! Ada Kesalahan",
      description: errorMessage.replaceAll('Exception', ''),
      imageUri: AppIllustrations.error,
      labelButton: "Kembali",
      onPress: () {
        Get.back();
      });
}

Future<dynamic> showPopUpConfirm({
  required BuildContext context,
  required String desc,
  required Function() functionYes,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Corners.med * 4))),
            titlePadding: const EdgeInsets.all(0),
            titleTextStyle: TextStyles.body1,
            contentPadding: EdgeInsets.all(Insets.lg),
            title: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Insets.med, horizontal: Insets.xs * 2.5),
              child: Column(
                children: [
                  verticalSpace(Insets.med),
                  Text(
                    "Konfirmasi",
                    style: TextStyles.subtitle1.copyWith(color: Colors.black),
                  ),
                  verticalSpace(Insets.xxl),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: TextStyles.body2
                        .copyWith(color: const Color(0xFF505050)),
                  )
                ],
              ),
            ),
            content: Row(
              children: [
                Expanded(
                  child: Container(
                      width: Get.width,
                      margin: EdgeInsets.only(right: Insets.xs),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(Corners.med * 2),
                      ),
                      child: TextButton(
                        onPressed: () => Get.back(),
                        child: Text("BATAL",
                            style: TextStyles.body2
                                .copyWith(fontWeight: FontWeight.w700)),
                      )),
                ),
                Expanded(
                  child: Container(
                      width: Get.width,
                      margin: EdgeInsets.only(left: Insets.xs),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Corners.med * 2),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          functionYes();
                        },
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        child: Text("YA",
                            style: TextStyles.body2.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColor.whiteColor)),
                      )),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

dialogConfirmation(
  BuildContext context, {
  String? title,
  String? desc1,
  String? desc2,
  String? desc3,
  String? label,
  Function? onPressed,
  bool? iconCancel,
}) {
  Get.dialog(
    Dialog(
      child: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (iconCancel == true)
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  )
                : Container(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SizedBox(
                width: double.infinity,
                child: Text(title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyles.h1
                        .apply(color: Theme.of(context).primaryColor)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(desc1 ?? '',
                        textAlign: TextAlign.center, style: TextStyles.h4),
                    desc3 != null
                        ? Text(desc3,
                            textAlign: TextAlign.center,
                            style: TextStyles.body1.copyWith(
                                color: Theme.of(context).primaryColor))
                        : Container(),
                    verticalSpace(Insets.lg),
                    Text(desc2 ?? '',
                        textAlign: TextAlign.center, style: TextStyles.body1),
                    verticalSpace(Insets.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonDangerOutline(
                          onPressed: () => Get.back(),
                          label: "Batal",
                          size: Get.width / 4,
                        ),
                        horizontalSpace(Insets.lg),
                        ButtonPrimary(
                          onPressed: () => Get.back(),
                          label: "Ya",
                          size: Get.width / 4,
                        )
                      ],
                    ),
                    const SizedBox(height: 26)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

showQrCode({required BuildContext context, required String qrCode}) {
  Get.dialog(Dialog(
    backgroundColor: Colors.transparent,
    child: CardRounded(
        padding: EdgeInsets.all(Insets.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('QR Code Berhasil di Buat !',
                style: TextStyles.subtitle1.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(.7))),
            verticalSpace(Insets.lg),
            QrImage(
              data: qrCode,
              size: 170,
              gapless: true,
              // foregroundColor: Colo,
            ),
            verticalSpace(Insets.lg),
            ButtonPrimary(
              size: Get.width * 0.5,
              onPressed: () {
                Get.back();
              },
              label: "Kembali",
              labelStyle: TextStyles.body2.copyWith(color: AppColor.whiteColor),
            )
          ],
        )),
  ));
}

Widget showError(
    {String? title,
    String? description,
    String? labelButton,
    Function()? onPress}) {
  return Padding(
    padding: EdgeInsets.all(Insets.lg),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title ?? "",
          style: TextStyles.h6,
          textAlign: TextAlign.center,
        ),
        verticalSpace(Insets.xxl),
        Image.asset(
          AppIllustrations.error,
          height: Get.height * 0.25,
        ),
        verticalSpace(Insets.xl),
        Text(
          description ?? "",
          style: TextStyles.body2,
          textAlign: TextAlign.center,
        ),
        verticalSpace(Insets.xl),
        ButtonPrimary(
          onPressed: () {
            onPress != null ? onPress() : Get.back();
          },
          label: labelButton ?? "OK",
        ),
      ],
    ),
  );
}

showToast(BuildContext context,
    {required String message,
    Color? color,
    Color? textColor,
    ToastGravity? gravity}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? Theme.of(context).primaryColor.withOpacity(.2),
      textColor: textColor ?? AppColor.bodyColor,
      fontSize: 12);
}

showLoading() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        decoration: BoxDecoration(
          borderRadius: Corners.xlBorder,
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(Insets.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitFoldingCube(
                size: 50.w,
                color: AppColor.primary,
              ),
              SizedBox(height: 20.w),
              Text(
                'Loading',
                style: TextStyles.body2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
