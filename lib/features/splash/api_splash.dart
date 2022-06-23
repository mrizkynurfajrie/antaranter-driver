

import 'package:antaranter_driverapp/framework/api1.dart';

class ApiSplash {
  Future<dynamic> latestVersion({required String type}) async {
    final regisBody = {"type": type};

    var resAppVersion =
        await Api1().apiJSONPost('appversion/findlastbytype', regisBody);
    // log('cek data : ' + resAppVersion);

    return resAppVersion;
  }
}
