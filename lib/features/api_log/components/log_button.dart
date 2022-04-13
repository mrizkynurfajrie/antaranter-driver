import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';

class LogButton extends StatelessWidget {
  const LogButton({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.xl,
      width: Sizes.xl,
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.apiLog),
        child: Container(
            width: Sizes.xl,
            height: Sizes.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: Corners.xxlBorder,
              color: color,
            ),
            child: const Icon(Icons.bug_report)
            // Text("POS",
            //     style: TextStyles.small2
            //         .copyWith(color: Theme.of(context).primaryColor)),
            ),
      ),
    );
  }
}
