import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/bottomsheet/bottomsheet_custom.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_bottom.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_search.dart';

class BottomsheetSelection {
  BottomsheetSelection({
    required this.context,
    this.title,
    required this.itemName,
    required this.listWidget,
    this.showTitle = true,
    this.padding,
    required this.value,
    this.enableSearch = true,
    this.labelButton = 'PILIH',
    this.onPressed,
  });

  final BuildContext context;
  final List<ModelBottomsheet> listWidget;
  final String? title;
  final bool showTitle;
  final EdgeInsets? padding;
  final ValueSetter<dynamic> value;
  final ValueSetter<dynamic> itemName;
  final bool enableSearch;
  final String labelButton;
  final Function()? onPressed;

  bool isSelected = false;
  final TextEditingController _keyword = TextEditingController();
  List<ModelBottomsheet> _filterList = [];

  List<ModelBottomsheet> _searchList({required String keyword}) {
    List<ModelBottomsheet> _searchList = [];

    for (int i = 0; i < listWidget.length; i++) {
      String name = listWidget[i].itemName;
      if (name.toLowerCase().contains(keyword.toLowerCase())) {
        _searchList.add(listWidget[i]);
      }
    }
    return _searchList;
  }

  void showSelection() {
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
                      title ?? '',
                      style: TextStyles.subtitle1,
                    ),
                    verticalSpace(Insets.xl),
                    enableSearch
                        ? InputSearch(
                            controller: _keyword,
                            onChanged: (value) {
                              setState(() {
                                _filterList = _searchList(keyword: value);
                              });
                            },
                            suffixIcon: IconButton(
                                padding: EdgeInsets.all(Insets.sm),
                                icon: Icon(
                                  Icons.close,
                                  size: IconSizes.sm,
                                ),
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    _keyword.clear();
                                    _filterList.clear();
                                  });
                                }),
                          )
                        : verticalSpace(0),
                    verticalSpace(Insets.xl),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: Insets.xxl),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _filterList.isEmpty
                              ? listWidget.length
                              : _filterList.length,
                          itemBuilder: (context, index) {
                            return _filterList.isEmpty
                                ? InkWell(
                                    onTap: () {
                                      value(listWidget[index].value);
                                      itemName(listWidget[index].itemName);
                                      setState(() {
                                        isSelected = true;
                                      });
                                    },
                                    child: listWidget[index].widget,
                                  )
                                : InkWell(
                                    onTap: () {
                                      value(_filterList[index].value);
                                      itemName(_filterList[index].itemName);
                                      setState(() {
                                        isSelected = true;
                                      });
                                    },
                                    child: _filterList[index].widget,
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: ButtonBottom(
                  enable: isSelected,
                  label: labelButton,
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

class ModelBottomsheet {
  ModelBottomsheet({
    this.widget = const SizedBox(),
    this.value,
    required this.itemName,
  });

  Widget widget;
  dynamic value;
  String itemName;
}
