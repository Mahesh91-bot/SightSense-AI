import 'package:flutter/material.dart';
import 'package:sightsense_ai/core/constants.dart';

/// Material 3 theme configuration for SightSense AI.
///
/// Exposes [lightTheme] and [darkTheme] with shared rounding, typography,
/// and component styling. Colors live here; spacing and app metadata live in
/// [AppConstants].
class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------------
  // Design tokens
  // ---------------------------------------------------------------------------

  static const BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(AppConstants.defaultRadius),
  );

  static const BorderRadius _cardBorderRadius = BorderRadius.all(
    Radius.circular(AppConstants.largeRadius),
  );

  static const EdgeInsets _buttonPadding = EdgeInsets.symmetric(
    horizontal: AppConstants.defaultPadding,
    vertical: AppConstants.buttonVerticalPadding,
  );

  static const EdgeInsets _inputContentPadding = EdgeInsets.symmetric(
    horizontal: AppConstants.defaultPadding,
    vertical: AppConstants.inputVerticalPadding,
  );

  static final RoundedRectangleBorder _componentShape =
      RoundedRectangleBorder(borderRadius: _borderRadius);

  static final RoundedRectangleBorder _cardShape =
      RoundedRectangleBorder(borderRadius: _cardBorderRadius);

  static const Color _primary = Colors.indigo;
  static const Color _secondary = Colors.cyan;
  static const Color _lightScaffoldBackground = Colors.white;
  static const Color _lightCardShadow = Color(0x14000000);

  static const FontWeight _headingWeight = FontWeight.w600;

  // ---------------------------------------------------------------------------
  // Public themes
  // ---------------------------------------------------------------------------

  /// Light theme with an indigo primary, cyan secondary, and white scaffold.
  static ThemeData get lightTheme => _buildTheme(Brightness.light);

  /// Dark theme with Material 3 surfaces and matching rounded components.
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  // ---------------------------------------------------------------------------
  // Theme assembly
  // ---------------------------------------------------------------------------

  static ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = _colorScheme(brightness);
    final isLight = brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isLight ? _lightScaffoldBackground : colorScheme.surface,
      textTheme: _textTheme(colorScheme, brightness),
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme, isLight),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme, isLight),
      filledButtonTheme: _filledButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );
  }

  static ColorScheme _colorScheme(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: _primary,
      secondary: _secondary,
      brightness: brightness,
    );

    if (brightness == Brightness.light) {
      return scheme.copyWith(surface: _lightScaffoldBackground);
    }

    return scheme;
  }

  static TextTheme _textTheme(ColorScheme colorScheme, Brightness brightness) {
    final typography = Typography.material2021();
    final base = brightness == Brightness.light
        ? typography.black
        : typography.white;

    TextStyle? semiBold(TextStyle? style) =>
        style?.copyWith(fontWeight: _headingWeight);

    return base
        .apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        )
        .copyWith(
          headlineLarge: semiBold(base.headlineLarge)?.copyWith(
            letterSpacing: -0.5,
          ),
          headlineMedium: semiBold(base.headlineMedium),
          headlineSmall: semiBold(base.headlineSmall),
          titleLarge: semiBold(base.titleLarge),
          titleMedium: semiBold(base.titleMedium),
          titleSmall: semiBold(base.titleSmall),
          labelLarge: semiBold(base.labelLarge)?.copyWith(
            letterSpacing: 0.1,
          ),
        );
  }

  static AppBarThemeData _appBarTheme(ColorScheme colorScheme) {
    return AppBarThemeData(
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: colorScheme.surfaceTint,
      titleTextStyle: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 20,
        fontWeight: _headingWeight,
        letterSpacing: 0.15,
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
    );
  }

  static CardThemeData _cardTheme(ColorScheme colorScheme, bool isLight) {
    return CardThemeData(
      elevation: isLight ? 2 : 1,
      shadowColor: isLight ? _lightCardShadow : Colors.black54,
      surfaceTintColor: colorScheme.surfaceTint,
      color: colorScheme.surfaceContainerLow,
      shape: _cardShape,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
    );
  }

  static ButtonStyle _baseButtonStyle() {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(_componentShape),
      padding: const WidgetStatePropertyAll(_buttonPadding),
      minimumSize: const WidgetStatePropertyAll(Size(64, 48)),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontWeight: _headingWeight, letterSpacing: 0.1),
      ),
    );
  }

  static Color _disabledBackground(ColorScheme colorScheme) =>
      colorScheme.onSurface.withValues(alpha: 0.12);

  static Color _disabledForeground(ColorScheme colorScheme) =>
      colorScheme.onSurface.withValues(alpha: 0.38);

  static ButtonStyle _primaryButtonStyle(ColorScheme colorScheme) {
    return _baseButtonStyle().copyWith(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _disabledBackground(colorScheme);
        }
        return colorScheme.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _disabledForeground(colorScheme);
        }
        return colorScheme.onPrimary;
      }),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(
    ColorScheme colorScheme,
    bool isLight,
  ) {
    return ElevatedButtonThemeData(
      style: _primaryButtonStyle(colorScheme).copyWith(
        elevation: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return 0;
          if (states.contains(WidgetState.pressed)) {
            return isLight ? 1 : 0;
          }
          return isLight ? 2 : 0;
        }),
        shadowColor: WidgetStatePropertyAll(
          isLight ? _lightCardShadow : Colors.transparent,
        ),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: _primaryButtonStyle(colorScheme),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style: _baseButtonStyle().copyWith(
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: _disabledBackground(colorScheme));
          }
          if (states.contains(WidgetState.pressed)) {
            return BorderSide(color: colorScheme.primary, width: 1.5);
          }
          return BorderSide(color: colorScheme.outline);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return _disabledForeground(colorScheme);
          }
          return colorScheme.primary;
        }),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(
    Color color, {
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
      contentPadding: _inputContentPadding,
      border: _inputBorder(colorScheme.outline),
      enabledBorder: _inputBorder(colorScheme.outline),
      focusedBorder: _inputBorder(colorScheme.primary, width: 2),
      errorBorder: _inputBorder(colorScheme.error),
      focusedErrorBorder: _inputBorder(colorScheme.error, width: 2),
      disabledBorder: _inputBorder(_disabledBackground(colorScheme)),
      hintStyle: TextStyle(
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
      ),
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      floatingLabelStyle: TextStyle(color: colorScheme.primary),
    );
  }
}
