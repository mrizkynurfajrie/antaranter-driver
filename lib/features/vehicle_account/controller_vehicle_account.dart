import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_rider/features/vehicle_account/api_vehicle_account.dart';

class ControllerVehicleAccount extends GetxController {
  final ApiVehicleAccount api;
  ControllerVehicleAccount({required this.api});

  var txtDate = TextEditingController();
  var sim = ''.obs;
  var stnk = ''.obs;

  final ImagePicker picker = ImagePicker();

// sim //
  getSimFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    sim.value = camImage!.path;
  }

  getSimFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    sim.value = fileImage!.path;
  }

  simSourceSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getSimFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getSimFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

// stnk //
  getStnkFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    stnk.value = camImage!.path;
  }

  getStnkFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    stnk.value = fileImage!.path;
  }

  stnkSourceSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getStnkFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getStnkFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }
}
