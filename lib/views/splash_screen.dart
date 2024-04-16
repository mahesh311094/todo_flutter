import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/text_styles.dart';

// This is Splash screen
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Image.asset(
                  'assets/images/splash_logo.png',
                  width: Get.width / 1.5,
                  color: whiteColor,
                ),
                const Text(
                  appName,
                  textAlign: TextAlign.center,
                  style: splashHeading,
                ),
                const SizedBox(height: 78.0),
                const SpinKitCircle(
                  color: primaryColor,
                  size: 60.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
