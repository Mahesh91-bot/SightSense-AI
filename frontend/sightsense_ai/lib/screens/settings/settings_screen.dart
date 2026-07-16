import 'package:flutter/material.dart';
import 'package:sightsense_ai/core/constants.dart';

/// Settings hub for SightSense AI.
///
/// Presents grouped configuration options for voice, AI, accessibility,
/// and app information. Navigation to detail screens is wired separately.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String _title = 'Settings';
  static const String _subtitle = 'Manage your SightSense AI experience.';

  static const List<_SettingsTileData> _settingsTiles = [
    _SettingsTileData(
      icon: Icons.record_voice_over_outlined,
      title: 'Voice Settings',
      subtitle: 'Configure speech and voice preferences.',
    ),
    _SettingsTileData(
      icon: Icons.psychology_outlined,
      title: 'AI Settings',
      subtitle: 'Manage AI behaviour and intelligence.',
    ),
    _SettingsTileData(
      icon: Icons.accessibility_new_outlined,
      title: 'Accessibility',
      subtitle: 'Adjust accessibility features.',
    ),
    _SettingsTileData(
      icon: Icons.info_outline,
      title: 'About',
      subtitle: 'Application version and information.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: ListView(
            children: [
              Text(
                _title,
                style: textTheme.headlineLarge,
              ),
              const SizedBox(height: AppConstants.smallPadding),
              Text(
                _subtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppConstants.largePadding),
              ..._buildSettingsTiles(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the settings card list with consistent vertical spacing.
  List<Widget> _buildSettingsTiles() {
    return [
      for (var i = 0; i < _settingsTiles.length; i++) ...[
        if (i > 0) const SizedBox(height: AppConstants.defaultPadding),
        _SettingsTileCard(data: _settingsTiles[i]),
      ],
    ];
  }
}

/// Data model for a single settings entry.
class _SettingsTileData {
  const _SettingsTileData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}

/// Material 3 card with a [ListTile] for each settings option.
class _SettingsTileCard extends StatelessWidget {
  const _SettingsTileCard({required this.data});

  final _SettingsTileData data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.smallPadding,
        ),
        leading: Icon(
          data.icon,
          size: AppConstants.largePadding,
          color: colorScheme.primary,
        ),
        title: Text(
          data.title,
          style: textTheme.titleMedium,
        ),
        subtitle: Text(
          data.subtitle,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
