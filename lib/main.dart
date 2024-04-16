import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'utils/colors.dart';
import 'utils/utils.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
  loaderConfig();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }
}
