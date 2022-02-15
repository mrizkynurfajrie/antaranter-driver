import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_rich_text.dart';
import 'package:intake_rider/shared/widgets/others/menu_profile.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'package:url_launcher/url_launcher.dart';

class PageDoneAccount extends StatefulWidget {
  final Widget nextPage;
  final String title;
  final String desc1;
  final String desc2;
  final String buttonTitle;

  const PageDoneAccount(
      {Key? key,
      required this.nextPage,
      required this.title,
      required this.desc1,
      required this.desc2,
      required this.buttonTitle})
      : super(key: key);

  @override
  _PageDoneAccountState createState() => _PageDoneAccountState();
}

class _PageDoneAccountState extends State<PageDoneAccount> {
  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: widget.title,
      child: SingleChildScrollView(
          child: Column(children: [
        verticalSpace(20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.desc1,
            style: TextStyles.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          AppIcons.success,
          width: Get.width / 2,
          height: Get.height / 4,
          // width: MediaQuery.of(context).size.width * 0.5,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Insets.med),
          child: Text(
            widget.desc2,
            textAlign: TextAlign.center,
            style: TextStyles.body2,
          ),
        ),
        verticalSpace(20),
        MenuProfile(
          menuTitle: "Call Center Halopos",
          menuDesc: "Hubungi 161",
          onTap: () async {
            String url = "tel://161";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          useIcon: true,
          icon: AppIcons.icCallCenter,
          arrow: true,
          arrowIconColor: AppColor.errorColor,
        ),
        MenuProfile(
          menuTitle: "Email",
          menuDesc: "Kirim pesan Anda ke alamat halopos@posindonesia.co.id",
          onTap: () async {
            final Uri params = Uri(
              scheme: 'mailto',
              path: 'halopos@posindonesia.co.id',
              query: '', //add subject and body here
            );
            var url = params.toString();
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          useIcon: true,
          icon: AppIcons.icEmail,
          arrow: true,
          arrowIconColor: AppColor.errorColor,
        ),
      ])),
      bottomBar: ButtonRichText(
        alignment: MainAxisAlignment.center,
        onPress: () {
          Get.to(() => widget.nextPage);
        },
        label: widget.buttonTitle,
        description: '',
      ),
    );
  }
}
