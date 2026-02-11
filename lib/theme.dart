import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8f4a51),
      surfaceTint: Color(0xff8f4a51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdadb),
      onPrimaryContainer: Color(0xff72333a),
      secondary: Color(0xff67558e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffeaddff),
      onSecondaryContainer: Color(0xff4e3d75),
      tertiary: Color(0xff7b580d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdea9),
      onTertiaryContainer: Color(0xff5e4200),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff22191a),
      onSurfaceVariant: Color(0xff524344),
      outline: Color(0xff857374),
      outlineVariant: Color(0xffd7c1c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb2b8),
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
      surfaceDim: Color(0xffe7d6d6),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xfffceaea),
      surfaceContainerHigh: Color(0xfff6e4e4),
      surfaceContainerHighest: Color(0xfff0dedf),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e222a),
      surfaceTint: Color(0xff8f4a51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa0585f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3d2c63),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff76639e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff493200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8b671c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff170f10),
      onSurfaceVariant: Color(0xff413333),
      outline: Color(0xff5e4f4f),
      outlineVariant: Color(0xff7a696a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb2b8),
      primaryFixed: Color(0xffa0585f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff834048),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff76639e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5d4b84),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8b671c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff704f01),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd3c3c3),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xfff6e4e4),
      surfaceContainerHigh: Color(0xffead9d9),
      surfaceContainerHighest: Color(0xffdfcece),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511921),
      surfaceTint: Color(0xff8f4a51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff75353d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff332258),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff513f77),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3c2900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff614400),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff36292a),
      outlineVariant: Color(0xff554546),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb2b8),
      primaryFixed: Color(0xff75353d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff591f27),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff513f77),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3a285f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff614400),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff452f00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5b5b5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffeded),
      surfaceContainer: Color(0xfff0dedf),
      surfaceContainerHigh: Color(0xffe2d0d1),
      surfaceContainerHighest: Color(0xffd3c3c3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb2b8),
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
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1112),
      onSurface: Color(0xfff0dedf),
      onSurfaceVariant: Color(0xffd7c1c2),
      outline: Color(0xff9f8c8d),
      outlineVariant: Color(0xff524344),
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
      surfaceContainer: Color(0xff271d1e),
      surfaceContainerHigh: Color(0xff312828),
      surfaceContainerHighest: Color(0xff3d3233),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd1d4),
      surfaceTint: Color(0xffffb2b8),
      onPrimary: Color(0xff48121b),
      primaryContainer: Color(0xffca7a82),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe5d6ff),
      onSecondary: Color(0xff2c1b51),
      secondaryContainer: Color(0xff9a87c4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd792),
      onTertiary: Color(0xff342200),
      tertiaryContainer: Color(0xffb38a3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1112),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffedd7d8),
      outline: Color(0xffc2adae),
      outlineVariant: Color(0xff9f8c8c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff74343b),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff2c0008),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff5e222a),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff17033c),
      secondaryFixedDim: Color(0xffd1bcfd),
      onSecondaryFixedVariant: Color(0xff3d2c63),
      tertiaryFixed: Color(0xffffdea9),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffeebf6d),
      onTertiaryFixedVariant: Color(0xff493200),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff4d4242),
      surfaceContainerLowest: Color(0xff0d0606),
      surfaceContainerLow: Color(0xff241b1c),
      surfaceContainer: Color(0xff2f2526),
      surfaceContainerHigh: Color(0xff3a3031),
      surfaceContainerHighest: Color(0xff463b3b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffebec),
      surfaceTint: Color(0xffffb2b8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffadb3),
      onPrimaryContainer: Color(0xff210005),
      secondary: Color(0xfff6ecff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcdb8f9),
      onSecondaryContainer: Color(0xff100031),
      tertiary: Color(0xffffeed6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeabc69),
      onTertiaryContainer: Color(0xff120a00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a1112),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffebec),
      outlineVariant: Color(0xffd3bebe),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff74343b),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff2c0008),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd1bcfd),
      onSecondaryFixedVariant: Color(0xff17033c),
      tertiaryFixed: Color(0xffffdea9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeebf6d),
      onTertiaryFixedVariant: Color(0xff1a0f00),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff594d4e),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1e),
      surfaceContainer: Color(0xff382e2e),
      surfaceContainerHigh: Color(0xff443939),
      surfaceContainerHighest: Color(0xff4f4444),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
