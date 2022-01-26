import 'package:get/get.dart';
import 'package:intakemobile/features/login/binding_login.dart';
import 'package:intakemobile/features/login/page_login.dart';
import 'package:intakemobile/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const PageLogin(),
        binding: BindingLogin()),
  ];
}
