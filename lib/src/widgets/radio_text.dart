import 'package:flutter/material.dart';

import '../config/themes/app_colors.dart';
import '../config/themes/app_styles.dart';
import 'sized_box.dart';

class RadioText extends StatelessWidget {
  const RadioText({
    super.key,
    required this.isActive,
    required this.text,
    this.onTap,
  });

  final bool isActive;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: isActive,
            groupValue: true,
            onChanged: null,
          ),
          const WBox(16.0),
          Text(
            text,
            style: AppStyles.s18w400.copyWith(
              color: isActive ? AppColors.black : AppColors.black.withOpacity(0.5),
              height: 24 / 18,
            ),
          ),
        ],
      ),
    );
  }
}
