import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_service.dart';

void openImagePicker({
  ImageSource? imageSource,
  Function? onFilePicked,
  bool isPopScreen = true,
  int imageQuality = 80,
}) async {
  if (imageSource != null) {
    if (imageSource == ImageSource.camera) {
      await PermissionsService.requestPermission(Permission.camera,
          onPermissionDenied: () {});
    }
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: imageSource,
      imageQuality: imageQuality,
      maxHeight: 600,
    );

    if (file != null) {
      onFilePicked!(file.path);
      if (isPopScreen) {
        Get.back();
      }
    }
  }
}
