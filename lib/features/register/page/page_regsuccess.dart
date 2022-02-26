import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageRegsuccess extends StatefulWidget {
  const PageRegsuccess({Key? key}) : super(key: key);

  @override
  State<PageRegsuccess> createState() => _PageRegsuccessState();
}

class _PageRegsuccessState extends State<PageRegsuccess> {
  @override
  void initState() {
    super.initState;
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Get.toNamed('/login_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/logo/logo-besar.png",
                width: size.width * 0.65,
              ),
              SizedBox(height: size.height * 0.30),
              Text(
                "Selamat!",
                style: TextStyles.textHeader,
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
    );
  }
}