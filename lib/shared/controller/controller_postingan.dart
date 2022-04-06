import 'package:get/get.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/nebeng_posting_response.dart';

class ControllerPostingan extends GetxController {
  var postingan = NebengPostingResponse().obs;

    setPostinganData() async {
    var data = await Api2().getPosting();
    if (data != null) {
      postingan.value = NebengPostingResponse.fromJson(data);
    }
  }
}