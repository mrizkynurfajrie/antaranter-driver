import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class PageInfo extends StatelessWidget {
  const PageInfo({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 14,
            padding: EdgeInsets.symmetric(horizontal: Insets.med),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.amberAccent,
            ),
            child: Text(pageName.replaceAll("/", ''),
                style: const TextStyle(fontSize: 8)),
          ),
        ],
      ),
    );
  }
}
