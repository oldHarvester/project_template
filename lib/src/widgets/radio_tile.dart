import 'package:flutter/material.dart';

import '../config/themes/app_colors.dart';
import '../config/themes/app_styles.dart';
import 'sized_box.dart';

class RadioTile extends StatelessWidget {
  const RadioTile({
    super.key,
    required this.title,
    this.isActive = false,
    this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.grey,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.s18w400.copyWith(
                    color: isActive ? AppColors.black : AppColors.black.withOpacity(0.5),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const WBox(16.0),
              Radio(
                value: isActive,
                onChanged: null,
                groupValue: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
