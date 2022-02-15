import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intake_rider/const.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/welcome/page_welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Get.toNamed('/welcome_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundSplash(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/logo/logo-kecil-white.png",
            width: size.width * 0.50,
          ),
        ],
      ),
    );
  }
}

class BackgroundSplash extends StatelessWidget {
  final Widget? child;
  const BackgroundSplash({
    Key? key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: secondaryColor,
          ),
          child!,
        ],
      ),
    );
  }
}
