import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const wallet = 'assets/icons/wallet.svg';
  static const history = 'assets/icons/history.svg';
  static const carLocation = 'assets/icons/car_location.svg';
  static const custService = 'assets/icons/customer_service.svg';
  static const icTopUp = 'assets/icons/top-up.png';
  static const icWithdrawl = 'assets/icons/withdrawl.png';
  static const roadRoutes = 'assets/icons/road-routes.png';
  static const locDepart = 'assets/icons/loc_depart.png';
  static const locArrive = 'assets/icons/loc_arrive.png';
  static const profUser = 'assets/icons/user.svg';
  static const profCallus = 'assets/icons/chat-alt-2.svg';
  static const profTnc = 'assets/icons/document-text.svg';
  static const profPrivacy = 'assets/icons/document.svg';
  static const profRating = 'assets/icons/thumb-up.svg';
  static const profLogout = 'assets/icons/logout.svg';
  static const profCar = 'assets/icons/vehicle.svg';
  static const contWhatsapp = 'assets/icons/whatsapp.png';
  static const contFacebook = 'assets/icons/facebook.svg';
  static const contInstagram = 'assets/icons/instagram.svg';
  static const contEmail = 'assets/icons/mail.svg';
  static const contWebsite = 'assets/icons/web.svg';
  static const rupiah = 'assets/icons/rupiah.png';
  static const mandiri = 'assets/icons/mandiri.png';
  static const profile = 'assets/icons/profile.svg';
  static const activity = 'assets/icons/activity.svg';
  static const home = 'assets/icons/home.svg';

  static Widget iconApp(String asset) {
    return SvgPicture.asset(
      asset,
      height: IconSizes.sm,
      fit: BoxFit.contain,
      color: AppColor.primaryColor,
    );
  }
}

class AppLogos {
  static const logoOnly = 'assets/logo/logo_only.png';
  static const nameOnly = 'assets/logo/name_only.png';
  static const logoHorizontal = 'assets/logo/logo_horizontal.png';
  static const logoVertical = 'assets/logo/logo_vertical.png';
  static const colouredLogo = 'assets/logo/color-logo.png';
  static const uncolouredLogo = 'assets/logo/white-logo.png';

  static Widget logoApp(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.xl,
    );
  }
}

class AppLogosMed {
  static const logoOnly = 'assets/logo/logo_only.png';
  static const nameOnly = 'assets/logo/name_only.png';
  static const logoHorizontal = 'assets/logo/logo_horizontal.png';
  static const logoVertical = 'assets/logo/logo_vertical.png';
  static const colouredLogo = 'assets/logo/color-logo.png';
  static const uncolouredLogo = 'assets/logo/white-logo.png';

  static Widget logoApp(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.medx,
    );
  }
}

class AppLotties {
  static const loadingProcess = 'assets/lottie/loading-orange.json';
  static const loadingCar = 'assets/lottie/loading-car.json';
  static const empty = 'assets/lottie/empty.json';
}
