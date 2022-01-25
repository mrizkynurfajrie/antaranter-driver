import 'dart:io';

import 'package:image_cropper/image_cropper.dart';

Future<File?> imageCropper(String imagePath) async {
  File? croppedFile = await ImageCropper.cropImage(
      maxHeight: 800,
      maxWidth: 800,
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Cropper',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 1.0,
      ));

  return croppedFile;
}
