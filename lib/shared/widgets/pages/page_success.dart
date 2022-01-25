import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/assets.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/buttons/button_primary.dart';

class PageSuccess extends StatelessWidget {
  final String desc;
  final String? desc2;

  final Function() nextPage;

  const PageSuccess(
      {Key? key, required this.desc, required this.nextPage, this.desc2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(56.w),
              _buildTitle(context),
              verticalSpace(60.w),
              Image.asset(AppIllustrations.ilSuccess),
              verticalSpace(120.w),
              ButtonPrimary(
                onPressed: nextPage,
                label: 'login'.tr,
                height: IconSizes.xxl - 4,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('success'.tr,
            style: TextStyles.text2xlBold
                .copyWith(color: Theme.of(context).primaryColor)),
        verticalSpace(Insets.sm),
        Text(
          desc,
          style: TextStyles.textSm,
        ),
        desc2 != null
            ? Text(
                desc2!,
                style: TextStyles.textSm,
              )
            : Container(),
        Container()
      ],
    );
  }
}
