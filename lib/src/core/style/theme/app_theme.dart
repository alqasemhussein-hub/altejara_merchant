import 'package:flutter/material.dart';

class AppTheme {
  // Custom extended colors

  // Light Theme
  static ThemeData get lightTheme {
    final lightColorScheme = ColorScheme.fromSeed(seedColor: Color(0xff325b90));

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