import 'package:get/get.dart';
import 'package:intake_rider/features/activity_history/api_actHistory.dart';
import 'package:intake_rider/features/activity_history/controller_actHistory.dart';

class BindingActivityHistory implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerActivityHistory>(
        () => ControllerActivityHistory(api: ApiActivityHistory()));
  }
}
