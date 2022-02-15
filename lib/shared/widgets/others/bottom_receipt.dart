import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class BottomReceipt extends StatelessWidget {
  final Color color;

  const BottomReceipt({Key? key, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = IconSizes.med;
        final dashCount = (boxWidth / dashWidth).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return CustomPaint(
                painter: _ShapesPainter(Colors.white),
                child: Container(
                    padding: EdgeInsets.zero,
                    height: Insets.med,
                    width: IconSizes.med,
                    child: const Center()));
          }),
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class _ShapesPainter extends CustomPainter {
  final Color color;
  _ShapesPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
