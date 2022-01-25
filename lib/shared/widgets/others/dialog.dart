import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/buttons/button_primary.dart';
import 'package:intakemobile/shared/widgets/buttons/button_primary_outline.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, positiveText, negativeText;
  final String? img;
  final Function? positiveButton;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      this.img,
      required this.positiveText,
      required this.negativeText,
      this.positiveButton})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 10),
                    blurRadius: 5),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.img == null
                  ? Text(widget.title, style: TextStyles.subtitle1)
                  : Padding(
                      padding: EdgeInsets.only(right: Insets.xl),
                      child: Image.asset(widget.img!),
                    ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyles.body1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Expanded(
                      child: ButtonPrimaryOutline(
                    label: widget.negativeText,
                    onPressed: () {
                      Get.back();
                    },
                    labelStyle: TextStyles.button.copyWith(
                        height: 1.26, color: Theme.of(context).primaryColor),
                    color: AppColor.whiteColor,
                  )),
                  const SizedBox(width: 14),
                  Expanded(
                      child: ButtonPrimary(
                    label: widget.positiveText,
                    onPressed: () {
                      widget.positiveButton!();
                    },
                    labelStyle: TextStyles.button.copyWith(height: 1.26),
                    color: Theme.of(context).primaryColor,
                  ))
                ],
              )
            ],
          ),
        ),
        // Positioned(
        //   left: 20,
        //   right: 20,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: 20,
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.all(Radius.circular(50)),
        //         child: Image.asset(IconProfile.icAbout)),
        //   ),
        // ),
      ],
    );
  }
}
