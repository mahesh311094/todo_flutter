import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/shared_preference.dart';
import '../views/login_screen.dart';

// This controller is used for profile screen
class ProfileController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final SharedPreference sharedPreference = SharedPreference();

  // this function is used for show user detail
  void setDetail() {
    fullNameController.text = sharedPreference.getUserName() ?? "";
    emailController.text = sharedPreference.getEmail() ?? "";
  }

  // this function is used for logout
  void logout() {
    sharedPreference.logout();
    Get.offAll(LoginScreen());
  }
}
