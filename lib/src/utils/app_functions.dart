import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/themes/app_colors.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = false,
}) async {
  return showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: barrierDismissible,
    barrierColor: AppColors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => const SizedBox(),
    transitionBuilder: (context, animation, secondaryAnimation, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.7, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  );
}

Future<T?> showAppModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool enableRadius = true,
  bool expand = false,
}) {
  return showCupertinoModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shadow: BoxShadow(
      blurRadius: 3,
      color: AppColors.black.withOpacity(0.75),
      offset: const Offset(0, -2),
    ),
    expand: expand,
    backgroundColor: AppColors.white,
    barrierColor: AppColors.black.withOpacity(0.5),
    topRadius: enableRadius ? const Radius.circular(25.0) : Radius.zero,
    builder: (context) {
      return child;
    },
  );
}

Future precacheSvgPicture(String svgPath) async {
  final logo = SvgAssetLoader(svgPath);
  await svg.cache.putIfAbsent(logo.cacheKey(null), () => logo.loadBytes(null));
}

Future preCacheListOfPictures() {
  return Future.wait([]);
}

Future<void> requestPermissions() async {
  if (!await Permission.location.isGranted) {
    Permission.location.request();
  } else if (!await Permission.camera.isGranted) {
    Permission.camera.request();
  }
}
