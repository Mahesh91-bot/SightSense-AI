import 'package:flutter/material.dart';
import 'package:sightsense_ai/core/constants.dart';

/// Splash screen displayed at app launch before navigation to the home flow.
///
/// Presents SightSense AI branding with accessible typography and spacing.
/// Navigation timing is handled outside this widget.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.visibility_outlined,
                  size: AppConstants.largePadding * 3,
                  color: colorScheme.primary,
                  semanticLabel: 'Accessibility',
                ),
                const SizedBox(height: AppConstants.largePadding),
                Text(
                  AppConstants.appName,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Text(
                  AppConstants.tagline,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
