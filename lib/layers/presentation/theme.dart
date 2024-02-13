import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_invest/layers/presentation/utils/hex_color.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme();

  static final primaryColor = HexColor("#16A34A");
  static final neutralColor = HexColor("D6D3D1");
  static final green700 = HexColor("#15803D");
  static final textActive = HexColor("#152420");
  static final stone200 = HexColor("#E7E5E4");
  static final stone300 = HexColor("#D6D3D1");
  static final stone400 = HexColor("#A8A29E");
  static final stone500 = HexColor("#78716C");
  static final stone700 = HexColor("#44403C");
  static final gray700 = HexColor("#374151");
  static final slate600 = HexColor("#475569");

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
          color: color ?? textActive,
        );
  }

  /// headline6 - titleLarge
  static TextStyle h6(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
  }) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
              .fontFamily,
          color: color ?? textActive,
        );
  }

  /// subtitle1 - titleMedium
  static TextStyle s1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    bool isOverflow = true,
    double? letterSpacing,
  }) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
              .fontFamily,
          color: color ?? green700,
          overflow: isOverflow ? TextOverflow.ellipsis : TextOverflow.visible,
          letterSpacing: letterSpacing,
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
          fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
              .fontFamily,
          color: color ?? stone500,
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
          fontFamily: GoogleFonts.inter(fontWeight: weight ?? FontWeight.w600)
              .fontFamily,
          color: color ?? stone500,
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
          color: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }));
  }

  @override
  ThemeExtension<CustomTheme> copyWith({
    Color? primaryColor,
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

final SizedBox vSizedBoxHalf = SizedBox(
  height: SizeConfig.safeVertical! * .005,
);

final SizedBox vSizedBox1 = SizedBox(
  height: SizeConfig.safeVertical! * .01,
);
final SizedBox vSizedBox2 = SizedBox(
  height: SizeConfig.safeVertical! * .015,
);
final SizedBox vSizedBox3 = SizedBox(
  height: SizeConfig.safeVertical! * .02,
);
final SizedBox vSizedBox4 = SizedBox(
  height: SizeConfig.safeVertical! * .03,
);
final SizedBox vSizedBox5 = SizedBox(
  height: SizeConfig.safeVertical! * .04,
);
final SizedBox vSizedBox6 = SizedBox(
  height: SizeConfig.safeVertical! * .05,
);

///
final SizedBox vSizedBoxSmall = SizedBox(
  width: SizeConfig.safeVertical! * .005,
);

final SizedBox hSizedBox1 = SizedBox(
  width: SizeConfig.safeHorizontal! * .01,
);

final SizedBox hSizedBox2 = SizedBox(
  width: SizeConfig.safeHorizontal! * .02,
);

final SizedBox hSizedBox3 = SizedBox(
  width: SizeConfig.safeHorizontal! * .04,
);

final SizedBox hSizedBox4 = SizedBox(
  width: SizeConfig.safeHorizontal! * 0.1,
);

final SizedBox hSizedBox5 = SizedBox(
  width: SizeConfig.safeHorizontal! * 0.3,
);

final SizedBox hSizedBox6 = SizedBox(
  width: SizeConfig.safeHorizontal! * .06,
);
