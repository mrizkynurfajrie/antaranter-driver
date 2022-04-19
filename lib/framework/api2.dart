import 'package:get_storage/get_storage.dart';

const String CACHE_USERNAME = "username";
const String CACHE_TOKEN = "token";
const String CHECK_LOGIN = "loginState";
const String CACHE_RIDER = "rider";
const String STATUS_ACTIVE_POST = "status_active_post";
const String CACHE_ACTIVE_POST = "active_post";
const String CACHE_VEHICLE = "vehicle";
const String CACHE_POSTING = "posting";
const String CACHE_USER = "user";
const String CACHE_API_LOGGER = "api_logger";
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

  Future setUser({dynamic user}) async {
    user ??= "";
    await box.write(CACHE_USER, user);
  }

  Future<dynamic> getUser() async {
    return box.read(CACHE_USER);
  }

  Future<dynamic> setVehicle({dynamic vehicle}) async {
    vehicle ??= "";
    await box.write(CACHE_VEHICLE, vehicle);
  }

  Future<dynamic> getVehicle() async {
    return box.read(CACHE_VEHICLE);
  }

  Future<dynamic> setPosting({dynamic posting}) async {
    posting ??= "";
    await box.write(CACHE_POSTING, posting);
  }

  Future<dynamic> getPosting() async {
    return box.read(CACHE_POSTING);
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

  Future removeData() async {
    await box.remove(CHECK_LOGIN);
    await box.remove(CACHE_USERNAME);
    await box.remove(CACHE_TOKEN);
    await box.remove(CACHE_RIDER);
    await box.remove(CACHE_VEHICLE);
    await box.remove(CACHE_POSTING);
    await box.remove(CACHE_ACTIVE_POST);
    await box.remove(CACHE_USER);
    await box.remove(STATUS_ACTIVE_POST);
  }

  Future removePosting() async {
    await box.remove(CACHE_POSTING);
  }

  Future setHasActivePost({bool? isHasActivePost}) async {
    isHasActivePost ??= false;
    await box.write(STATUS_ACTIVE_POST, isHasActivePost);
  }

  Future<bool?> getHasActivePost() async {
    return box.read(STATUS_ACTIVE_POST);
  }

  Future setActivePost({dynamic activePost}) async {
    activePost ??= "";
    await box.write(CACHE_ACTIVE_POST, activePost);
  }

  Future<dynamic> getActivePost() async {
    return box.read(CACHE_ACTIVE_POST);
  }
    Future removeActivePost() async {
    await box.remove(CACHE_ACTIVE_POST);
  }

  Future setApiLogger({dynamic value}) async{
    value ??= "";
    await box.write(CACHE_API_LOGGER, value);
  }
  
  Future<dynamic> getApiLogger()async{
    return box.read(CACHE_API_LOGGER);
  }
}
