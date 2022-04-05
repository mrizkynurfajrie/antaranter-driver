import 'package:get/get.dart';
import 'package:intake_rider/features/contact/page_contact.dart';
import 'package:intake_rider/features/home/page_home.dart';
import 'package:intake_rider/features/login/page_login.dart';
import 'package:intake_rider/features/main/binding_main.dart';
import 'package:intake_rider/features/main/page_main.dart';
import 'package:intake_rider/features/nebeng_posting/binding_nebeng_posting.dart';
import 'package:intake_rider/features/nebeng_posting/page_nebeng_posting.dart';
import 'package:intake_rider/features/nebeng_posting_detail/binding_nebeng_posting_detail.dart';
import 'package:intake_rider/features/nebeng_posting_detail/page_nebeng_posting_detail.dart';
import 'package:intake_rider/features/order_history/binding_order_history.dart';
import 'package:intake_rider/features/order_history/page_order_history.dart';
import 'package:intake_rider/features/profile/binding_profile.dart';
import 'package:intake_rider/features/profile/page_profile.dart';
import 'package:intake_rider/features/register/binding_register.dart';
import 'package:intake_rider/features/register/page/page_register.dart';
import 'package:intake_rider/features/register/page/page_terms.dart';
import 'package:intake_rider/features/saldo/binding_saldo.dart';
import 'package:intake_rider/features/saldo/page/page_topup.dart';
import 'package:intake_rider/features/saldo/page_saldo.dart';
import 'package:intake_rider/features/splash/page_splash.dart';
import 'package:intake_rider/features/register/page/page_regsuccess.dart';
import 'package:intake_rider/features/user_account/binding_user_account.dart';
import 'package:intake_rider/features/user_account/page_user_account.dart';
import 'package:intake_rider/features/vehicle_account/binding_vehicle_account.dart';
import 'package:intake_rider/features/vehicle_account/page_vehicle_account.dart';
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
    ),
    GetPage(
      name: Routes.topup,
      page: () => const PageTopUp(),
    ),
  ];
}
