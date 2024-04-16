import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signup_controller.dart';
import '../utils/strings.dart';
import '../utils/text_styles.dart';
import 'widgets/edit_text.dart';
import 'widgets/primary_button.dart';
import 'widgets/top_view_widget.dart';

// this is Signup/Registration screen
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const TopViewWidget(text: signup),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EditText(
                      hint: fullName,
                      controller: controller.fullNameController,
                      prefixIcon: Icons.account_circle,
                    ),
                    const SizedBox(height: 16.0),
                    EditText(
                      hint: email,
                      controller: controller.emailController,
                      prefixIcon: Icons.mail,
                    ),
                    const SizedBox(height: 16.0),
                    EditText(
                      hint: password,
                      controller: controller.passwordController,
                      maxLength: 15,
                      isPassword: true,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 16.0),
                    EditText(
                      hint: confirmPassword,
                      controller: controller.cnfPasswordController,
                      passwordController: controller.passwordController,
                      maxLength: 15,
                      isPassword: true,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 32.0),
                    PrimaryButton(
                      signup,
                      onPressed: controller.signupApi,
                    ),
                    const SizedBox(height: 32.0),
                    GestureDetector(
                      onTap: Get.back,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(alreadyAccount, style: bodyLargeGrey),
                          SizedBox(width: 5.0),
                          Text(login, style: bodyLargeBoldPrimary),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
