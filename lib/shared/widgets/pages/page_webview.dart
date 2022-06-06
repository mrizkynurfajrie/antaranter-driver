import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageWebView extends StatefulWidget {
  const PageWebView({Key? key}) : super(key: key);

  @override
  State<PageWebView> createState() => _PageWebViewState();
}

class _PageWebViewState extends State<PageWebView> {
  var data;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarTitleColor: AppColor.primaryColor,
      toolbarElevation: 2,
      center: null,
      title: data['title'],
      enableBack: true,
      child: Stack(
        children: [
          WebView(
            initialUrl: data['url'],
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              if (progress > 99) {
                setState(() {
                  loading = false;
                });
              }
            },
          ),
          loading == true
              ? const Align(
                  alignment: Alignment.topCenter,
                  child: LinearProgressIndicator(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
