import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool orderStat = false;
  // Completer<GoogleMapController> _controller = Completer();
  // Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  // static final CameraPosition _cameraPosition = CameraPosition(
  //     target: LatLng(-0.4638875724001235, 117.10882384031538), zoom: 17.0);

  _orderNotification() {
    return Container(child: orderStat == true ? _orderIn() : _noOrder());
  }

  _noOrder() {
    return Container(
      child: Text(
        'Tidak ada orderan masuk',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.secondary,
        ),
      ),
    );
  }

  _orderIn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Dedy Fuadi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColor.secondaryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Rp 15.000',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryColor,
              ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: size.width * 0.3,
                  child: ElevatedButton(
                    child: Text(
                      'Tolak',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.secondColor.shade400,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Container(
                  width: size.width * 0.3,
                  child: ElevatedButton(
                    child: Text(
                      'Terima',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.successColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: AppColor.primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: AppColor.transparentColor,
                        backgroundImage: AssetImage("assets/images/fajrie.JPG"),
                        radius: 40,
                      ),
                      Container(
                        height: size.height / 13,
                        width: size.width * 0.40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              overflow: TextOverflow.fade,
                              text: TextSpan(
                                  style: TextStyles.textTitle,
                                  text: "Muhammad Rizky Nur Fajrie"),
                              maxLines: 2,
                            ),
                            Spacer(),
                            Text(
                              "085250223238",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: size.height * 0.095,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: size.width / 4,
                                  height: size.height * 0.025,
                                  child: Center(
                                    child: Text(
                                      "MITRA RIDER",
                                      style: TextStyles.textStatWhite,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width / 4,
                                  height: size.height * 0.025,
                                  child: Center(
                                    child: Text(
                                      "AKTIF",
                                      style: TextStyles.textStatWhite,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColor.successColor,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width / 4,
                                  height: size.height * 0.025,
                                  child: Center(
                                    child: Text(
                                      "SIAP JEMPUT",
                                      style: TextStyles.textStatWhite,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColor.successColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: size.height * 0.4,
            width: size.width,
            color: AppColor.greyColorLight,
            // child: _orderNotification(),
            // child: GoogleMap(
            //   polylines: Set<Polyline>.of(polylines.values),
            //   mapType: MapType.normal,
            //   initialCameraPosition: _cameraPosition,
            //   onMapCreated: (GoogleMapController controller) {
            //     _controller.complete(controller);
            //   },
            // ),
          ),
          Spacer(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 3),
                width: size.width * 0.9,
                child: Text(
                  "Order History",
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
