import 'dart:developer';

import 'package:antaranter_driverapp/features/posting/customer_order/api_customer_order.dart';
import 'package:antaranter_driverapp/response/nebeng_customer_response.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/controller/controller_postingan.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_users.dart';
import 'package:get/get.dart';

class ControllerCustomerOrder extends GetxController {
  final ApiCustomerOrder api;
  ControllerCustomerOrder({required this.api});

  var controllerUserInfo = Get.find<ControllerUsers>();
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerPosting = Get.find<ControllerPostingan>();
  var postinganCustomerNebeng = NebengCustomerResponse().obs;

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    postinganCustomerNebeng.value =
        NebengCustomerResponse.fromArguments(Get.arguments);

        log(Get.arguments.toString());
  }

  void createPost() async {
    loading.value = true;
    try {
      var responseCreate = await api.createCustomerOrder(
        nebengPostId: controllerPosting.postingan.value.nebengPosting!.id! ,
        customerNebengPostId: postinganCustomerNebeng.value.id!,
        
      );

      if (responseCreate['success'] == true) {
        NebengCustomerResponse customerNebengPost =
            NebengCustomerResponse.fromJson(responseCreate['data']);
        Get.offAndToNamed(Routes.main, arguments: 1);
        log("data customer nebeng : " + customerNebengPost.toString());
      } else {
        String? error = responseCreate['errors'][0]['message']['message'];
        throw error ?? "Gagal mengambil penawaran";
      }
      loading.value = false;
    } catch (e) {
      log("error : " + e.toString());
      // showPopUpError(
      //     errorTitle: 'Terjadi Kesalahan', errorMessage: e.toString());
    }
  }
}
