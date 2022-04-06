import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/contact/api_contact.dart';
import 'package:antaranter_driverapp/features/contact/controller_contact.dart';

class BindingContact implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerContact>(() => ControllerContact(api: ApiContact()));
  }
}
