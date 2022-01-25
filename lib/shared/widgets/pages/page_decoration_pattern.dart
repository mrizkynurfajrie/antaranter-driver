import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/assets.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class PageDecorationPattern extends StatelessWidget {
  final bool isShowToolbar;
  final Widget child;
  final String title;
  const PageDecorationPattern({
    Key? key,
    this.isShowToolbar = true,
    required this.child,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(AppImages.bgPattern),
            Column(
              children: [
                isShowToolbar
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: Insets.sm),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColor.bodyColor.shade600,
                              ),
                            ),
                            Text(
                              title,
                              style: TextStyles.subtitle1,
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                Expanded(child: child)
              ],
            )
          ],
        ),
      ),
    );
  }
}
