import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class AppIcons {
  static const wallet = 'assets/icons/wallet.svg';
  static const history = 'assets/icons/history.svg';
  static const carLocation = 'assets/icons/car_location.png';
  static const custService = 'assets/icons/customer_service.png';
  static const icTopUp = 'assets/icons/top-up.png';
  static const icWithdrawl = 'assets/icons/withdrawl.png';
  static const roadRoutes = 'assets/icons/road-routes.png';
  static const locDepart = 'assets/icons/loc_depart.png';
  static const locArrive = 'assets/icons/loc_arrive.png';
  static const profUser = 'assets/icons/person.png';
  static const profCallus = 'assets/icons/callus.png';
  static const profTnc = 'assets/icons/tnc.png';
  static const profPrivacy = 'assets/icons/privacy.png';
  static const profRating = 'assets/icons/rating.png';
  static const profLogout = 'assets/icons/logout.png';
  static const profCar = 'assets/icons/car.png';
  static const contWhatsapp = 'assets/icons/whatsapp.png';
  static const contFacebook = 'assets/icons/facebook.png';
  static const contInstagram = 'assets/icons/instagram.png';
  static const contEmail = 'assets/icons/email.png';
  static const contWebsite = 'assets/icons/website.png';
  static const rupiah = 'assets/icons/rupiah.png';
  static const mandiri = 'assets/icons/mandiri.png';
  static const profile = 'assets/icons/profile.svg';
  static const activity = 'assets/icons/activity.svg';
  static const home = 'assets/icons/home.svg';

  static Widget iconApp(String asset){
    return Image.asset(asset, height: IconSizes.sm);
  }
}

class AppLogos {
  static const logoColoured = 'assets/logo/logo-besar.png';
  static const logoUncoloured = 'assets/logo/logo-besar-white.png';

  static Widget logoApp(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.xl,
    );
  }
}

class AppLotties {
  static const loadingProcess = 'assets/lottie/loading-orange.json';
  static const loadingCar = 'assets/lottie/loading-car.json';
  static const empty = 'assets/lottie/empty.json';
}
