import 'package:flutter/material.dart';

class AppColor {
  //BRANDCOLOR

  static const MaterialColor primaryColor = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF0E5),
      100: Color(0xFFFFE1CC),
      200: Color(0xFFFFC399),
      300: Color(0xFFFFA566),
      400: Color(0xFFFF8733),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFC75200),
      700: Color(0xFF8F3B00),
      800: Color(0xFF572400),
    },
  );
  static const int _orangePrimaryValue = 0xFFFF6600;

  static const MaterialColor secondColor = MaterialColor(
    _secondColorValue,
    <int, Color>{
      50: Color(0xFFFEF2F2),
      100: Color(0xFFFAD6D8),
      200: Color(0xFFF49FA3),
      300: Color(0xFFEE686D),
      400: Color(0xFFE83138),
      500: Color(_secondColorValue),
      600: Color(0xFF8A0F14),
      700: Color(0xFF4F090C),
      800: Color(0xFF130203),
    },
  );
  static const int _secondColorValue = 0xFF1d2636;

  //NEUTRAL
  static const MaterialColor bodyColor = MaterialColor(
    _bodyColorValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFAFAFA),
      200: Color(0xFFE1E1E1),
      300: Color(0xFFC7C7C7),
      400: Color(0xFFAEAEAE),
      500: Color(_bodyColorValue),
      600: Color(0xFF787878),
      700: Color(0xFF5c5c5c),
      800: Color(0xFF404040),
      900: Color(0xFF242424),
    },
  );
  static const int _bodyColorValue = 0xFFFFFFFF;

  //ACCENT
  static const Color errorColor = Color(0xFFD95952); //Danger - Use for errors
  static const Color successColor = Color(0xFF31B76A); //Succes - Use for Succes
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color bgPageColor = Color(0xFFE5E5E5);

  static const Color weakColor =
      Color(0xFFBDBDBD); //Weak - Use for secondary text
  static const Color weak2Color =
      Color(0xFFF6F4F4); //Weak - Use for secondary text

  //GRADIENT
  static const LinearGradient gradient1 = LinearGradient(colors: [
    Color(0XFFFF8D00),
    Color(0XFFFF6900),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const MaterialColor primary = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFD9D9D9),
      100: Color(0xFFEFF1FF),
      200: Color(0xFFBEC4E0),
      300: Color(0xFFA8B0D5),
      400: Color(0xFF939DCB),
      500: Color(_primary),
      600: Color(0xFF6775B6),
      700: Color(0xFF5157AF),
      800: Color(0xFF3C4EA1),
      900: Color(0xFF263A96),
    },
  );
  static const int _primary = 0xFF263A96;

  static const MaterialColor neutral = MaterialColor(
    _neutral,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF8F8F8),
      200: Color(0xFFBEC4E0),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF999999),
      500: Color(0xFF666666),
      600: Color(0xFF4D4D4D),
      700: Color(0xFF333333),
      800: Color(0xFF1A1A1A),
      900: Color(_neutral),
    },
  );
  static const int _neutral = 0xFF000000;

  static const MaterialColor secondaryColor = MaterialColor(
    _secondaryColorValue,
    <int, Color>{
      100: Color(0xFFFFEAE6),
      200: Color(0xFFFFC0B3),
      300: Color(0xFFFFAB99),
      400: Color(0xFFFF9780),
      500: Color(0xFFFF8266),
      600: Color(0xFFFF6D4D),
      700: Color(0xFFFF5833),
      800: Color(0xFFFF431A),
      900: Color(_secondaryColorValue),
    },
  );
  static const int _secondaryColorValue = 0xFFFF2E00;

  static const MaterialColor secondary = MaterialColor(
    _secondary,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF8F8F8),
      200: Color(0xFFBEC4E0),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF999999),
      500: Color(0xFF808080),
      600: Color(0xFF4D4D4D),
      700: Color(0xFF333333),
      800: Color(0xFF1A1A1A),
      900: Color(0xFF000000),
    },
  );
  static const int _secondary = 0xFF000000;

  static const MaterialColor success = MaterialColor(
    _success,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF8F8F8),
      200: Color(0xFFBEC4E0),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF999999),
      500: Color(0xFF808080),
      600: Color(0xFF4D4D4D),
      700: Color(0xFF333333),
      800: Color(0xFF1A1A1A),
      900: Color(0xFF000000),
    },
  );
  static const int _success = 0xFF000000;

  static const MaterialColor error = MaterialColor(
    _error,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF8F8F8),
      200: Color(0xFFBEC4E0),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF999999),
      500: Color(0xFF808080),
      600: Color(0xFF4D4D4D),
      700: Color(0xFF333333),
      800: Color(0xFF1A1A1A),
      900: Color(0xFF000000),
    },
  );
  static const int _error = 0xFF000000;

  static const MaterialColor basic = MaterialColor(
    _basic,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF8F8F8),
      200: Color(0xFFBEC4E0),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF999999),
      500: Color(0xFF808080),
      600: Color(0xFF4D4D4D),
      700: Color(0xFF333333),
      800: Color(0xFF1A1A1A),
      900: Color(0xFF000000),
    },
  );
  static const int _basic = 0xFF000000;

  static const Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static const Color navyColor = Color(0xFF000080);
  static const Color orangeColor = Color(0xFFF16222);
  static const Color greyColor = Color(0xFF5a5a5a);
  static const Color greyColorLight = Color(0xFF969696);
  static const Color transparentColor = Colors.transparent;
}
