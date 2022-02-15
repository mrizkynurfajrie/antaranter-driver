import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class EmptyState extends StatelessWidget {
  final String? description;
  const EmptyState({
    Key? key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Insets.xxl),
        child: Column(
          children: [
            const Opacity(opacity: .3, child: Text('Empty')
                // Image.asset(
                //   AppIllustrations.empty,
                //   width: Get.width * 0.5,
                // ),
                ),
            verticalSpace(Insets.xl),
            Text(
              description ?? '',
              style: TextStyles.small1
                  .copyWith(color: AppColor.bodyColor.shade600),
            )
          ],
        ),
      ),
    );
  }
}
