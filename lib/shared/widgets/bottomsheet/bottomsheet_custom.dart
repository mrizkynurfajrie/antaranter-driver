import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/cards/card_bottomsheet.dart';

class BottomsheetCustom {
  BottomsheetCustom({
    required this.context,
    required this.child,
    this.padding,
  });

  final BuildContext context;
  final Widget child;
  final EdgeInsets? padding;

  void showData() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CardBottomsheet(
              padding: padding ??
                  EdgeInsets.symmetric(
                      vertical: Insets.med, horizontal: Insets.lg),
              child: DraggableScrollableSheet(
                  initialChildSize: 0.91,
                  expand: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Padding(
                      padding: EdgeInsets.only(top: Insets.lg),
                      child: child,
                    );
                  }));
        });
  }
}
