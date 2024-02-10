import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    this.primaryColor = const Color(0xFF16A34A),
    this.tertiaryColor = const Color(0xFF15803D),
    this.neutralColor = const Color(0xFFD6D3D1),
  });

  final Color primaryColor;
  final Color tertiaryColor;
  final Color neutralColor;

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
      // cardTheme: CardTheme(color: colorScheme.surfaceVariant),
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
      CustomTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  CustomTheme lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) return this;
    return CustomTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}
