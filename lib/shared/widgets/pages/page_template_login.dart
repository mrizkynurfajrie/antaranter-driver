import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/assets.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class PageTemplateLogin extends StatefulWidget {
  const PageTemplateLogin({
    Key? key,
    required this.child,
    this.bottomBar,
    this.stepBar,
    this.title = "",
    this.topTitle = "",
    this.padding,
  }) : super(key: key);

  final Widget? bottomBar;
  final Widget child;
  final String title;
  final String topTitle;
  final Widget? stepBar;
  final EdgeInsets? padding;

  @override
  _PageTemplateLoginState createState() => _PageTemplateLoginState();
}

class _PageTemplateLoginState extends State<PageTemplateLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: widget.bottomBar != null
          ? Container(
              color: AppColor.whiteColor,
              width: Get.width,
              height: Sizes.xxl,
              child: widget.bottomBar)
          : verticalSpace(0),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: AppColor.whiteColor,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(
                      AppIllustrations.ilBgLoginLeft,
                      height: IconSizes.med * 10,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      AppIllustrations.ilBgLoginRight,
                      height: IconSizes.med * 10,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Insets.xl, vertical: Insets.xs * 2.5),
                child: SingleChildScrollView(child: widget.child),
              ),
            ],
          ),
        ),
      ),
    );
    // return PageDecorationTop(
    //   padding: widget.padding ?? EdgeInsets.all(Insets.lg),
    //   iconBack: Padding(
    //     padding: EdgeInsets.only(left: Insets.lg),
    //     child: Image.asset(
    //       AppLogos.app,
    //       height: IconSizes.med,
    //     ),
    //   ),
    //   enableBack: widget.topTitle.isEmpty ? true : false,
    //   toolbarAction: [
    //     Padding(
    //       padding: EdgeInsets.only(right: Insets.med),
    //       child: IconButton(
    //           iconSize: IconSizes.med,
    //           onPressed: _showHelp,
    //           icon: Icon(
    //             Icons.help,
    //             color: AppColor.bodyColor.shade300,
    //           )),
    //     )
    //   ],
    //   title: widget.topTitle,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Row(
    //         children: [
    //           InkWell(
    //             onTap: () {
    //               Get.back();
    //             },
    //             child: Padding(
    //               padding: EdgeInsets.fromLTRB(
    //                   widget.padding != null ? Insets.lg : 0,
    //                   Insets.med,
    //                   Insets.lg,
    //                   Insets.med),
    //               child: Icon(
    //                 Icons.arrow_back,
    //                 color: AppColor.bodyColor.shade500,
    //               ),
    //             ),
    //           ),
    //           widget.stepBar ?? Container()
    //         ],
    //       ),
    //       verticalSpace(Insets.xl),
    //       Text(
    //         widget.title,
    //         style: TextStyles.h5.copyWith(
    //           color: AppColor.bodyColor.shade800,
    //         ),
    //       ),
    //       verticalSpace(Insets.lg),
    //       Expanded(child: widget.child),
    //     ],
    //   ),
    //   bottomBar: widget.bottomBar,
    // );
  }

  // _showHelp() async {
  //   String? deviceId = await DeviceInfo.deviceInfo();
  //   showPopUp(
  //       title: 'DEVICE ID',
  //       labelButton: "COPY",
  //       description: deviceId ?? "",
  //       onPress: () {
  //         FlutterClipboard.copy(deviceId ?? "");
  //         showToast(message: "Device ID berhasil di-COPY");
  //         Get.back();
  //       });
  // }
}
