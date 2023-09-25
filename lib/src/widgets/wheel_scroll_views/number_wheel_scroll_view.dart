import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_styles.dart';

class NumberWheelScollView extends HookWidget {
  const NumberWheelScollView({
    super.key,
    this.activeBoxColor = AppColors.black,
    this.minNumber = 0,
    this.maxNumber = 1,
    this.onSelectedFormat,
    this.onSelectedItemChanged,
    this.activeTextStyle,
    this.inActiveTextStyle,
    this.controller,
    this.formatIndexAs,
    this.unAvailableTextStyle,
    this.unAvailableNumbers,
  }) : assert(minNumber < maxNumber);

  final FixedExtentScrollController? controller;
  final int minNumber;
  final int maxNumber;
  final Color activeBoxColor;
  final TextStyle? activeTextStyle;
  final TextStyle? inActiveTextStyle;
  final TextStyle? unAvailableTextStyle;
  final List<int>? unAvailableNumbers;
  final String Function(int index)? onSelectedFormat;
  final String Function(int index)? formatIndexAs;
  final void Function(int index, int number)? onSelectedItemChanged;

  TextStyle _defineStyle(int selectedIndex, int index, int actualNumber) {
    if (unAvailableNumbers != null && unAvailableNumbers!.contains(actualNumber)) {
      return unAvailableTextStyle ??
          AppStyles.s18w500.copyWith(
            color: AppColors.black.withOpacity(0.1),
            height: 24 / 18,
          );
    }
    if (selectedIndex == index) {
      return activeTextStyle ??
          AppStyles.s18w500.copyWith(
            color: AppColors.black,
            height: 24 / 18,
          );
    } else {
      return inActiveTextStyle ??
          AppStyles.s18w500.copyWith(
            color: AppColors.black.withOpacity(0.5),
            height: 24 / 18,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedItemIndex = useState(controller != null ? controller!.initialItem : 0);
    return ListWheelScrollView.useDelegate(
      physics: const FixedExtentScrollPhysics(),
      controller: controller,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: List.generate(
          maxNumber - minNumber + 1,
          (index) {
            final actualNumber = index + minNumber;
            return Align(
              child: Text(
                index == selectedItemIndex.value && onSelectedFormat != null
                    ? onSelectedFormat!(actualNumber)
                    : formatIndexAs != null
                        ? formatIndexAs!(actualNumber)
                        : actualNumber.toString(),
                style: _defineStyle(
                  selectedItemIndex.value,
                  index,
                  actualNumber,
                ),
              ),
            );
          },
        ),
      ),
      itemExtent: 30,
      diameterRatio: 1,
      onSelectedItemChanged: (index) {
        final actualNumber = index + minNumber;
        if (selectedItemIndex.value != index) {
          selectedItemIndex.value = index;
        }
        if (onSelectedItemChanged != null) {
          onSelectedItemChanged!(index, actualNumber);
        }
      },
    );
  }
}
