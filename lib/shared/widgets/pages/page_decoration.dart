import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/others/app_version.dart';

class PageDecoration extends StatelessWidget {
  final bool isDisplayAppVersion;
  final bool isDisplayLogoPosBumn;
  final PreferredSizeWidget? appBar;
  final Widget? buttonBottom;
  final Widget child;
  const PageDecoration({
    required this.isDisplayAppVersion,
    required this.isDisplayLogoPosBumn,
    this.appBar,
    this.buttonBottom,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar,
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(child: child),
                  buttonBottom ?? Container(),
                  isDisplayLogoPosBumn
                      ? verticalSpace(Insets.lg)
                      : verticalSpace(0),
                  isDisplayLogoPosBumn
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppLogos.pos,
                              width: IconSizes.xxl,
                              height: IconSizes.xxl,
                            ),
                            horizontalSpace(Insets.lg),
                            Image.asset(
                              AppLogos.bumn,
                              width: IconSizes.xl,
                              height: IconSizes.xl,
                            ),
                          ],
                        )
                      : verticalSpace(0),
                  isDisplayAppVersion
                      ? verticalSpace(Insets.lg)
                      : verticalSpace(0),
                  isDisplayAppVersion ? const AppVersion() : Container(),
                  (isDisplayAppVersion == true || isDisplayLogoPosBumn == true)
                      ? verticalSpace(Insets.lg)
                      : verticalSpace(0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
