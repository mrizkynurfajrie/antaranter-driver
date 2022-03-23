import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_rider/features/user_account/api_user_account.dart';

class ControllerUserAccount extends GetxController {
  final ApiUserAccount api;
  ControllerUserAccount({required this.api});

  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtDate = TextEditingController();
  var txtAddress = TextEditingController();
  var txtPhone = TextEditingController();
  var ktp = ''.obs;

  final ImagePicker picker = ImagePicker();


 getKtpFromCamera()async{
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    ktp.value = camImage!.path;
  }
getKtpFromFile()async{
    final XFile? fileImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    ktp.value = fileImage!.path;
  }

  ktpSourceSelector(context) {
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
                          getKtpFromCamera();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Image Gallery'),
                      onTap: () {
                        getKtpFromFile();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ));
        });
  }
}
