import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:package_info/package_info.dart';

class AppVersion extends StatefulWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  _AppVersionState createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  String appVersion = '';

  _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = 'V ' + packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Text(appVersion,
        style: TextStyles.body2.copyWith(color: AppColor.bodyColor.shade600));
  }
}
