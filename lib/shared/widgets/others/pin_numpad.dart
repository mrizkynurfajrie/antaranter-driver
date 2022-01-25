import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intakemobile/shared/constants/assets.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/others/numpad_button.dart';
import 'package:intakemobile/shared/widgets/others/show_dialog.dart';
import 'package:local_auth/local_auth.dart';

class PinNumpad extends StatefulWidget {
  const PinNumpad({
    Key? key,
    required this.pin,
    this.isLogin = false,

    /// when [Biometrics] is authenticated
    this.onAuthenticated,
  }) : super(key: key);

  final ValueSetter<String> pin;
  final void Function()? onAuthenticated;
  final bool isLogin;

  @override
  State<PinNumpad> createState() => _PinNumpadState();
}

class _PinNumpadState extends State<PinNumpad> {
  String tempPin = '';

  List<BiometricType> availableBiometrics = <BiometricType>[];
  bool isFaceID = false;
  final localAuth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    if (widget.isLogin) {
      () async {
        final biometrics = await localAuth.getAvailableBiometrics();
        setState(() {
          availableBiometrics = biometrics;
          if (Platform.isIOS &&
              availableBiometrics.contains(BiometricType.face)) {
            isFaceID = true;
          }
        });
        if (biometrics.isNotEmpty) {
          _requestAuthentication();
        }
      }();
    }
  }

  setValue(String value) {
    if (tempPin.length < 6) {
      setState(() {
        tempPin += value;
        widget.pin(tempPin);
      });
    }
  }

  _backspace(String text) {
    if (text.isNotEmpty) {
      setState(() {
        tempPin = text.split('').sublist(0, text.length - 1).join('');
        widget.pin(tempPin);
      });
    }
  }

  _requestAuthentication() async {
    try {
      bool available = await localAuth.canCheckBiometrics;
      {
        if (available) {
          String biometricType = "Fingerprint";
          if (Platform.isIOS) {
            if (availableBiometrics.contains(BiometricType.face)) {
              biometricType = "Face ID";
            } else {
              biometricType = "Touch ID";
            }
          }
          bool didAuthenticate = await LocalAuthentication().authenticate(
            localizedReason:
                'Gunakan $biometricType untuk melakukan autentikasi',
            biometricOnly: true,
          );
          if (didAuthenticate) {
            widget.onAuthenticated!();
          }
        }
      }
    } on PlatformException catch (e) {
      print("err ${e.toString()}");
      showPopUpError(errorMessage: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '1',
                    onPressed: () => setValue('1'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '2',
                    onPressed: () => setValue('2'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '3',
                    onPressed: () => setValue('3'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '4',
                    onPressed: () => setValue('4'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '5',
                    onPressed: () => setValue('5'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '6',
                    onPressed: () => setValue('6'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '7',
                    onPressed: () => setValue('7'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '8',
                    onPressed: () => setValue('8'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '9',
                    onPressed: () => setValue('9'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: _requestAuthentication,
                style: ElevatedButton.styleFrom(
                  primary: AppColor.whiteColor,
                  elevation: 0,
                  shape: const CircleBorder(),
                  onPrimary: Theme.of(context).primaryColor.withOpacity(.4),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.icFingerSvg,
                    width: 50.w,
                    height: 50.w,
                  ),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: NumpadButton(
                    text: '0',
                    onPressed: () => setValue('0'),
                  ),
                ),
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () => _backspace(tempPin),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.whiteColor,
                  elevation: 0,
                  shape: const CircleBorder(),
                  onPrimary: Theme.of(context).primaryColor.withOpacity(.4),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.icBackPin,
                    width: 49.w,
                    height: 33.w,
                  ),
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
