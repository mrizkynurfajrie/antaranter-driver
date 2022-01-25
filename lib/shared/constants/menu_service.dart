// import 'package:basecode_app/features/donasi/page_donasi.dart';
// import 'package:basecode_app/features/single_donation/controller_single_donation.dart';
// import 'package:basecode_app/features/single_donation/page_single_donation.dart';
// import 'package:basecode_app/routes/app_routes.dart';
// import 'package:basecode_app/shared/constants/assets.dart';
// import 'package:basecode_app/shared/model/model_donation_provider.dart';
// import 'package:basecode_app/shared/model/model_other_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';

// class MenuService {
//   static List listMenuService = [
//     // 0 - 2
//     {
//       "title": "Pulsa",
//       "icon": AppIcons.icPulsaMenu,
//       "route": Routes.PAGE_PULSA,
//       "isMaintenance": false,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_pulsa_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_pulsa_2.svg",
//       }
//     },
//     {
//       "title": "PascaBayar",
//       "icon": AppIcons.icPascabayarMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_PULSA_PASCABAYAR,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_pascabayar_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_pascabayar_2.svg",
//       }
//     },
//     // Menu Icon Tagihan 2 -7
//     {
//       "title": "PLN",
//       "icon": AppIcons.icPlnMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_PLN,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_pln_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_pln_2.svg",
//       }
//     },
//     {
//       "title": "PDAM",
//       "icon": AppIcons.icPdamMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_CHOOSE_PDAM,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_pdam_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_pdam_2.svg",
//       }
//     },
//     {
//       "title": "Gas",
//       "icon": AppIcons.icGasMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_gas_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_gas_2.svg",
//       }
//     },
//     {
//       "title": "tvCable",
//       "icon": AppIcons.icTvKabelMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_PRODUCT_TV_KABEL,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_tv_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_tv_2.svg",
//       }
//     },
//     {
//       "title": "Telkom",
//       "icon": AppIcons.icTelkomMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_TELKOM,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_telkom_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_telkom_2.svg",
//       }
//     },
//     {
//       "title": "Ecommerce",
//       "icon": AppIcons.icEcommerceMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_ecommerce_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_ecommerce_2.svg",
//       }
//     },
//     // Donasi Menu Donasi 8 - 12
//     {
//       "title": "ACT",
//       "icon": AppIcons.icActMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_DONASI,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_donasi_rutin_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_donasi_rutin_2.svg",
//       }
//     },
//     {
//       "title": "Yakesma",
//       "icon": AppIcons.icYakesmaMenu,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_donasi_rutin_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_donasi_rutin_2.svg",
//       }
//     },
//     {
//       "title": "Indonesia Dermawan",
//       "icon": AppIcons.icIndonesiaDermawanMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_INDONESIA_DERMAWAN
//     },
//     {
//       "title": "Global Quran",
//       "icon": AppIcons.icGlobalQuranMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_GLOBAL_QURBAN
//     },
//     {
//       "title": "Wakaf Tunai",
//       "icon": AppIcons.icWakafTunai,
//       "isMaintenance": true,
//     },
//     // Menu Icon Bisnis 13 - 20
//     {
//       "title": "Emas",
//       "icon": AppIcons.icEmasMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "Payroll",
//       "icon": AppIcons.icPayrollMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "Actionlink",
//       "icon": AppIcons.icActionlinkMenu,
//       "isMaintenance": false,
//     },
//     {
//       "title": "Mitra",
//       "icon": AppIcons.icMerchantMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "YesPay",
//       "icon": AppIcons.icYespayMenu,
//       "isMaintenance": false,
//     },
//     {
//       "title": "YouPay",
//       "icon": AppIcons.icYoupayMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "BizPay",
//       "icon": AppIcons.icBizpayMenu,
//       "isMaintenance": true,
//     },
//     // Menu Icon Transfer 20 - 23
//     {
//       "title": "betweenMemberMenu",
//       "icon": AppIcons.icAntarMemberMenu,
//       "route": Routes.PAGE_TRANSFER_MEMBER,
//       "isMaintenance": false,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_antar_member_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_antar_member_2.svg",
//       }
//     },
//     {
//       "title": "Voucher",
//       "icon": AppIcons.icVoucherMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_voucher_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_voucher_2.svg",
//       }
//     },
//     {
//       "title": "domesticMenu",
//       "icon": AppIcons.icDalamNegeriMenu,
//       "route": Routes.PAGE_CHOOSE_DOMESTIC_BANK,
//       "isMaintenance": false,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_dalam_negeri_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_dalam_negeri_2.svg",
//       }
//     },
//     {
//       "title": "overseasMenu",
//       "icon": AppIcons.icLuarNegeriMenu,
//       "route": Routes.PAGE_TRANSFER_FOREIGN_BANK,
//       "isMaintenance": false,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_luar_negeri_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_luar_negeri_2.svg",
//       }
//     },
//     // Menu icon Topup wallet 24 - 26
//     {
//       "title": "OVO",
//       "icon": AppIcons.icOvoMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_OVO,
//     },
//     {
//       "title": "Gopay",
//       "icon": AppIcons.icGopayMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_GOPAY
//     },
//     {
//       "title": "Shopee",
//       "icon": AppIcons.icShopeeMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_SHOPEEPAY,
//     },
//     // Menu icon Asuransi 27 - 28
//     {
//       "title": "insuranceOther",
//       "icon": AppIcons.icAsuransiLainnyaMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_asuransi_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_asuransi_2.svg",
//       }
//     },
//     {
//       "title": "BPJS",
//       "icon": AppIcons.icBpjsMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_BPJS,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_bpjs_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_bpjs_2.svg",
//       }
//     },
//     // Menu icon Hiburan 29 - 30
//     {
//       "title": "Games",
//       "icon": AppIcons.icGamesMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_VOUCHER_GAMES,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_game_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_game_2.svg",
//       }
//     },
//     {
//       "title": "Streaming",
//       "icon": AppIcons.icStreamingMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_streaming_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_streaming_2.svg",
//       }
//     },
//     // Meni icon Belanja 31 - 33
//     {
//       "title": "Pasar Sedekah",
//       "icon": AppIcons.icPasarSedekahMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "Bekal Muslim",
//       "icon": AppIcons.icBekalMuslimMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "Etanee",
//       "icon": AppIcons.icEtaneeMenu,
//       "isMaintenance": true,
//     },
//     // Menu icon Transportasi 34 -36
//     {
//       "title": "Kereta",
//       "icon": AppIcons.icKeretaMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_kereta_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_kereta_2.svg",
//       }
//     },
//     {
//       "title": "Bis",
//       "icon": AppIcons.icBisMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_bus_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_bus_2.svg",
//       }
//     },
//     {
//       "title": "Pesawat",
//       "icon": AppIcons.icPesawatMenu,
//       "isMaintenance": true,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_pesawat_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_pesawat_2.svg",
//       }
//     },
//     // Menu icon Pajak & Retribusi 37 - 38
//     {
//       "title": "PBB",
//       "icon": AppIcons.icPbbMenu,
//       "isMaintenance": true,
//     },
//     {
//       "title": "Samsat",
//       "icon": AppIcons.icSamsatMenu,
//       "isMaintenance": true,
//     },
//     // Menu Icon Kartu Elektronik 39
//     {
//       "title": "E-Money",
//       "icon": AppIcons.icEmoneyMenu,
//       "route": Routes.PAGE_E_TOLL,
//       "isMaintenance": false,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_emoney_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_emoney_2.svg",
//       }
//     },
//     // Menu icon reward 40
//     {
//       "title": "Reward",
//       "icon": AppIcons.icRewardMenu,
//       "isMaintenance": false,
//     },
//     // Other 41
//     {
//       "title": "more",
//       "icon": AppIcons.icLainnyaMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_OTHERS,
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_lainnya_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_lainnya_2.svg",
//       }
//     },

