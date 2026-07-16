import 'package:flutter/material.dart';
import 'package:sightsense_ai/core/constants.dart';
import 'package:sightsense_ai/core/routes.dart';
import 'package:sightsense_ai/core/theme.dart';

/// Root widget for the SightSense AI application.
///
/// Configures [MaterialApp] with theming, routing, and system appearance
/// support. Feature logic and screen implementations live outside this file.
class SightSenseApp extends StatelessWidget {
  const SightSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
