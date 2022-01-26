import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/features/login/controller_login.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/buttons/button_bottom_one.dart';
import 'package:intakemobile/shared/widgets/inputs/input_phone.dart';
import 'package:intakemobile/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: "Login",
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(20.w),
            InputPhone(
                label: "Nomor Handphone",
                controller: controller.cPhoneNumber,
                phoneNumber: (value) {})
          ],
        ),
      ),
      bottomBar: ButtonBottomOne(
        label: "Login",
        onTap: () {},
      ),
    );
  }
}
