import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles.dart';
import '../widgets/primary_button.dart';

// this class is used for confirmation dialog
class ConfirmDialog extends StatelessWidget {
  final VoidCallback onConfirmClicked;

  const ConfirmDialog({required this.onConfirmClicked, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(deleteMsg, style: bodyLargeBold),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    onConfirmClicked();
                    Get.back();
                  },
                  child: const Text(yes, style: bodyLargeBoldPrimary),
                ),
                const SizedBox(width: 16),
                PrimaryButton(
                  no,
                  paddingVertical: 8,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
