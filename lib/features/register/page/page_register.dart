import 'package:flutter/material.dart';
import 'package:intake_rider/features/register/controller_register.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_password.dart';
import 'package:intake_rider/shared/widgets/inputs/input_phone.dart';
import 'package:get/get.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/logo/logo-besar.png",
              width: size.width * 0.35,
            ),
            SizedBox(height: size.height * 0.025),
            Text(
              "Silakan daftarkan diri anda",
              style: TextStyles.textHeader,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.020),
            InputPhone(
              controller: controller.cPhoneNumber,
              phoneNumber: (value) {},
            ),
            InputPassword(
              onChange: (value) {},
              controller: controller.cPassword,
            ),
            SizedBox(height: size.height * 0.025),
            ButtonPrimary(
              label: 'Masuk',
              color: AppColor.primaryColor,
              onPressed: () {},
              size: 300,
            ),
          ],
        ),
      ),
    );
  }
}
