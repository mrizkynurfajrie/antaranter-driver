import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intakemobile/shared/constants/styles.dart';

Widget loadingIndicator(BuildContext context, {Color? color}) {
  return SpinKitFadingCircle(
    size: 35,
    duration: const Duration(seconds: 3),
    color: color ?? Theme.of(context).primaryColor,
  );
}

Widget loadingIndicatorBottom(BuildContext context) {
  return SizedBox(
    height: Sizes.lg,
    child: Center(
      child: SpinKitThreeBounce(
        size: IconSizes.sm,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
