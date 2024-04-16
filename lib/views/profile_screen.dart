import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';
import '../utils/strings.dart';
import 'widgets/edit_text.dart';
import 'widgets/primary_button.dart';
import 'widgets/top_view_widget.dart';

// this is profile screen
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    controller.setDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const TopViewWidget(text: profile),
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
                      isEnabled: false,
                    ),
                    const SizedBox(height: 16.0),
                    EditText(
                      hint: email,
                      controller: controller.emailController,
                      prefixIcon: Icons.mail,
                      isEnabled: false,
                    ),
                    const SizedBox(height: 32.0),
                    PrimaryButton(
                      logout,
                      onPressed: controller.logout,
                    ),
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
