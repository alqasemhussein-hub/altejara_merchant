import 'package:flutter/material.dart';

class AppTheme {
  // Custom extended colors
  static const Color customColor1 = Color(0xFFC6FD6C);
  static const Color customColor2 = Color(0xFFD83E6B);
  static const Color customColor3 = Color(0xFF2E7464);
  static const Color customColor4 = Color(0xFFEB8242);
  static const Color customColor5 = Color(0xFFB110C3);
  static const Color customColor6 = Color(0xFF4F9A70);
  static const Color customColor7 = Color(0xFF5B4BEE);
  static const Color whiteColor = Color(0xFFFFF8F7);

  // Light Theme
  static ThemeData get lightTheme {
    const lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffb41c1b),
      surfaceTint: Color(0xffb81f1e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd83831),
      onPrimaryContainer: Color(0xfffffbff),
      secondary: Color(0xff004e5c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00687a),
      onSecondaryContainer: Color(0xff98e4f9),
      tertiary: Color(0xff785a00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff9c22e),
      onTertiaryContainer: Color(0xff6c5100),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff271816),
      onSurfaceVariant: Color(0xff5b403d),
      outline: Color(0xff8f706c),
      outlineVariant: Color(0xffe3beb9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3e2c2a),
      inversePrimary: Color(0xffffb4ab),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff410002),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff93000a),
      secondaryFixed: Color(0xffabedff),
      onSecondaryFixed: Color(0xff001f26),
      secondaryFixedDim: Color(0xff86d2e6),
      onSecondaryFixedVariant: Color(0xff004e5c),
      tertiaryFixed: Color(0xffffdf9a),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xfff5bf2a),
      onTertiaryFixedVariant: Color(0xff5a4300),
      surfaceDim: Color(0xfff0d4d0),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xffffe9e6),
      surfaceContainerHigh: Color(0xffffe2de),
      surfaceContainerHighest: Color(0xfff9dcd8),
    );

    return _getThemeData(lightColorScheme);
  }

  static ThemeData _getThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: "Somar",
      appBarTheme: AppBarTheme(backgroundColor: colorScheme.surfaceContainer),
      searchBarTheme: const SearchBarThemeData(
        elevation: WidgetStatePropertyAll(0),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerHighest,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: colorScheme.onSurface);
          }
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colorScheme.onSecondaryContainer);
          }
          return IconThemeData(color: colorScheme.onSurfaceVariant);
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // textTheme: getTextTheme(colorScheme),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    const darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4ab),
      surfaceTint: Color(0xffffb4ab),
      onPrimary: Color(0xff690005),
      primaryContainer: Color(0xffff5449),
      onPrimaryContainer: Color(0xff5c0004),
      secondary: Color(0xff86d2e6),
      onSecondary: Color(0xff003640),
      secondaryContainer: Color(0xff00687a),
      onSecondaryContainer: Color(0xff98e4f9),
      tertiary: Color(0xffffe3a9),
      onTertiary: Color(0xff3f2e00),
      tertiaryContainer: Color(0xfff9c22e),
      onTertiaryContainer: Color(0xff6c5100),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1e100e),
      onSurface: Color(0xfff9dcd8),
      onSurfaceVariant: Color(0xffe3beb9),
      outline: Color(0xffaa8985),
      outlineVariant: Color(0xff5b403d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff9dcd8),
      inversePrimary: Color(0xffb81f1e),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff410002),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff93000a),
      secondaryFixed: Color(0xffabedff),
      onSecondaryFixed: Color(0xff001f26),
      secondaryFixedDim: Color(0xff86d2e6),
      onSecondaryFixedVariant: Color(0xff004e5c),
      tertiaryFixed: Color(0xffffdf9a),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xfff5bf2a),
      onTertiaryFixedVariant: Color(0xff5a4300),
      surfaceDim: Color(0xff1e100e),
      surfaceBright: Color(0xff473533),
      surfaceContainerLowest: Color(0xff180b09),
      surfaceContainerLow: Color(0xff271816),
      surfaceContainer: Color(0xff2b1c1a),
      surfaceContainerHigh: Color(0xff372624),
      surfaceContainerHighest: Color(0xff42302e),
    );

    return _getThemeData(darkColorScheme);
  }

  // Helper method to get theme based on brightness
  static ThemeData getTheme(Brightness brightness) {
    var theme = brightness == Brightness.light ? lightTheme : darkTheme;

    return theme.copyWith(
      textTheme: getTextTheme(theme.colorScheme, theme.textTheme),
    );
  }

  static TextTheme getTextTheme(
    ColorScheme colorScheme,
    TextTheme baseTextTheme,
  ) {
    return baseTextTheme.copyWith(
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

// Extension to access custom colors
extension CustomColors on ColorScheme {
  Color get customColor1 => AppTheme.customColor1;
  Color get customColor2 => AppTheme.customColor2;
  Color get customColor3 => AppTheme.customColor3;
  Color get customColor4 => AppTheme.customColor4;
  Color get customColor5 => AppTheme.customColor5;
  Color get customColor6 => AppTheme.customColor6;
  Color get customColor7 => AppTheme.customColor7;
}

// Usage example:
// 
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material Theme Demo',
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: ThemeMode.system, // Follows system theme
//       home: MyHomePage(),
//     );
//   }
// }
//
// To use custom colors in your widgets:
// Color myCustomColor = Theme.of(context).colorScheme.customColor1;