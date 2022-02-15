import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class Body extends StatelessWidget {
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
    return Container(
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
