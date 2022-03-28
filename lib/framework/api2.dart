import 'package:get_storage/get_storage.dart';

const String CACHE_USERNAME = "username";
const String CACHE_TOKEN = "token";
const String CHECK_LOGIN = "loginState";
const String CACHE_RIDER = "rider";
const String STATUS_ACTIVE_ORDER = "status_active_order";
const String CACHE_ACTIVE_ORDER = "active_order";

class Api2 {
  final box = GetStorage();

  Future setUsername({String? username}) async {
    username ??= "";
    await box.write(CACHE_USERNAME, username);
  }

  Future<String?> getUsername() async {
    return box.read(CACHE_USERNAME);
  }

  Future setRider({dynamic rider}) async {
    rider ??= "";
    await box.write(CACHE_RIDER, rider);
  }

  Future<dynamic> getRider() async {
    return box.read(CACHE_RIDER);
  }

  Future setToken({String? token}) async {
    token ??= "";
    await box.write(CACHE_TOKEN, token);
  }

  Future<String?> getToken() async {
    return box.read(CACHE_TOKEN);
  }

  Future setIsLogin({bool? isLogin}) async {
    isLogin ??= false;
    await box.write(CHECK_LOGIN, isLogin);
  }

  Future<bool?> getLoginStatus() async {
    return box.read(CHECK_LOGIN);
  }

  Future setHasActiveOrder({bool? isHasActiveOrder}) async {
    isHasActiveOrder ??= false;
    await box.write(STATUS_ACTIVE_ORDER, isHasActiveOrder);
  }

  Future<bool?> getHasActiveOrder() async {
    return box.read(STATUS_ACTIVE_ORDER);
  }

  Future setActiveOrder({dynamic activeOrder}) async {
    activeOrder ??= "";
    await box.write(CACHE_ACTIVE_ORDER, activeOrder);
  }

  Future<dynamic> getActiveOrder() async {
    return box.read(CACHE_ACTIVE_ORDER);
  }
}
