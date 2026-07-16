import 'package:flutter/material.dart';
import 'package:sightsense_ai/screens/home/home_screen.dart';
import 'package:sightsense_ai/screens/settings/settings_screen.dart';
import 'package:sightsense_ai/screens/splash/splash_screen.dart';

/// Centralized route names and navigation configuration for SightSense AI.
///
/// Wire [generateRoute] into [MaterialApp.onGenerateRoute] and navigate using
/// the route name constants to keep routing logic in a single, scalable place.
class AppRoutes {
  AppRoutes._();

  /// Application entry route — splash screen.
  static const String splash = '/';

  /// Main home screen.
  static const String home = '/home';

  /// Application settings screen.
  static const String settings = '/settings';

  /// Builds a [MaterialPageRoute] for the requested [settings.name].
  ///
  /// Recognized routes resolve to their corresponding screen. Any unknown route
  /// falls back to [HomeScreen] to prevent dead-end navigation.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case AppRoutes.settings:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
