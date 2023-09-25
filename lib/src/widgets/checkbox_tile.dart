import 'package:flutter/material.dart';

import '../config/themes/app_colors.dart';
import '../config/themes/app_styles.dart';
import 'sized_box.dart';

class CheckboxTile extends StatelessWidget {
  const CheckboxTile({
    super.key,
    required this.title,
    this.isChecked = false,
    this.onTap,
  });

  final String title;
  final bool isChecked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: AppColors.black.withOpacity(0.5),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.s18w400.copyWith(
                    color: isChecked ? AppColors.black : AppColors.black.withOpacity(0.5),
                  ),
                ),
              ),
              const WBox(16.0),
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                value: isChecked,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
