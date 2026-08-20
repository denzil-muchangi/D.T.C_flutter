import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_text_changer/core/theme/app_theme.dart';
import 'package:dynamic_text_changer/features/settings/presentation/providers/settings_provider.dart';
import 'package:dynamic_text_changer/features/splash/presentation/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Dynamic Text Changer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.themeMode,
          home: const SplashPage(),
        );
      },
    );
  }
}
