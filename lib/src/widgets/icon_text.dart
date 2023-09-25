import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/themes/app_styles.dart';
import 'sized_box.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.iconPath,
    required this.text,
    this.iconColor,
    this.iconSize,
  });

  final String iconPath;
  final String text;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          height: iconSize,
          width: iconSize,
          colorFilter: iconColor == null
              ? null
              : ColorFilter.mode(
                  iconColor!,
                  BlendMode.srcIn,
                ),
        ),
        const WBox(4.0),
        Text(
          text,
          style: AppStyles.s16w400.copyWith(
            height: 24 / 16,
          ),
        ),
      ],
    );
  }
}
