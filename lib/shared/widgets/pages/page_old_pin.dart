import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/others/pin_numpad.dart';
import 'package:intake_rider/shared/widgets/others/preview_pin.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageOldChangePin extends StatefulWidget {
  const PageOldChangePin({
    Key? key,
  }) : super(key: key);
  @override
  _PageTemplateOldChangePinState createState() =>
      _PageTemplateOldChangePinState();
}

class _PageTemplateOldChangePinState extends State<PageOldChangePin> {
  String pin = '';

  _setPin(String value) {
    setState(() {
      pin = value;
      if (pin.length == 6) {
        Get.back(result: pin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      backgroundColor: AppColor.whiteColor,
      title: 'titleChangePin'.tr,
      toolbarElevation: 0,
      enableBack: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Insets.lg),
            child: InkWell(
              onTap: () {
                Get.updateLocale(const Locale('en', 'US'));
              },
              child: Image.asset(
                AppLogos.app,
                height: 37.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, Insets.lg, Insets.xl, Insets.lg),
            child: Text(
              'enterNewPin'.tr,
              style: TextStyles.textLgBold
                  .copyWith(color: AppColor.neutral.shade600),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: PreviewPin(
                text: pin,
                length: 6,
                show: false,
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: PinNumpad(pin: (value) {
                _setPin(value);
              }))
        ],
      ),
    );
  }
}
