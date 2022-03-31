import 'package:get/get.dart';
import 'package:intake_rider/features/nebeng_posting_detail/api_nebeng_posting_detail.dart';
import 'package:intake_rider/features/nebeng_posting_detail/controller_nebeng_posting_detail.dart';

class BindingNebengPostingDetail implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerNebengPostingDetail>(
        () => ControllerNebengPostingDetail(api: ApiNebengPostingDetail()));
  }
}
