import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageRegsuccess extends StatelessWidget {
  const PageRegsuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Selamat!",
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s24,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Akun anda telah terdaftar",
                style: TextStyles.textStd,
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                AppIcons.socmarket,
              ),
              verticalSpace(20.h),
              LoadingAnimationWidget.staggeredDotsWave(
                color: AppColor.primaryColor,
                size: 50,
              ),
              Text(
                "Mohon tunggu sebentar..",
                style: TextStyles.textStd,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
