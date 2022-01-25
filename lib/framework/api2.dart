import 'package:get_storage/get_storage.dart';

// ignore: constant_identifier_names
const String CACHE_USERNAME = "username";

class Api2 {
  final box = GetStorage();

  Future setUsername({String? username}) async {
    username ??= "";
    await box.write(CACHE_USERNAME, username);
  }

  Future<String?> getUsername() async {
    return box.read(CACHE_USERNAME);
  }
}
