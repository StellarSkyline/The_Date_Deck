import "dart:ui";

import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF4E81EE),
      surfaceTint: Color(0xffffb2b8),
      onPrimary: Color(0xff561d25),
      primaryContainer: Color(0xff72333a),
      onPrimaryContainer: Color(0xffffdadb),
      secondary: Color(0xffd1bcfd),
      onSecondary: Color(0xff37265c),
      secondaryContainer: Color(0xff4e3d75),
      onSecondaryContainer: Color(0xffeaddff),
      tertiary: Color(0xffeebf6d),
      onTertiary: Color(0xff422d00),
      tertiaryContainer: Color(0xff5e4200),
      onTertiaryContainer: Color(0xffffdea9),
      error: Colors.red,
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Colors.transparent,
      onSurface: Color(0xFF949AA6),
      onSurfaceVariant: Color(0xFF949AA6),
      outline: Color(0xFF4E81EE),
      outlineVariant: Color(0xFF4E81EE),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff8f4a51),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff3b0711),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff72333a),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff220f46),
      secondaryFixedDim: Color(0xffd1bcfd),
      onSecondaryFixedVariant: Color(0xff4e3d75),
      tertiaryFixed: Color(0xffffdea9),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffeebf6d),
      onTertiaryFixedVariant: Color(0xff5e4200),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff413737),
      surfaceContainerLowest: Color(0xff140c0d),
      surfaceContainerLow: Color(0xff22191a),
      //Hijacked
      surfaceContainer: Color(0xFFFFFFFF),
      //Hijacking for suite color changes for dark mode
      surfaceContainerHigh: Color(0xFF000000),
      surfaceContainerHighest: Color(0xFFE06F7C),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];

  static ColorScheme get colors {
    return darkScheme();
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({required this.color, required this.onColor, required this.colorContainer, required this.onColorContainer});

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
