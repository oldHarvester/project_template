import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_styles.dart';

class TextWheelScrollView extends HookWidget {
  const TextWheelScrollView({
    super.key,
    required this.items,
    this.controller,
    this.onSelectedItemChanged,
  });

  final List<String> items;
  final FixedExtentScrollController? controller;
  final void Function(int index)? onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(controller != null ? controller!.initialItem : 0);

    return ListWheelScrollView(
      physics: const FixedExtentScrollPhysics(),
      controller: controller,
      itemExtent: 24,
      diameterRatio: 1,
      onSelectedItemChanged: (index) {
        selectedIndex.value = index;
        if (onSelectedItemChanged != null) {
          onSelectedItemChanged!(index);
        }
      },
      children: List.generate(
        items.length,
        (index) {
          return Text(
            items[index],
            style: AppStyles.s18w500.copyWith(
              color: index == selectedIndex.value ? AppColors.black : AppColors.black,
            ),
          );
        },
      ),
    );
  }
}
