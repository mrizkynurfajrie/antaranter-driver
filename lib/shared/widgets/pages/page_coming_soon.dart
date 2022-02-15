import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';

class PageComingSoon extends StatelessWidget {
  const PageComingSoon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIllustrations.ilComingSoon,
                width: IconSizes.med * 10.5),
            Text("Dalam Pengembangan",
                style: TextStyles.body1.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            verticalSpace(Insets.med),
            Text(
                "Layanan ini masih dalam proses pengembangan.\nAnda belum dapat menggunakan layanan ini.",
                style: TextStyles.small1,
                textAlign: TextAlign.center),
            verticalSpace(Insets.xxl),
            ButtonPrimary(
              margin: EdgeInsets.symmetric(horizontal: Get.width / 4),
              onPressed: () {
                Get.back();
              },
              label: 'Back',
            ),
          ],
        ),
      ),
    );
  }
}
