import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 12.w;
    double firstLine = 97.w;
    double secondLine = 183.w;
    var path = Path();

    path.addOval(Rect.fromCircle(center: Offset(0, firstLine), radius: radius));
    path.addOval(
        Rect.fromCircle(center: Offset(0, secondLine), radius: radius));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, firstLine), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, secondLine), radius: radius));

    path
      ..addRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      )
      ..fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