//     // Menu Icon Zakat 42 - 47
//     {
//       "title": "Zakat",
//       "icon": AppIcons.icAntarMemberMenu,
//       "isMaintenance": true,
//       "route": Routes.PAGE_OTHERS,
//       "argument": const PageSingleDonationArgs(
//         donationType: DonationType.wakaf,
//       ),
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_zakat_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_zakat_2.svg",
//       }
//     },

//     // Menu Icon Infaq
//     {
//       "title": "Infaq",
//       "icon": AppIcons.icAntarMemberMenu,
//       "isMaintenance": true,
//       "route": Routes.PAGE_OTHERS,
//       "argument": const PageSingleDonationArgs(
//         donationType: DonationType.wakaf,
//       ),
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_infaq_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_infaq_2.svg",
//       }
//     },

//     // Menu Icon Sedekah
//     {
//       "title": "Sedekah",
//       "icon": AppIcons.icAntarMemberMenu,
//       "isMaintenance": true,
//       "route": Routes.PAGE_OTHERS,
//       "argument": const PageSingleDonationArgs(
//         donationType: DonationType.wakaf,
//       ),
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_sedekah_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_sedekah_2.svg",
//       }
//     },

//     // Menu Icon Wakaf
//     {
//       "title": "Wakaf",
//       "icon": AppIcons.icAntarMemberMenu,
//       "isMaintenance": true,
//       "route": Routes.PAGE_OTHERS,
//       "argument": const PageSingleDonationArgs(
//         donationType: DonationType.wakaf,
//       ),
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_wakaf_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_wakaf_2.svg",
//       }
//     },

