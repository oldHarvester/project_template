import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/utils/constants/supported_languages.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/app_theme.dart';

import 'src/utils/app_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await preCacheListOfPictures();

  await requestPermissions();

  runApp(
    EasyLocalization(
      supportedLocales: Language.locales,
      path: Language.localesPath,
      fallbackLocale: Language.initialLocale,
      child: const ProviderScope(
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.dark,
      routerDelegate: appRouter.routerDelegate,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
