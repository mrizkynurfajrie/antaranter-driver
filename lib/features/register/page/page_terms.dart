import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intake_rider/features/register/controller_register.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/shared/widgets/others/checkbox_label.dart';
import 'package:get/get.dart';

class PageTerms extends GetView<ControllerRegister> {
  const PageTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                AppLogos.logoHorizontal,
                width: Get.width * 0.35.w,
              ),
              verticalSpace(15.h),
              Text(
                "Selamat datang",
                style: TextStyles.textHeader,
                textAlign: TextAlign.center,
              ),
              verticalSpace(10.h),
              SizedBox(
                width: Get.width * 0.88.w,
                child: Text(
                  "Mohon perhatikan dan pahami ketentuan berikut untuk dapat menjadi mitra IN-TAKE Rider",
                  style: TextStyles.textStd,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              verticalSpace(10.h),
              CardRoundedBorder(
                padding: EdgeInsets.only(left: 3.w, right: 5.w),
                borderColor: AppColor.greyColorLight,
                height: Get.height * 0.55.h,
                width: Get.width * 0.8.w,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(15),
                        1: FixedColumnWidth(250),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      children: [
                        TableRow(
                          children: [
                            SizedBox(
                              height: 55,
                              child: Text("1.", style: TextStyles.textStd),
                            ),
                            Text(
                              "Mengaktifkan ID dengan deposit minimal Rp 50.000",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              height: 55,
                              child: Text("2.", style: TextStyles.textStd),
                            ),
                            Text(
                              "Deposit dapat ditransfer ke Rek. *** PT. INTEK",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Text("3.", style: TextStyles.textStd),
                            ),
                            Text(
                              "Setiap dilaksanakan nya pesan antar dalam 1 order akan dikenakan biaya Rp 500",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              height: 55,
                              child: Text("4.", style: TextStyles.textStd),
                            ),
                            Text(
                              "Tarif Rp 500. tersebut akan diambil dari deposit anda",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Text("5.", style: TextStyles.textStd),
                            ),
                            Text(
                              "Jika Deposit anda telah habis maka secara otomatis ID akan berstatus non-aktif",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Text("6.", style: TextStyles.textStd),
                            ),
                            Text(
                              "Aktifkan ID anda dengan memenuhi standar minimal deposit",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("7.", style: TextStyles.textStd),
                            Text(
                              "Batas waktu negosiasi adalah 3 menit per 1 pemesananan, jika melampaui maka akan otomatis dibatalkan oleh sistem",
                              style: TextStyles.textStd,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(10.h),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CheckboxLabel(
                  onChange: (value) {
                    controller.statusAgreementTerm.value = value;
                  },
                  label:
                      'Saya mengerti dan memahami dengan syarat serta ketentuan yang berlaku',
                  colorBorder: AppColor.greyColorLight,
                  labelStyle: TextStyles.textcheckbox,
                ),
              ),
              const Spacer(),
              Obx(
                () => ButtonPrimary(
                  enable: controller.statusAgreementTerm.value,
                  label: 'Konfirmasi',
                  color: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed('/register_page');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
