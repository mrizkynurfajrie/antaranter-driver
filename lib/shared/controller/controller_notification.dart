import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class ControllerNotification extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initNotificationHandler();
  }

  void initNotificationHandler() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      log("instance");
      
    });

    // only work in foreground
    FirebaseMessaging.onMessage.listen((message) {
      log("onMessage");
    });

    // when the app is in backgroudn but opened
    // User tap notification in tray
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("onMessageOpenedApp");
    });
  }
}
