import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_rich_text.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageDone extends StatefulWidget {
  final Widget nextPage;
  final String title;
  final String desc1;
  final String desc2;
  final String buttonTitle;

  const PageDone(
      {Key? key,
      required this.nextPage,
      required this.title,
      required this.desc1,
      required this.desc2,
      required this.buttonTitle})
      : super(key: key);

  @override
  _PageDoneState createState() => _PageDoneState();
}

class _PageDoneState extends State<PageDone> {
  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: widget.title,
      child: SingleChildScrollView(
          child: Column(children: [
        verticalSpace(20),
        Image.asset(
          AppIcons.success,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.all(Insets.med),
          child: Text(
            widget.desc1,
            style: TextStyles.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 20,
          ),
        ),
        Text(
          widget.desc2,
          textAlign: TextAlign.center,
          style: TextStyles.body1,
        ),
      ])),
      bottomBar: ButtonRichText(
        alignment: MainAxisAlignment.center,
        label: "SELESAI",
        onPress: () {
          Get.to(() => widget.nextPage);
        },
        description: '',
        // color: Theme.of(context).primaryColor,
      ),
    );
  }
}
