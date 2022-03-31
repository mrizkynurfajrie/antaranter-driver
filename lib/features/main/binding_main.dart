import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/features/home/controller_home.dart';
import 'package:intake_rider/features/main/controller_main.dart';
import 'package:intake_rider/features/nebeng_posting_detail/api_nebeng_posting_detail.dart';
import 'package:intake_rider/features/nebeng_posting_detail/controller_nebeng_posting_detail.dart';
import 'package:intake_rider/features/profile/api_profile.dart';
import 'package:intake_rider/features/profile/controller_profile.dart';

class BindingMain implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerMain>(() => ControllerMain());
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
    Get.lazyPut<ControllerNebengPostingDetail>(
        () => ControllerNebengPostingDetail(api: ApiNebengPostingDetail()));
    Get.lazyPut<ControllerProfile>(() => ControllerProfile(api: ApiProfile()));
  }
}
