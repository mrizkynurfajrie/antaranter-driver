import 'package:get/get.dart';
import 'package:intake_rider/features/login/binding_login.dart';
import 'package:intake_rider/features/login/page_login.dart';
import 'package:intake_rider/features/splash/page_splash.dart';
import 'package:intake_rider/routes/app_routes.dart';

class AppPages {
  static final pages = [
    // GetPage(
    //     name: Routes.INITIAL,
    //     page: () => const PageLogin(),
    //     binding: BindingLogin()),
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
  ];
}
