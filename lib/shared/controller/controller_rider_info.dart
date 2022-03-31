import 'package:get/get.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/rider.dart';

class ControllerRiderInfo extends GetxController {
  var hasActivePost = false.obs;
  var rider = Rider().obs;

  @override
  void onInit() async {
    super.onInit();
    checkRiderHasActivePost();
    await setRiderData();
  }

  void setRiderHasActivePost(bool status) async {
    await Api2().setHasActivePost(isHasActivePost: status);
    hasActivePost.value = status;
  }

  void checkRiderHasActivePost() async {
    var isHasActivePost = await Api2().getHasActivePost();
    if (isHasActivePost != null) {
      setRiderHasActivePost(isHasActivePost);
    }
  }

  void setActivePost(int idPost, String type) async {
    await Api2().setActivePost(activePost: {'id' : idPost, 'type': type});
  }

  setRiderData() async {
    var data = await Api2().getRider();
    if (data != null) {
      rider.value = Rider.fromJson(data);
    }
  }
}
