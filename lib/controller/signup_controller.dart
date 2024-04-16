import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../network/api_services.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import '../utils/urls.dart';
import '../utils/utils.dart';
import '../views/home_screen.dart';

// This controller is used for signup screen
class SignupController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final NetworkRequest networkRequest = NetworkRequest();
  final SharedPreference sharedPreference = SharedPreference();

  // this function is used for call registration/signup api
  Future signupApi() async {
    if (formKey.currentState!.validate()) {
      Map data = {
        "full_name": fullNameController.text.trim(),
        "email_id": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      showLoader();
      var response = await networkRequest.postRequest(
        endpoint: signUpUrl,
        body: data,
      );
      dismissLoader();

      if (response != null) {
        UserModel signupData = UserModel.fromJson(response);
        if (signupData.status == apiSuccess && signupData.data != null) {
          storeDataInSharedPref(signupData);
          Get.offAll(const HomeScreen());
        } else {
          showToast(signupData.message);
        }
      }
    }
  }

  // this function is used for store data in shared preference
  void storeDataInSharedPref(UserModel signupData) {
    sharedPreference.setUserId(signupData.data?.id);
    sharedPreference.setUserName(signupData.data?.fullName);
    sharedPreference.setEmail(signupData.data?.emailId);
  }
}
