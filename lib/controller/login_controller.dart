import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../network/api_services.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import '../utils/urls.dart';
import '../utils/utils.dart';
import '../views/home_screen.dart';

// This controller is used for login screen
class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final NetworkRequest networkRequest = NetworkRequest();
  final SharedPreference sharedPreference = SharedPreference();

  // this function is used for call login api
  Future loginApi() async {
    if (formKey.currentState!.validate()) {
      Map data = {
        "email_id": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      showLoader();
      var response = await networkRequest.postRequest(
        endpoint: signInUrl,
        body: data,
      );
      dismissLoader();

      if (response != null) {
        UserModel loginData = UserModel.fromJson(response);
        if (loginData.status == apiSuccess && loginData.data != null) {
          storeDataInSharedPref(loginData);
          Get.offAll(const HomeScreen());
        } else {
          showToast(loginData.message);
        }
      }
    }
  }

  // this function is used for store data in shared preference
  void storeDataInSharedPref(UserModel loginData) {
    sharedPreference.setUserId(loginData.data?.id);
    sharedPreference.setUserName(loginData.data?.fullName);
    sharedPreference.setEmail(loginData.data?.emailId);
  }
}
