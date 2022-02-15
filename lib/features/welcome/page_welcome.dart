import 'package:flutter/material.dart';
import 'package:intake_rider/const.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            Image.asset(
              "assets/logo/logo-besar.png",
              width: size.width * 0.65,
            ),
            const Spacer(),
            Image.asset(
              "assets/images/delivery-man.png",
              height: 180,
              width: 180,
            ),
            const Spacer(),
            const Text(
              "Hai, Mitra Rider! Siap Antarin?",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: secondaryColor,
              ),
              child: TextButton(
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 22,
                    color: whiteColor,
                  ),
                ),
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: secondaryColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 2,
              color: secondaryColor,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
            const SizedBox(height: 5),
            Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: primaryColor,
              ),
              child: TextButton(
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
