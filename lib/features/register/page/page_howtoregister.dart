import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_icon_vertical.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';

class PageHowToRegister extends StatelessWidget {
  const PageHowToRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/logo/logo-besar.png",
              width: size.width * 0.65,
            ),
            SizedBox(height: size.height * 0.045),
            Text(
              "Selamat datang \nAnda akan mendaftar sebagai",
              style: TextStyles.textHeader,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "IN-TAKE Rider",
                style: TextStyles.textHeader,
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Container(
              height: 2,
              width: size.width,
              color: AppColor.primaryColor,
            ),
            SizedBox(height: size.height * 0.020),
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                "Dua langkah mudah untuk bergabung dengan kami",
                style: TextStyles.textStd,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 10),
            // Container(
            //   width: size.width * 0.9,
            //   height: 220,
            //   padding: const EdgeInsets.fromLTRB(10, 11, 10, 0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.transparent,
            //     border: Border.all(
            //       color: AppColor.primaryColor,
            //       width: 2,
            //     ),
            //   ),
            //   child: Container(
            //     margin: const EdgeInsets.symmetric(vertical: 20),
            //     child: Table(
            //       columnWidths: const <int, TableColumnWidth>{
            //         0: FixedColumnWidth(49),
            //         1: FixedColumnWidth(10),
            //         2: FixedColumnWidth(240),
            //       },
            //       defaultVerticalAlignment: TableCellVerticalAlignment.top,
            //       children: <TableRow>[
            //         TableRow(
            //           children: <Widget>[
            //             Image.asset(
            //               "assets/images/profile.png",
            //             ),
            //             Center(
            //               child: Text(
            //                 "1. ",
            //                 style: TextStyles.textTableOrangeBold,
            //               ),
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 5),
            //                   child: Text(
            //                     "Lengkapi Profil Anda",
            //                     style: TextStyles.textTableOrangeBold,
            //                   ),
            //                 ),
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 25),
            //                   child: Text(
            //                     "Lengkapi data anda yang dihubungkan oleh IN-TAKE",
            //                     style: TextStyles.textTable,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         TableRow(
            //           children: <Widget>[
            //             Image.asset(
            //               "assets/images/document.png",
            //               width: size.width * 0.17,
            //             ),
            //             Center(
            //               child: Text(
            //                 "2. ",
            //                 style: TextStyles.textTableOrangeBold,
            //               ),
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Container(
            //                   margin: const EdgeInsets.only(bottom: 5),
            //                   child: Text(
            //                     "Upload Dokumen",
            //                     style: TextStyles.textTableOrangeBold,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Mohon sertakan dokumen pelengkap",
            //                   style: TextStyles.textTable,
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            CardRoundedBorder(
              borderColor: AppColor.greyColorLight,
              height: size.height * 0.130,
              width: size.width * 0.8,
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.person,
                      size: 55,
                      color: AppColor.greyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: size.width * 0.53,
                        child: Text(
                          'Pertama, lengkapi data anda yang akan dihubungkan oleh IN-TAKE',
                          style: TextStyles.textTable,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CardRoundedBorder(
              margin: const EdgeInsets.only(top: 15),
              borderColor: AppColor.greyColorLight,
              height: size.height * 0.130,
              width: size.width * 0.8,
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.file_present,
                      size: 55,
                      color: AppColor.greyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: size.width * 0.56,
                        child: Text(
                          'Kedua, Mohon sertakan dokumen pelengkap untuk keamanan dan kenyamanan anda',
                          style: TextStyles.textTable,
                          maxLines: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.025),
            ButtonPrimary(
              label: 'Konfirmasi',
              color: AppColor.primaryColor,
              size: 250,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
