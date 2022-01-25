import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/buttons/button_primary.dart';
import 'package:intakemobile/shared/widgets/others/loading_indicator.dart';
import 'package:intakemobile/shared/widgets/others/show_dialog.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_user_consent/sms_user_consent.dart';

class PageOtp extends StatefulWidget {
  final int otpCount;
  final bool loading;

  final Function() onResend;
  final Function() onVerification;
  final TextEditingController cotrollerOtp;
  const PageOtp({
    Key? key,
    required this.otpCount,
    required this.onResend,
    required this.onVerification,
    required this.cotrollerOtp,
    this.loading = false,
  }) : super(key: key);

  @override
  _PageOtpState createState() => _PageOtpState();
}

class _PageOtpState extends State<PageOtp> {
  // TextEditingController cotrollerOtp = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String otpCode = "";
  final formKey = GlobalKey<FormState>();
  Timer? timer;
  int resendOtpCount = 0;
  late SmsUserConsent smsUserConsent;
  bool enable = false;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (resendOtpCount < 1) {
            timer.cancel();
          } else {
            resendOtpCount = resendOtpCount - 1;
          }
        },
      ),
    );
  }

  void onRetrySendOtp() {
    setState(() {
      resendOtpCount = 60;
    });
    // snackBar("OTP resend!!");
    startTimer();
  }

  @override
  void initState() {
    if (widget.otpCount > 1) {
      resendOtpCount = widget.otpCount;
    } else {
      resendOtpCount = 60;
    }
    startTimer();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();

    if (Platform.isAndroid) {
      smsUserConsent = SmsUserConsent(
          phoneNumberListener: () {}, smsListener: () => _processOTP());
      smsUserConsent.requestSms(senderPhoneNumber: "ActionPay");
    }
  }

  @override
  void dispose() {
    errorController!.close();
    timer!.cancel();
    super.dispose();
  }

  _processOTP() {
    String otp = smsUserConsent.receivedSms!.replaceAllMapped(
        RegExp(r'^([^,.]*[.,])|\D+'),
        (Match m) =>
            m[1] != null ? m[1]!.replaceAll(RegExp(r'[^0-9.]+'), '') : '');
    setState(() {
      widget.cotrollerOtp.text = otp.substring(0, 6);
      // log(widget.cotrollerOtp.text);
      _onVerificationOtp();
    });
  }

  void _onVerificationOtp() async {
    if (widget.cotrollerOtp.text.length != 6) {
      Get.snackbar("OTP", 'otpCheck'.tr);
    } else {
      widget.onVerification();
    }
  }

  _resendOtp() async {
    try {
      widget.onResend();
      onRetrySendOtp();
    } catch (e) {
      showPopUpError(errorMessage: e.toString());
    }
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formKey,
          child: PinCodeTextField(
            autoDisposeControllers: false,
            autoFocus: true,
            mainAxisAlignment: MainAxisAlignment.start,
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            obscureText: true,
            obscuringCharacter: '●',
            blinkWhenObscuring: false,
            animationType: AnimationType.fade,
            validator: (v) {
              // if (v!.length < 3) {
              //   return "I'm from validator";
              // } else {
              //   return null;
              // }
            },
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: MediaQuery.of(context).size.height / 18,
                fieldWidth: MediaQuery.of(context).size.width / 10,
                activeFillColor: Colors.white,
                selectedColor: AppColor.whiteColor,
                selectedFillColor: AppColor.whiteColor,
                disabledColor: AppColor.whiteColor,
                inactiveFillColor: AppColor.whiteColor,
                inactiveColor: AppColor.whiteColor),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: widget.cotrollerOtp,
            keyboardType: TextInputType.number,
            // boxShadows: const [
            //   BoxShadow(
            //     offset: Offset(0, 1),
            //     color: Colors.black12,
            //     blurRadius: 10,
            //   )
            // ],
            onCompleted: (v) {
              log("Completed");
              widget.cotrollerOtp.text = v;
              log(widget.cotrollerOtp.text);
            },
            onTap: () {
              log("Pressed");
            },
            onChanged: (value) {
              log(value);
              otpCode = value;
            },
            beforeTextPaste: (text) {
              log("Allowing to paste $text");
              return true;
            },
          ),
        ),
        verticalSpace(30.w),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                if (resendOtpCount == 0) {
                  _resendOtp();
                }
              },
              child: Text(
                "resend".tr,
                style: resendOtpCount == 0
                    ? TextStyles.textBase.apply(color: AppColor.error)
                    : TextStyles.textBase
                        .apply(color: AppColor.error.withOpacity(0.5)),
              ),
            ),
            Text("$resendOtpCount",
                style: TextStyles.textBase
                    .apply(color: Theme.of(context).primaryColor)),
          ],
        ),
        verticalSpace(237.w),
        widget.loading
            ? loadingIndicator(context)
            : ButtonPrimary(
                onPressed: () => _onVerificationOtp(),
                label: 'continue'.tr,
                enable: widget.cotrollerOtp.text.length == 6,
              ),
        verticalSpace(MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