//     // Menu Icon Donasi Lainnya
//     {
//       "title": "Donation Other",
//       "icon": AppIcons.icAntarMemberMenu,
//       "isMaintenance": true,
//       "route": Routes.PAGE_OTHERS,
//       "argument": const PageSingleDonationArgs(
//         donationType: DonationType.wakaf,
//       ),
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_donasi_lainnya_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_donasi_lainnya_2.svg",
//       }
//     },

//     // Menu Icon Donasi Lainnya
//     {
//       "title": "Donation Routine",
//       "icon": AppIcons.icAntarMemberMenu,
//       "isMaintenance": true,
//       "route": Routes.PAGE_OTHERS,
//       "argument": const PageSingleDonationArgs(
//         donationType: DonationType.wakaf,
//       ),
//       "iconIssuer": {
//         "sizeBox": 30.0,
//         "primaryIcon": "assets/icons/svg/ic_donasi_rutin_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_donasi_rutin_2.svg",
//       }
//     },

//     // 48 - 51
//     {
//       "title": "Top Up",
//       "icon": AppIcons.icTopUp,
//       "isMaintenance": false,
//       "route": Routes.PAGE_TOPUP,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_wallet_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_wallet_2.svg",
//       }
//     },
//     {
//       "title": "Transfer",
//       "icon": AppIcons.icTransfer,
//       "isMaintenance": false,
//       "route": Routes.PAGE_TRANSFER,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_transfer_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_transfer_2.svg",
//       }
//     },
//     {
//       "title": "Donasi",
//       "icon": AppIcons.icDonasiMenu,
//       "isMaintenance": false,
//       "route": Routes.PAGE_DONASI,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_donasi_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_donasi_2.svg",
//       }
//     },
//     {
//       "title": "Share",
//       "icon": AppIcons.icShare,
//       "isMaintenance": false,
//       "route": Routes.PAGE_SHARE_REFFERAL,
//       "iconIssuer": {
//         "primaryIcon": "assets/icons/svg/ic_share_1.svg",
//         "secondaryIcon": "assets/icons/svg/ic_share_2.svg",
//       }
//     },
//   ];

