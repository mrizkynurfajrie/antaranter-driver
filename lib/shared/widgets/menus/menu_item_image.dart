import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemImage extends StatefulWidget {
  final double sizeBox;
  final String primaryIcon;
  final String secondaryIcon;
  final String primaryColor;
  final String secondaryColor;
  final bool isMaintenance;
  const MenuItemImage(
      {Key? key,
      required this.primaryIcon,
      required this.secondaryIcon,
      required this.primaryColor,
      required this.secondaryColor,
      required this.isMaintenance,
      this.sizeBox = 100})
      : super(key: key);

  @override
  State<MenuItemImage> createState() => _MenuItemImageState();
}

class _MenuItemImageState extends State<MenuItemImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          widget.primaryIcon,
          color: Color(int.parse("0xFF" + widget.primaryColor)),
        ),
        Positioned(
          child: SvgPicture.asset(
            widget.secondaryIcon,
            color: Color(int.parse("0xFF" + widget.secondaryColor)),
          ),
        ),
        widget.isMaintenance
            ? Positioned(
                width: widget.sizeBox.w * 1.05,
                height: widget.sizeBox.w * 1.05,
                child: SvgPicture.asset(
                  "assets/icons/svg/ic_maintenance.svg",
                ),
              )
            : Container(),
      ],
    );
  }
}
