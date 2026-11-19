import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Tema claro equivalente a `LightColorScheme` de Android (con `primary = DeepLime`).
class AppTheme {
  AppTheme._();

  // En Compose un `Text` sin estilo usa bodyLarge (16sp, interlineado 24sp, tracking 0.5).
  static const TextStyle _body = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  static ThemeData get light {
    const scheme = ColorScheme.light(
      primary: AppColors.deepLime,
      onPrimary: Colors.white,
      secondary: AppColors.deepLime,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.ink,
      onSurfaceVariant: AppColors.graySecondary,
      outline: AppColors.border,
      error: Color(0xFFB3261E),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.paper,
      canvasColor: AppColors.paper,
      textTheme: const TextTheme(bodyLarge: _body, bodyMedium: _body),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFF3EDF7),
        indicatorColor: AppColors.electricLime,
        height: 80,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.ink
                : AppColors.graySecondary,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            fontSize: 12,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? AppColors.ink
                : AppColors.graySecondary,
          ),
        ),
      ),
    );
  }
}
