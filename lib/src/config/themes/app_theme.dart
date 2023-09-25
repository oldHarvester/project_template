import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: AppColors.black,
          ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
            AppColors.black.withOpacity(0.03),
          ),
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.zero,
          ),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
        ),
      ),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
