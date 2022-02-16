import 'package:get/get.dart';
import 'package:intake_rider/features/login/page_login.dart';
import 'package:intake_rider/features/register/page/page_howToRegister.dart';
import 'package:intake_rider/features/splash/page_splash.dart';
import 'package:intake_rider/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const PageLogin(),
    ),
    GetPage(
      name: Routes.howtoreg,
      page: () => const PageHowToRegister(),
    ),
  ];
}
