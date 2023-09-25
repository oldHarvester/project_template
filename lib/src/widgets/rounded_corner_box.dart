import 'package:flutter/material.dart';

import '../config/themes/app_colors.dart';

enum RoundedCornerType {
  all,
  top,
  bottom,
  left,
  right,
}

BorderRadiusGeometry defineBorderRadius(RoundedCornerType type) {
  switch (type) {
    case RoundedCornerType.top:
      return const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      );
    case RoundedCornerType.bottom:
      return const BorderRadius.only(
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      );
    case RoundedCornerType.left:
      return const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        bottomLeft: Radius.circular(16.0),
      );
    case RoundedCornerType.right:
      return const BorderRadius.only(
        topRight: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      );
    default:
      return BorderRadius.circular(16.0);
  }
}

class RoundedCornerBox extends StatelessWidget {
  const RoundedCornerBox({
    super.key,
    this.type = RoundedCornerType.all,
    this.alignment,
    this.padding,
    this.height,
    this.width,
    this.margin,
    this.child,
    this.isAnimated = false,
    this.duration,
    this.curve,
    this.color,
  });

  final RoundedCornerType type;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Widget? child;
  final bool isAnimated;
  final Duration? duration;
  final Curve? curve;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return !isAnimated
        ? Container(
            margin: margin,
            padding: padding,
            alignment: alignment,
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color ?? AppColors.white,
              borderRadius: defineBorderRadius(type),
            ),
            child: child,
          )
        : AnimatedContainer(
            duration: duration ?? const Duration(),
            curve: curve ?? Curves.ease,
            margin: margin,
            padding: padding,
            alignment: alignment,
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: defineBorderRadius(type),
            ),
            child: child,
          );
  }
}
