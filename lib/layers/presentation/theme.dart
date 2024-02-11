import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_invest/layers/presentation/utils/hex_color.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme();

  static final primaryColor = HexColor("#16A34A");
  static final tertiaryColor = HexColor("15803D");
  static final neutralColor = HexColor("D6D3D1");

  ThemeData base() {
    final primaryTextTheme = GoogleFonts.interTextTheme();
    final secondaryTextTheme = GoogleFonts.interTightTextTheme();
    final textTheme = primaryTextTheme.copyWith(
      displaySmall: secondaryTextTheme.displaySmall,
      displayMedium: secondaryTextTheme.displayMedium,
      displayLarge: secondaryTextTheme.displayLarge,
      headlineSmall: secondaryTextTheme.headlineSmall,
      headlineMedium: secondaryTextTheme.headlineMedium,
      headlineLarge: secondaryTextTheme.headlineLarge,
    );

    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme,
      // appBarTheme: AppBarTheme(
      // ),
      cardTheme: CardTheme(color: tertiaryColor),
      // scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
      // tabBarTheme: TabBarTheme(
      //     labelColor: colorScheme.onSurface,
      //     unselectedLabelColor: colorScheme.onSurface,
      //     indicator: BoxDecoration(
      //         border: Border(
      //             bottom: BorderSide(color: colorScheme.primary, width: 2)))),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: colorScheme.secondaryContainer,
      //     foregroundColor: colorScheme.onSecondaryContainer),
      // navigationRailTheme: NavigationRailThemeData(
      //     backgroundColor: isLight ? neutralColor : colorScheme.surface,
      //     selectedIconTheme:
      //         IconThemeData(color: colorScheme.onSecondaryContainer),
      //     indicatorColor: colorScheme.secondaryContainer),
      // chipTheme: ChipThemeData(
      //     backgroundColor: isLight ? neutralColor : colorScheme.surface),
    );
  }

  @override
  ThemeExtension<CustomTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      const CustomTheme();

  @override
  CustomTheme lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) return this;
    return const CustomTheme();
  }
}
