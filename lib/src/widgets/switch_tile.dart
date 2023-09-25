import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/themes/app_colors.dart';
import '../config/themes/app_styles.dart';
import 'sized_box.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.isTurnOn,
    required this.title,
    this.usehighlightColor = true,
    this.onTap,
    this.padding,
  });
  final String title;
  final bool isTurnOn;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final bool usehighlightColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: usehighlightColor ? Colors.grey : Colors.transparent,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.s18w400.copyWith(
                    color: isTurnOn ? AppColors.black : AppColors.black.withOpacity(0.5),
                  ),
                ),
              ),
              const WBox(8.0),
              CupertinoSwitch(
                value: isTurnOn,
                activeColor: AppColors.black,
                onChanged: (value) {
                  if (onTap != null) onTap!();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
