import 'package:flutter/material.dart';
import 'package:sightsense_ai/core/constants.dart';

/// Home dashboard for SightSense AI.
///
/// Presents a scrollable mission control hub with quick access to core features.
/// Card navigation is wired separately.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String _greeting = 'Welcome';
  static const String _sectionTitle = 'Mission Control';

  static const List<_DashboardCardData> _missionCards = [
    _DashboardCardData(
      icon: Icons.flag_outlined,
      title: 'Start Mission',
      subtitle: 'Begin a new AI-assisted mission.',
    ),
    _DashboardCardData(
      icon: Icons.camera_alt_outlined,
      title: 'Scan Surroundings',
      subtitle: 'Analyze the current environment.',
    ),
    _DashboardCardData(
      icon: Icons.memory_outlined,
      title: 'Memory',
      subtitle: 'Recall saved places and objects.',
    ),
    _DashboardCardData(
      icon: Icons.navigation_outlined,
      title: 'Navigation',
      subtitle: 'Get guided directions.',
    ),
    _DashboardCardData(
      icon: Icons.warning_amber_outlined,
      title: 'Emergency',
      subtitle: 'Quick access to emergency features.',
    ),
    _DashboardCardData(
      icon: Icons.settings_outlined,
      title: 'Settings',
      subtitle: 'Configure the application.',
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
                _greeting,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppConstants.smallPadding),
              Text(
                AppConstants.appName,
                style: textTheme.headlineLarge,
              ),
              const SizedBox(height: AppConstants.smallPadding),
              Text(
                AppConstants.tagline,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppConstants.largePadding),
              Text(
                _sectionTitle,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              ..._buildMissionCards(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the mission control card list with consistent vertical spacing.
  List<Widget> _buildMissionCards() {
    return [
      for (var i = 0; i < _missionCards.length; i++) ...[
        if (i > 0) const SizedBox(height: AppConstants.defaultPadding),
        _DashboardCard(data: _missionCards[i]),
      ],
    ];
  }
}

/// Data model for a single dashboard card entry.
class _DashboardCardData {
  const _DashboardCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}

/// Material 3 card with a [ListTile] for each mission control action.
class _DashboardCard extends StatelessWidget {
  const _DashboardCard({required this.data});

  final _DashboardCardData data;

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