//   // Icon Angsuran
//   //       sizeBox: 30,
//   //       primaryIcon: "assets/icons/svg/ic_angsuran_1.svg",
//   //       secondaryIcon: "assets/icons/svg/ic_angsuran_2.svg",
//   //       primaryColor: "018539",
//   //       secondaryColor: "FFFF00",
//   //       fitWidth: true,
//   //       positionTop: 0,
//   //       positionLeft: 0.02,
//   //       sizeBoxSecondary: 1,

//   static List<Widget> listPageMenuService = [];
// }
// //   static List<Widget> listPageMenuService = [
// //     // PageComingSoon(text: "Pos Instan Plus"), // PagePosInstanPlus()
// //     PageCourierKirim(
// //       serviceId: "Q9C",
// //       layananPengiriman: 'Pos Instan Plus',
// //       courierType: 0,
// //     ),
// //     // PageComingSoon(text: "Page Pos Sameday"), // PagePosSameday()
// //     PageCourierKirim(
// //       serviceId: "2Q9",
// //       layananPengiriman: 'Pos Sameday',
// //       courierType: 1,
// //     ),
// //     PageCourierKirim(
// //       serviceId: "447",
// //       layananPengiriman: 'Pos Netx Day',
// //       courierType: 2,
// //     ), // PagePosNextDay()
// //     PageCourierKirim(
// //       serviceId: "240",
// //       layananPengiriman: 'Pos Regular',
// //       courierType: 3,
// //     ), // PagePosRegular()
// //     PageCourierLanding(), // PageOrderBooKing()
// //     Api1().isLogged
// //         ? PageCekTarifKirim(
// //             serviceId: "",
// //             layananPengiriman: '',
// //             courierType: 0,
// //           )
// //         : PageCekTarifKirim(
// //             serviceId: "",
// //             layananPengiriman: '',
// //             courierType: 0,
// //           ), // PageCheckPrice()
// //     // PageComingSoon(text: "Page Cek Tarif"), // PageCheckPrice()
// //     PageLacakKiriman(), // PageTrackingPacket() // End Layanan Kurir Index 0 - 6
// //     PageComingSoon(), // PageBuyAndBill()
// //     PageWessel(), // PageWesselPos() // End Layanan Keuangan Index 7 - 8
// //     PageComingSoon(), // PageMaterai()
// //     PageComingSoon(), // PageFilateli() // End Galeri Pos Index 9 - 10
// //     PageComingSoon(), // PageTraveloka()
// //     PageComingSoon(), // PagePeduliLindungi() // End Lainnya Index 11 - 12
// //     PageComingSoon(), // other service
// //   ];
// // }

