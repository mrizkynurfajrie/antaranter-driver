import 'package:get/get.dart';
import 'package:intake_rider/features/login/page_login.dart';
import 'package:intake_rider/features/register/page/page_register.dart';
import 'package:intake_rider/features/register/page/page_terms.dart';
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
      name: Routes.terms,
      page: () => const PageTerms(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const PageRegister(),
    ),
  ];
}
