import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class CustomSnackbar {
  /// Custom Snackbar used for implementing new Design Actionpay
  static SnackBar successSnackBar(
    String message, {

    /// Custom Snackbar isn't implemented from the original [SnackBar] so [onDismissed]
    /// function is required to hide [Snackbar] manually.
    void Function()? onDismiss,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: Shadows.universal,
        ),
        child: Row(
          children: [
            Container(
              height: 54.w,
              decoration: BoxDecoration(
                color: AppColor.successColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8.w),
                ),
              ),
              padding: EdgeInsets.all(Insets.sm),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: IconSizes.sm,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Insets.lg),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                size: IconSizes.med,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static SnackBar infoSnackBar(
    String message, {

    /// Custom Snackbar isn't implemented from the original [SnackBar] so [onDismissed]
    /// function is required to hide [Snackbar] manually.
    void Function()? onDismiss,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: Shadows.universal,
        ),
        child: Row(
          children: [
            Container(
              height: 54.w,
              decoration: BoxDecoration(
                color: AppColor.navyColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8.w),
                ),
              ),
              padding: EdgeInsets.all(Insets.sm),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: IconSizes.sm,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Insets.lg),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                size: IconSizes.med,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static SnackBar errorSnackBar(
    String message, {

    /// Custom Snackbar isn't implemented from the original [SnackBar] so [onDismissed]
    /// function is required to hide [Snackbar] manually.
    void Function()? onDismiss,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: Shadows.universal,
        ),
        child: Row(
          children: [
            Container(
              height: 54.w,
              decoration: BoxDecoration(
                color: AppColor.orangeColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8.w),
                ),
              ),
              padding: EdgeInsets.all(Insets.sm),
              child: Image.asset(
                AppIcons.icEmojiSad,
                width: 16.w,
                height: 16.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Insets.lg),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                size: IconSizes.med,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