// class OtherMenuService {
//   static List<ModelOtherMenu> otherMenu = <ModelOtherMenu>[
//     ModelOtherMenu(
//       title: "Pulsa",
//       menus: <Menus>[
//         Menus.fromJson({
//           "title": "Pulsa",
//           "icon": AppIcons.icPulsaMenu,
//           "route": Routes.PAGE_PULSA,
//           "isMaintenance": false,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_pulsa_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_pulsa_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "PascaBayar",
//           "icon": AppIcons.icPascabayarMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_PULSA_PASCABAYAR,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_pascabayar_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_pascabayar_2.svg",
//           }
//         }),
//       ],
//     ),
//     ModelOtherMenu(
//       title: "billCategory".tr,
//       menus: <Menus>[
//         Menus.fromJson({
//           "title": "PLN",
//           "icon": AppIcons.icPlnMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_PLN,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_pln_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_pln_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "PDAM",
//           "icon": AppIcons.icPdamMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_CHOOSE_PDAM,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_pdam_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_pdam_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Gas",
//           "icon": AppIcons.icGasMenu,
//           "isMaintenance": true,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_gas_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_gas_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "tvCable".tr,
//           "icon": AppIcons.icTvKabelMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_PRODUCT_TV_KABEL,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_tv_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_tv_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Telkom",
//           "icon": AppIcons.icTelkomMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_TELKOM,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_telkom_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_telkom_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Ecommerce",
//           "icon": AppIcons.icEcommerceMenu,
//           "isMaintenance": true,
//           "iconIssuer": {
//             "primaryIcon": "assets/icons/svg/ic_ecommerce_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_ecommerce_2.svg",
//           }
//         }),
//       ],
//     ),
//     ModelOtherMenu(
//       title: "donation".tr,
//       menus: <Menus>[
//         Menus.fromJson({
//           "title": "ACT",
//           "icon": AppIcons.icActMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_DONASI,
//           "argument": const PageDonasiArgs(
//             provider: DonationProvider.act,
//           ),
//         }),
//         Menus.fromJson({
//           "title": "Yakesma",
//           "isMaintenance": false,
//           "icon": AppIcons.icYakesmaMenu,
//           "route": Routes.PAGE_DONASI,
//           "argument": const PageDonasiArgs(
//             provider: DonationProvider.yakesma,
//           ),
//         }),
//         Menus.fromJson({
//           "title": "Zakat",
//           "icon": AppIcons.icAntarMemberMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_SINGLE_DONATION,
//           "argument": const PageSingleDonationArgs(
//             donationType: DonationType.zakat,
//           ),
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_zakat_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_zakat_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Infaq",
//           "icon": AppIcons.icAntarMemberMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_SINGLE_DONATION,
//           "argument": const PageSingleDonationArgs(
//             donationType: DonationType.infaq,
//           ),
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_infaq_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_infaq_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Sedekah",
//           "icon": AppIcons.icAntarMemberMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_SINGLE_DONATION,
//           "argument": const PageSingleDonationArgs(
//             donationType: DonationType.sedekah,
//           ),
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_sedekah_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_sedekah_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Wakaf",
//           "icon": AppIcons.icAntarMemberMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_SINGLE_DONATION,
//           "argument": const PageSingleDonationArgs(
//             donationType: DonationType.wakaf,
//           ),
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_wakaf_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_wakaf_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Donation Routine".tr,
//           "icon": AppIcons.icAntarMemberMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_DONASI,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_donasi_rutin_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_donasi_rutin_2.svg",
//           },
//           "argument": 2,
//         }),
//         Menus.fromJson({
//           "title": "Donation Other".tr,
//           "icon": AppIcons.icAntarMemberMenu,
//           "isMaintenance": true,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_donasi_lainnya_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_donasi_lainnya_2.svg",
//           }
//         }),
//         // Menus.fromJson({
//         //   "title": "Global Qurban",
//         //   "icon": AppIcons.icGlobalQuranMenu,
//         //   "route": Routes.PAGE_GLOBAL_QURBAN,
//         //   "isMaintenance": false,
//         // }),
//         // Menus.fromJson({
//         //   "title": "Indonesia Dermawan",
//         //   "icon": AppIcons.icIndonesiaDermawanMenu,
//         //   "route": Routes.PAGE_INDONESIA_DERMAWAN,
//         //   "isMaintenance": false,
//         // }),
//       ],
//     ),
//     ModelOtherMenu(
//       title: 'Transfer',
//       menus: <Menus>[
//         Menus.fromJson({
//           "title": "betweenMemberMenu".tr,
//           "icon": AppIcons.icAntarMemberMenu,
//           "route": Routes.PAGE_TRANSFER_MEMBER,
//           "isMaintenance": false,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_antar_member_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_antar_member_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "Voucher",
//           "icon": AppIcons.icVoucherMenu,
//           "isMaintenance": true,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_voucher_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_voucher_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "domesticMenu".tr,
//           "icon": AppIcons.icDalamNegeriMenu,
//           "route": Routes.PAGE_CHOOSE_DOMESTIC_BANK,
//           "isMaintenance": false,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_dalam_negeri_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_dalam_negeri_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "overseasMenu".tr,
//           "icon": AppIcons.icLuarNegeriMenu,
//           "route": Routes.PAGE_TRANSFER_FOREIGN_BANK,
//           "isMaintenance": false,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_luar_negeri_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_luar_negeri_2.svg",
//           }
//         }),
//       ],
//     ),
//     ModelOtherMenu(title: 'Topup Wallet', menus: <Menus>[
//       Menus.fromJson({
//         "title": "OVO",
//         "icon": AppIcons.icOvoMenu,
//         "isMaintenance": false,
//         "route": Routes.PAGE_OVO,
//       }),
//       Menus.fromJson({
//         "title": "Gopay",
//         "icon": AppIcons.icGopayMenu,
//         "isMaintenance": false,
//         "route": Routes.PAGE_GOPAY
//       }),
//       Menus.fromJson({
//         "title": "Shopee",
//         "icon": AppIcons.icShopeeMenu,
//         "isMaintenance": false,
//         "route": Routes.PAGE_SHOPEEPAY,
//       }),
//     ]),
//     ModelOtherMenu(
//       title: 'insuranceCategory'.tr,
//       menus: <Menus>[
//         Menus.fromJson({
//           "title": "insuranceOther".tr,
//           "icon": AppIcons.icAsuransiLainnyaMenu,
//           "isMaintenance": true,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_asuransi_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_asuransi_2.svg",
//           }
//         }),
//         Menus.fromJson({
//           "title": "BPJS",
//           "icon": AppIcons.icBpjsMenu,
//           "isMaintenance": false,
//           "route": Routes.PAGE_BPJS,
//           "iconIssuer": {
//             "sizeBox": 30.0,
//             "primaryIcon": "assets/icons/svg/ic_bpjs_1.svg",
//             "secondaryIcon": "assets/icons/svg/ic_bpjs_2.svg",
//           }
//         }),
//       ],
//     ),
//     ModelOtherMenu(title: "entertainmentCategory".tr, menus: <Menus>[
//       Menus.fromJson({
//         "title": "Games",
//         "icon": AppIcons.icGamesMenu,
//         "isMaintenance": false,
//         "route": Routes.PAGE_VOUCHER_GAMES,
//         "iconIssuer": {
//           "sizeBox": 30.0,
//           "primaryIcon": "assets/icons/svg/ic_game_1.svg",
//           "secondaryIcon": "assets/icons/svg/ic_game_2.svg",
//         }
//       }),
//       Menus.fromJson({
//         "title": "Streaming",
//         "icon": AppIcons.icStreamingMenu,
//         "isMaintenance": true,
//         "iconIssuer": {
//           "sizeBox": 30.0,
//           "primaryIcon": "assets/icons/svg/ic_streaming_1.svg",
//           "secondaryIcon": "assets/icons/svg/ic_streaming_2.svg",
//         }
//       }),
//     ]),
//     ModelOtherMenu(title: "taxCategory".tr, menus: <Menus>[
//       Menus.fromJson({
//         "title": "PBB",
//         "icon": AppIcons.icPbbMenu,
//         "isMaintenance": true,
//       }),
//       Menus.fromJson({
//         "title": "Samsat",
//         "icon": AppIcons.icSamsatMenu,
//         "isMaintenance": true,
//       })
//     ]),
//     ModelOtherMenu(title: "eCardCategory".tr, menus: <Menus>[
//       Menus.fromJson({
//         "title": "E-Money",
//         "icon": AppIcons.icEmoneyMenu,
//         "route": Routes.PAGE_E_TOLL,
//         "isMaintenance": false,
//         "iconIssuer": {
//           "sizeBox": 30.0,
//           "primaryIcon": "assets/icons/svg/ic_emoney_1.svg",
//           "secondaryIcon": "assets/icons/svg/ic_emoney_2.svg",
//         }
//       }),
//     ]),
//     ModelOtherMenu(title: "Reward", menus: <Menus>[
//       Menus.fromJson({
//         "title": "Reward",
//         "icon": AppIcons.icRewardMenu,
//         "isMaintenance": false,
//       }),
//     ]),
//   ];
// }
