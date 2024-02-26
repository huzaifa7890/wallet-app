import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walletapp/constant/routes.dart';
import 'package:walletapp/core/isar.dart';
import 'package:walletapp/core/language_repo.dart';
import 'package:walletapp/core/language.dart';
import 'package:walletapp/core/theme_data.dart';
import 'package:walletapp/firebase_options.dart';
import 'package:walletapp/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final router = AppRoutes().router;
  final isar = await isarInitialize();
  final container = ProviderContainer();
  final language =
      await container.read(languageRepositoryProvider).getLanguage();
  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
        languageProvider.overrideWith((ref) => language),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final router;

  const MyApp({super.key, this.router});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final language = ref.watch(languageProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeMode == ThemeMode.light
              ? AppTheme.lightTheme
              : AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ref.read(themeModeProvider),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(language.code),
          routerConfig: router,
        );
      },
    );
  }
}
