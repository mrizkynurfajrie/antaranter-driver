import 'package:get/get.dart';
import 'package:intake_rider/features/saldo/api_saldo.dart';
import 'package:intake_rider/features/saldo/controller_saldo.dart';

class BindingSaldo implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerSaldo>(() => ControllerSaldo(api: ApiSaldo()));
  }
}
