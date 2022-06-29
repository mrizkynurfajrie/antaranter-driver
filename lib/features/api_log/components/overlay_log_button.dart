import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/features/api_log/components/log_button.dart';

class OverlayLogButton extends StatefulWidget {
  const OverlayLogButton({Key? key}) : super(key: key);

  @override
  _OverlayLogButtonState createState() => _OverlayLogButtonState();
}

class _OverlayLogButtonState extends State<OverlayLogButton> {
  double _y = 100.0;
  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
            builder: (context) => Positioned(
                  right: 0,
                  top: _y,
                  child: SizedBox(
                    height: Sizes.xl,
                    width: Sizes.xl,
                    child: Draggable(
                      feedback: const LogButton(color: Colors.green),
                      childWhenDragging: Container(),
                      onDragEnd: (dragDetails) {
                        setState(() {
                          _y = dragDetails.offset.dy - 20;
                        });
                      },
                      child: LogButton(color: Colors.red.shade800),
                    ),
                  ),
                ))
      ],
    );
  }
}
