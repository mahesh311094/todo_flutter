import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../utils/strings.dart';
import '../utils/text_styles.dart';
import 'signup_screen.dart';
import 'widgets/edit_text.dart';
import 'widgets/primary_button.dart';
import 'widgets/top_view_widget.dart';

// this is login screen
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopViewWidget(text: login, isBack: false),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EditText(
                      hint: email,
                      controller: controller.emailController,
                      prefixIcon: Icons.email,
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    EditText(
                      hint: password,
                      controller: controller.passwordController,
                      prefixIcon: Icons.lock,
                      maxLength: 15,
                      isPassword: true,
                    ),
                    const SizedBox(height: 24.0),
                    GestureDetector(
                      onTap: () {
                        // Get.to( ForgotPassword());
                      },
                      child: const Text(
                        forgotPass,
                        style: bodyLargePrimary,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    PrimaryButton(
                      login,
                      onPressed: controller.loginApi,
                    ),
                    const SizedBox(height: 32.0),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupScreen());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(doNotHaveAccount, style: bodyLargeGrey),
                          SizedBox(width: 8.0),
                          Text(signup, style: bodyLargeBoldPrimary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
