import 'package:get/get.dart';
import 'package:intake_rider/features/activity_history/page_actHistory.dart';
import 'package:intake_rider/features/home/page_home.dart';
import 'package:intake_rider/features/login/page_login.dart';
import 'package:intake_rider/features/main/binding_main.dart';
import 'package:intake_rider/features/main/page_main.dart';
import 'package:intake_rider/features/order/binding_order.dart';
import 'package:intake_rider/features/order/page_order.dart';
import 'package:intake_rider/features/profile/page_profile.dart';
import 'package:intake_rider/features/register/binding_register.dart';
import 'package:intake_rider/features/register/page/page_register.dart';
import 'package:intake_rider/features/register/page/page_terms.dart';
import 'package:intake_rider/features/saldo/page_saldo.dart';
import 'package:intake_rider/features/splash/page_splash.dart';
import 'package:intake_rider/features/register/page/page_regsuccess.dart';
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
      binding: BindingRegister(),
    ),
    GetPage(
      name: Routes.regsuccess,
      page: () => const PageRegsuccess(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const PageHome(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const PageProfile(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const PageMain(),
      binding: BindingMain(),
    ),
    GetPage(
      name: Routes.saldo,
      page: () => const PageSaldo(),
    ),
    GetPage(
      name: Routes.actHistory,
      page: () => PageActivityHistory(),
    ),
    GetPage(
      name: Routes.order,
      page: () => PageOrder(),
      binding: BindingOrder(),
    ),
  ];
}
