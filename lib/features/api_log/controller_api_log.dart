
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/api_log/api_logger.dart';

class ControllerApiLog extends GetxController {
  var apiLogs = <ModelApiLog>[].obs;
  RxList<bool> isOpen = RxList.generate(100, (index) => false);

  @override
  onInit() {
    super.onInit();
    getLogs();
  }

  getLogs() async {
    List<ModelApiLog> data = await ApiLogger().apiLogs();
    apiLogs(data.reversed.toList());
  }
}
