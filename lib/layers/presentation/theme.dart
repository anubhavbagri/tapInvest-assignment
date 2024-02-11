import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_invest/layers/presentation/utils/hex_color.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme();

  static final primaryColor = HexColor("#16A34A");
  static final tertiaryColor = HexColor("15803D");
  static final neutralColor = HexColor("D6D3D1");
  static final green700 = HexColor("#15803D");

  static final double paddingVertical = SizeConfig.safeVertical! * .02;
  static final double paddingHorizontal = SizeConfig.safeHorizontal! * .04;
  static final double paddingRight = SizeConfig.safeHorizontal! * .08;
  static final double paddingAllSides = SizeConfig.safeHorizontal! * .03;
  static final double textPadding = SizeConfig.safeHorizontal! * .02;

  /// headline4 - headlineMedium
  static TextStyle h4(
      BuildContext context, {
        Color? color,
        FontWeight? weight,
        double? letterSpacing,
      }) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
          .fontFamily,
      letterSpacing: letterSpacing,
      color: color ?? green700,
    );
  }

  /// headline5 - headlineSmall
  static TextStyle h5(
      BuildContext context, {
        Color? color,
        FontWeight? weight,
      }) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
      fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
          .fontFamily,
      color: color ?? green700,
    );
  }

  /// headline6 - titleLarge
  static TextStyle h6(
      BuildContext context, {
        Color? color,
        FontWeight? weight,
      }) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w500)
          .fontFamily,
      color: color ?? green700,
    );
  }

  /// subtitle1 - titleMedium
  static TextStyle s1(
      BuildContext context, {
        Color? color,
        FontWeight? weight,
      }) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
          .fontFamily,
      color: color ?? green700,
      overflow: TextOverflow.ellipsis,
    );
  }

  // subtitle2 - titleSmall
  static TextStyle s2(
      BuildContext context, {
        Color? color,
        FontWeight? weight,
        TextDecoration? decoration,
        bool isOverflow = true,
      }) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w500)
          .fontFamily,
      color: color ?? green700,
      decoration: decoration,
      overflow: isOverflow ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }

  /// bodySmall - bodySmall
  static TextStyle bs(
      BuildContext context, {
        Color? color,
        FontWeight? weight,
        TextDecoration? decoration,
        double? letterSpacing,
        double? fontSize,
        bool isOverflow = true,
      }) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w500)
          .fontFamily,
      color: color ?? green700,
      decoration: decoration,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      overflow: isOverflow ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }

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
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      // scaffoldBackgroundColor: Colors.white,
      // cardTheme: CardTheme(color: tertiaryColor),
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
