// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:intakemobile/shared/widgets/pages/page_bgcolor.dart';

class PageDecorationBottom extends StatelessWidget {
  final Widget _child;

  const PageDecorationBottom({Key? key, required Widget child})
      : this._child = child,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageBgColor(
        child: Stack(
      children: [
        _child,
      ],
    ));
  }
}
