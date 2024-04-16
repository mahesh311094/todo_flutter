import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// this class is used for TextInput in whole app
// prefixIcon is optional
// passwordController is used for match with confirm password only

class EditText extends StatelessWidget {
  final String hint;
  final int maxLength;
  final bool isPassword;
  final bool isEnabled;
  final bool isRequired;
  final IconData? prefixIcon;
  final TextInputType inputType;
  final TextEditingController controller;
  final TextEditingController? passwordController;

  const EditText({
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.passwordController,
    this.maxLength = 25,
    this.isPassword = false,
    this.isEnabled = true,
    this.isRequired = true,
    this.inputType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      obscureText: isPassword,
      maxLength: maxLength,
      keyboardType: inputType,
      enabled: isEnabled,
      validator: !isRequired
          ? null
          : (text) {
              if (text == null || text.isEmpty) {
                return 'This field is required';
              } else if (passwordController != null &&
                  text != passwordController!.text) {
                return 'Password Mismatch';
              }
              return null;
            },
      decoration: InputDecoration(
        labelText: hint,
        counterText: "",
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: primaryColor) : null,
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : primaryColor;
            return TextStyle(
              color: color,
              letterSpacing: 1.3,
            );
          },
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
