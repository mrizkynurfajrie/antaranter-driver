import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageRegsuccess extends StatelessWidget {
  const PageRegsuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
                  ],
                ),
                SizedBox(height: size.height * 0.30),
                Text(
                  "Selamat!",
                  style: TextStyles.textH2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Akun anda telah terdaftar",
                  style: TextStyles.textStd,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.020),
                LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColor.primaryColor,
                  size: 50,
                ),
                Text(
                  "Mohon tunggu sebentar..",
                  style: TextStyles.textStd,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
