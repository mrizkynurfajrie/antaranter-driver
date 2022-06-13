import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/posting/nebeng_posting/api_nebeng_posting.dart';
import 'package:antaranter_driverapp/features/posting/nebeng_posting/controller_nebeng_posting.dart';

class BindingNebengPosting implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerNebengPosting>(
        () => ControllerNebengPosting(api: ApiNebengPosting()));
  }
}
