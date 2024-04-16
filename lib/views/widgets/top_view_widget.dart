import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles.dart';

// this class is used for show top bar view
class TopViewWidget extends StatelessWidget {
  final String text;
  final bool isBack;

  const TopViewWidget({this.text = appName, this.isBack = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3.30,
      width: Get.width,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            isBack
                ? GestureDetector(
                    onTap: Get.back,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      child: Image.asset(
                        "assets/images/left.png",
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  )
                : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/logo-small.png",
                  width: 100.0,
                  height: 100.0,
                ),
                const SizedBox(height: 4.0),
                Text(text, style: headingWhite, textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
