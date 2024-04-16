import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';
import 'text_styles.dart';

// this function is used to show toast message
void showToast(String? msg) {
  Fluttertoast.showToast(msg: msg ?? "");
}

// this function is used to configure loader style
void loaderConfig() {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 50.0
    ..radius = 10.0
    ..backgroundColor = whiteColor
    ..indicatorColor = primaryColor
    ..textColor = primaryColor
    ..textStyle = bodyLargeBoldPrimary
    ..textPadding = const EdgeInsets.symmetric(horizontal: 32, vertical: 12)
    ..userInteractions = false
    ..dismissOnTap = false;
}

// this function is used to show loader on ui
void showLoader() {
  EasyLoading.show(status: "Loading...");
}

// this function is used to dismiss loader on ui
void dismissLoader() {
  EasyLoading.dismiss();
}
