import 'package:antaranter_driverapp/features/splash/controller_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class SplashScreen extends GetView<ControllerSplash> {
  const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState;
//     splashscreenStart();
//   }

//   splashscreenStart() async {
//     var duration = const Duration(seconds: 4);
//     return Timer(duration, () {
//       Get.offNamed('/login_page');
//     });
//   }

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
    return BackgroundSplash(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: IconSizes.xxxl,
            child: Image.asset(
              "assets/logo/logo-only.png",
              width: IconSizes.xxxl,
            ),
          ),
          verticalSpace(25.h),
          Text(
            "AntarAnter Driver App",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: FontSizes.s20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
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
          Container(color: AppColor.bgPageColor),
          child!,
        ],
      ),
    );
  }
}
