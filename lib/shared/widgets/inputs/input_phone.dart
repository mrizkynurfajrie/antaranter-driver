import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antaranter_driverapp/shared/constants/phone_country_code.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_search.dart';

class InputPhone extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final ValueSetter<String> phoneNumber;
  final Function(String?)? onSave;
  final Function()? onEditingComplete;
  final bool setContryCode;
  final String? contryCode;
  final double? boxwidth;
  final double? boxheight;
  final double? inputWidth;
  final double? inputHeight;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const InputPhone({
    Key? key,
    this.hintText = 'Masukkan nomor ponsel',
    this.validate,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = 'Nomor Ponsel',
    required this.controller,
    required this.phoneNumber,
    this.onSave,
    this.onEditingComplete,
    this.setContryCode = true,
    this.contryCode,
    this.boxheight,
    this.boxwidth,
    this.inputHeight,
    this.inputWidth,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  _InputPhoneState createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  //String _flag = "🇮🇩";
  String _countryCode = '+62';
  List _filterList = [];
  final TextEditingController _keyword = TextEditingController();

  @override
  void initState() {
    if (widget.contryCode != null) {
      _countryCode = widget.contryCode!;
    }
    widget.phoneNumber('62');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != ''
              ? SizedBox(
                  child: Text(
                    widget.label,
                    style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s10, fontWeight: FontWeight.w400),
                  ),
                )
              : verticalSpace(0),
          // Container(
          //   margin: widget.margin ?? EdgeInsets.zero,
          //   padding: widget.padding ?? EdgeInsets.zero,
          //   width: widget.boxwidth ?? Get.width,
          //   height: widget.boxheight,
          //   child: TextFormField(
          //     enableInteractiveSelection: true,
          //     cursorColor: Theme.of(context).primaryColor,
          //     autovalidateMode: AutovalidateMode.onUserInteraction,
          //     onChanged: widget.onChange ??
          //         (value) {
          //           widget.phoneNumber(_countryCode + value);
          //         },
          //     onEditingComplete: widget.onEditingComplete,
          //     onSaved: widget.onSave,
          //     keyboardType: TextInputType.phone,
          //     controller: widget.controller,
          //     validator: (value) {
          //       if (!GetUtils.isPhoneNumber(_countryCode + value.toString())) {
          //         return 'Masukkan nomor Telepon dengan benar';
          //       }
          //       return null;
          //     },
          //     style: TextStyles.body2,
          //     inputFormatters: [
          //       LengthLimitingTextInputFormatter(13),
          //       FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //       FilteringTextInputFormatter.deny(RegExp(r'^0+'))
          //     ],
          //     decoration: inputDecoration(
          //       suffixIcon: widget.suffixIcon,
          //       hintText: 'Contoh : 852 xxxx xxxx',
          //     ),
          //   ),
          // ),
          Container(
            width: Get.width,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: AppColor.transparentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.setContryCode
                    // ? SizedBox(
                    //     width: 85.w,
                    //     child: TextFormField(
                    //       decoration: inputDecoration(
                    //         prefixIcon: InkWell(
                    //           onTap: _showListCountry,
                    //           child: Padding(
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: Insets.med),
                    //             child: Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 // Text(_flag),
                    //                 // horizontalSpace(Insets.xs),
                    //                 Text(
                    //                   _countryCode,
                    //                   style: TextStyles.body2,
                    //                 ),
                    //                 const Icon(
                    //                   Icons.keyboard_arrow_down,
                    //                   size: 30,
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         hintText: '',
                    //       ),
                    //     ))
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColor.neutral.shade200,
                                    width: 1))),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 7.h),
                        margin: EdgeInsets.only(right: 10.w),
                        width: 60.w,
                        child: Text(
                          '+62',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s18,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                widget.setContryCode ? horizontalSpace(7) : Container(),
                Expanded(
                  // width: Get.width * 0.5.w,
                  child: TextFormField(
                    enableInteractiveSelection: true,
                    cursorColor: Theme.of(context).primaryColor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: widget.onChange ??
                        (value) {
                          widget.phoneNumber(_countryCode + value);
                        },
                    onEditingComplete: widget.onEditingComplete,
                    onSaved: widget.onSave,
                    keyboardType: TextInputType.phone,
                    controller: widget.controller,
                    validator: (value) {
                      if (!GetUtils.isPhoneNumber(value.toString())) {
                        return 'Masukkan nomor ponsel dengan benar';
                      }
                      return null;
                    },
                    style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s18, fontWeight: FontWeight.w400),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(14),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.deny(RegExp(r'^0+'))
                    ],
                    decoration: InputDecoration(
                      suffixIcon: widget.suffixIcon,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
                      hintText: '812 345 6789',
                      hintStyle: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14, fontStyle: FontStyle.italic),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.neutral.shade200, width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTap({required int index, required List list}) {
    setState(() {
      //_flag = list[index]['flag'].toString();
      _countryCode = list[index]['dial_code'].toString();
    });
    widget.phoneNumber(_countryCode + widget.controller.text);
    Get.back();
  }

  void _showListCountry() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: Corners.lgBorder, color: Colors.white),
            padding: EdgeInsets.symmetric(horizontal: Insets.lg),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return DraggableScrollableSheet(
                initialChildSize: 0.9,
                builder: (context, scrollController) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child:
                                Text('Pilih Negara', style: TextStyles.body1)),
                        IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    InputSearch(
                        controller: _keyword,
                        onChanged: (value) {
                          setState(() {
                            _filterList = _buildSearchList(
                                userSearchTerm: value.toString());
                          });
                        }),
                    Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: _filterList.isEmpty
                              ? PhoneCountryCode.listCountry.length
                              : _filterList.length,
                          itemBuilder: (context, index) {
                            return _filterList.isEmpty
                                ? _showBottomSheetWithSearch(
                                    index: index,
                                    list: PhoneCountryCode.listCountry)
                                : _showBottomSheetWithSearch(
                                    index: index, list: _filterList);
                          }),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  Widget _showBottomSheetWithSearch({required int index, required List list}) {
    return InkWell(
      onTap: () => onTap(index: index, list: list),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Insets.med),
        child: Row(
          children: [
            Text(list[index]['flag'].toString()),
            horizontalSpace(Insets.xs),
            SizedBox(
              width: Insets.xl * 3,
              child: Text(list[index]['dial_code'].toString()),
            ),
            horizontalSpace(Insets.sm),
            Expanded(
              child: Text(
                list[index]['name'].toString(),
                maxLines: 2,
                style: TextStyles.body1,
              ),
            )
          ],
        ),
      ),
    );
  }

  List _buildSearchList({required String userSearchTerm}) {
    List _searchList = [];

    for (int i = 0; i < PhoneCountryCode.listCountry.length; i++) {
      String name =
          PhoneCountryCode.listCountry[i]['name'].toString().toLowerCase();
      if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
        _searchList.add(PhoneCountryCode.listCountry[i]);
      }
    }
    return _searchList;
  }
}
