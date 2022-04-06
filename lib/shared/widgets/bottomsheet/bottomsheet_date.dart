import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/bottomsheet/bottomsheet_custom.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_bottom.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_date.dart';

class BottomsheetDate {
  BottomsheetDate({
    required this.context,
    required this.startDate,
    required this.endDate,
    this.onPressed,
    this.padding,
  });

  final BuildContext context;
  final EdgeInsets? padding;
  final ValueSetter<DateTime> startDate;
  final ValueSetter<DateTime> endDate;
  final Function()? onPressed;

  final TextEditingController cDate1 = TextEditingController();
  final TextEditingController cDate2 = TextEditingController();
  bool isSelected = false;
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();

  bool isValidDate() {
    if (end.compareTo(start) < 0) {
      return false;
    }
    if (end.difference(start).inDays > 30) {
      return false;
    }

    return true;
  }

  void showDate() {
    BottomsheetCustom(
        padding: EdgeInsets.only(top: Insets.med),
        context: context,
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Stack(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Insets.xxl, horizontal: Insets.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atur Tanggal',
                        style: TextStyles.subtitle1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Insets.lg),
                        child: Text(
                          'Catatan : Periode maksimal 30 hari',
                          style: TextStyles.small1,
                        ),
                      ),
                      InputDate(
                          label: 'Tanggal Awal',
                          controller: cDate1,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 120)),
                          lastDate: DateTime.now(),
                          selectedDate: (value) {
                            startDate(value);

                            setState(() {
                              start = value;
                              isSelected = isValidDate();
                            });
                          },
                          isValid: (value) {}),
                      InputDate(
                          label: 'Tanggal Akhir',
                          controller: cDate2,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 120)),
                          lastDate: DateTime.now(),
                          selectedDate: (value) {
                            endDate(value);

                            setState(() {
                              end = value;
                              isSelected = isValidDate();
                            });
                          },
                          isValid: (value) {})
                    ],
                  )),
              Positioned(
                child: ButtonBottom(
                  enable: isSelected,
                  label: 'ATUR TANGGAL',
                  onTap: isSelected
                      ? onPressed ??
                          () {
                            Get.back();
                          }
                      : () {},
                ),
              ),
            ],
          );
        })).showData();
  }
}
