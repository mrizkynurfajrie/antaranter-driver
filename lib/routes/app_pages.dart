import 'package:antaranter_driverapp/features/contact/binding_contact.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/contact/page_contact.dart';
import 'package:antaranter_driverapp/features/home/page_home.dart';
import 'package:antaranter_driverapp/features/login/page_login.dart';
import 'package:antaranter_driverapp/features/main/binding_main.dart';
import 'package:antaranter_driverapp/features/main/page_main.dart';
import 'package:antaranter_driverapp/features/nebeng_posting/binding_nebeng_posting.dart';
import 'package:antaranter_driverapp/features/nebeng_posting/page_nebeng_posting.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/binding_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/page_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/features/order_history/binding_order_history.dart';
import 'package:antaranter_driverapp/features/order_history/page_order_history.dart';
import 'package:antaranter_driverapp/features/profile/binding_profile.dart';
import 'package:antaranter_driverapp/features/profile/page_profile.dart';
import 'package:antaranter_driverapp/features/register/binding_register.dart';
import 'package:antaranter_driverapp/features/register/page/page_register.dart';
import 'package:antaranter_driverapp/features/register/page/page_terms.dart';
import 'package:antaranter_driverapp/features/saldo/binding_saldo.dart';
import 'package:antaranter_driverapp/features/saldo/page/page_topup.dart';
import 'package:antaranter_driverapp/features/saldo/page/page_saldo.dart';
import 'package:antaranter_driverapp/features/splash/page_splash.dart';
import 'package:antaranter_driverapp/features/register/page/page_regsuccess.dart';
import 'package:antaranter_driverapp/features/user_account/binding_user_account.dart';
import 'package:antaranter_driverapp/features/user_account/page_user_account.dart';
import 'package:antaranter_driverapp/features/vehicle_account/binding_vehicle_account.dart';
import 'package:antaranter_driverapp/features/vehicle_account/page_vehicle_account.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';

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
      binding: BindingRegister(),
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
      binding: BindingProfile(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const PageMain(),
      binding: BindingMain(),
    ),
    GetPage(
      name: Routes.saldo,
      page: () => const PageSaldo(),
      binding: BindingSaldo(),
    ),
    GetPage(
      name: Routes.actHistory,
      page: () => PageOrderHistory(),
      binding: BindingOrderHistory(),
    ),
    GetPage(
      name: Routes.posting,
      page: () => const PageNebengPosting(),
      binding: BindingNebengPosting(),
    ),
    GetPage(
      name: Routes.postingDetail,
      page: () => const PageNebengPostingDetail(),
      binding: BindingNebengPostingDetail(),
    ),
    GetPage(
      name: Routes.userAccount,
      page: () => const PageUserAccount(),
      binding: BindingUserAccount(),
    ),
    GetPage(
      name: Routes.vehicleAccount,
      page: () => const PageVehicleAccount(),
      binding: BindingVehicleAccount(),
    ),
    GetPage(
      name: Routes.contact,
      page: () => const PageContact(),
      binding: BindingContact(),
    ),
    GetPage(
      name: Routes.topup,
      page: () => const PageTopUp(),
    ),
  ];
}
