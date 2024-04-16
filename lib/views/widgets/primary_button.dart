import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

// this class is for all button used in app
class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double paddingHorizontal;
  final double paddingVertical;

  const PrimaryButton(
    this.buttonText, {
    this.textColor = whiteColor,
    this.buttonColor = primaryColor,
    this.paddingHorizontal = 16.0,
    this.paddingVertical = 16.0,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      color: buttonColor,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style:
            textColor == whiteColor ? bodyLargeBoldWhite : bodyLargeBoldPrimary,
      ),
    );
  }
}
