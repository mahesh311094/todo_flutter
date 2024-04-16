import 'dart:async';

import 'package:get/get.dart';

import '../utils/shared_preference.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';

class SplashController extends GetxController {
  final SharedPreference sharedPreference = SharedPreference();

  @override
  void onReady() {
    checkLogin();
    super.onReady();
  }

  // this function is used to check use is logged in or not
  // also set timer for splash screen to 3 second
  void checkLogin() {
    Timer(const Duration(seconds: 3), () {
      if (sharedPreference.getUserId() != null &&
          sharedPreference.getUserId() != "") {
        // user is logged in so redirect to HomeScreen
        Get.off(const HomeScreen());
      } else {
        // user is not logged in so redirect to LoginScreen
        Get.off(LoginScreen());
      }
    });
  }
}
