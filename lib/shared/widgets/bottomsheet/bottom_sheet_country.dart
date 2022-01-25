import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/inputs/input_primary.dart';

class BottomSheetCountry {
  static void show(
      {required dynamic getxController,
      required Function onTap,
      required Function searchFunction,
      required String valueObject,
      String valueFlag = ''}) async {
    final TextEditingController searchCountry = TextEditingController();
    Get.bottomSheet(
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: Get.height,
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    'Pilih penerbit paspor',
                    style: TextStyles.h5,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  )
                ],
              ),
              InputPrimary(
                hintText: 'Cari penerbit paspor',
                onChange: (value) => searchFunction(value),
                controller: searchCountry,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getxController.listSearchedData.length,
                      itemBuilder: (context, index) {
                        if (index.isOdd) return const Divider();
                        return InkWell(
                          onTap: () => onTap(index),
                          child: Row(
                            children: [
                              Image.network(
                                getxController.listSearchedData[index]
                                    [valueFlag],
                                width: Sizes.lg,
                              ),
                              horizontalSpace(Insets.lg),
                              Expanded(
                                child: Text(
                                  getxController.listSearchedData[index]
                                      [valueObject],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )),
      barrierColor: Colors.grey.withOpacity(0.5),
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      enableDrag: true,
    );
  }
}
