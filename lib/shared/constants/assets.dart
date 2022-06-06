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
  static const contWhatsapp = 'assets/icons/whatsapp.svg';
  static const contFacebook = 'assets/icons/facebook.svg';
  static const contInstagram = 'assets/icons/instagram.svg';
  static const contEmail = 'assets/icons/mail.svg';
  static const contWebsite = 'assets/icons/web.svg';
  static const mandiri = 'assets/icons/mandiri.png';
  static const profile = 'assets/icons/profile.svg';
  static const activity = 'assets/icons/activity.svg';
  static const home = 'assets/icons/home.svg';
  static const genderMale = 'assets/icons/gender-male.svg';
  static const genderFemale = 'assets/icons/gender-female.svg';
  static const dummyAvatar = 'assets/icons/avatar_dummy.svg';
  static const seatSvg = 'assets/icons/seat.svg';
  static const riderPerson = 'assets/icons/rider-person.svg';
  static const map = 'assets/icons/map.svg';
  static const note = 'assets/icons/note.svg';
  static const confirmData = 'assets/images/confirm_data.png';

  static Widget iconApp(String asset) {
    return SvgPicture.asset(
      asset,
      height: IconSizes.sm,
      fit: BoxFit.contain,
      color: AppColor.primaryColor,
    );
  }
}

class PopUpIcons {
  static const error = 'assets/icons/error_popup.svg';
  static const success = 'assets/icons/success_popup.svg';
  static const information = 'assets/icons/information-circle.svg';

  static Widget iconApp(String asset) {
    return SvgPicture.asset(
      asset,
      fit: BoxFit.contain,
    );
  }
}

class AppLogos {
  static const logoOnly = 'assets/logo/logo-only.png';
  // static const nameOnly = 'assets/logo/antaranter-text-only.png';
  static const logoHorizontal = 'assets/logo/logo-horizontal.png';
  static const logoVertical = 'assets/logo/logo-vertical.png';

  static Widget logoApp(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.xl,
    );
  }
}

class AppLogosMed {
  static const logoOnly = 'assets/logo/logo-only.png';
  // static const nameOnly = 'assets/logo/antaranter-text-only.png';
  static const logoHorizontal = 'assets/logo/logo-horizontal.png';
  static const logoVertical = 'assets/logo/logo-vertical.png';

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
  static const emptyList = 'assets/lottie/empty-list.json';
  static const errorIcon = 'assets/lottie/error.json';
}
