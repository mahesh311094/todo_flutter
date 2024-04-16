import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

// this class is used when there is no task found
class EmptyWidget extends StatelessWidget {
  final String msg;
  final IconData? icon;

  const EmptyWidget({required this.msg, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Icon(icon, color: greyColor, size: 125),
              const SizedBox(height: 8),
              Text(msg, style: heading),
            ],
          ),
        ),
      ],
    );
  }
}
