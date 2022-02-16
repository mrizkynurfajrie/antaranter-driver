import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/login/controller_login.dart';
import 'package:intake_rider/shared/widgets/buttons/button_text.dart';
import 'package:intake_rider/shared/widgets/inputs/input_password.dart';
import 'package:intake_rider/shared/widgets/inputs/input_phone.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bodyColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.025),
            Image.asset(
              "assets/logo/logo-besar.png",
              width: size.width * 0.65,
            ),
            SizedBox(height: size.height * 0.035),
            const Text(
              "Hai, mitra rider! siap antarin?",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: size.height * 0.050),
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
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 17,
                  child: Text('Belum punya akun? yuk'),
                ),
                ButtonText(
                  label: 'Daftar',
                  onPressed: () {
                    Get.toNamed('/howtoregister_page');
                  },
                  color: AppColor.primary.shade900,
                ),
                const SizedBox(
                  height: 17,
                  child: Text('dulu.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
