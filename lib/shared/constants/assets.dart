import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class AppIcons {
  static const wallet = 'assets/icons/account_balance.png';
  static const history = 'assets/icons/history.png';
}

class AppLogos {
  static const logoColoured = 'assets/logo/logo-besar.png';
  static const logoUncoloured = 'assets/logo/logo-besar-white.png';

  static Widget logoApp(String asset){
    return Image.asset(
      asset,
      height: IconSizes.xl,
    );
  }
}
