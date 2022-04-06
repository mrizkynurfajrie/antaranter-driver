import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/saldo/api_saldo.dart';
import 'package:antaranter_driverapp/features/saldo/controller_saldo.dart';

class BindingSaldo implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerSaldo>(() => ControllerSaldo(api: ApiSaldo()));
  }
}
