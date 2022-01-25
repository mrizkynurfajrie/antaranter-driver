import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<bool> _requestPermission(Permission permission) async {
    var _permission = await permission.request();
    if (_permission.isDenied) {
      return false;
    } else if (_permission.isPermanentlyDenied) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> requestPermission(
    Permission permission, {
    Function? onPermissionDenied,
  }) async {
    var grant = await _requestPermission(permission);
    if (!grant) {
      onPermissionDenied!();
    }
    return grant;
  }
}
