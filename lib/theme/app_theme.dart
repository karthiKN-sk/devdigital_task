// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static const Color _lightFocusColor = Colors.black;
  static const Color _darkFocusColor = Colors.green;

  static  ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor, lightTextTheme);
  static  ThemeData darkThemeData =
      themeData(darkColorScheme, _darkFocusColor, darkTextTheme);

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(
    TextStyle textStyle, {
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double letterSpacing = 0.0,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
    double? decorationThickness,
    Color? decorationColor,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    double? finalFontSize = fontSize ?? textStyle.fontSize;

    Color? finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle.color!.withAlpha(160)
          : (muted ? textStyle.color!.withAlpha(200) : textStyle.color);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }
    return GoogleFonts.poppins(
      fontSize: finalFontSize,
      fontWeight: _getFontWeight(fontWeight),
      fontStyle: fontStyle,
      textStyle: TextStyle(fontFamily: fontFamily),
      letterSpacing: letterSpacing,
      color: finalColor,
      decoration: decoration,
      height: height,
      wordSpacing: wordSpacing,
      decorationThickness: decorationThickness,
      decorationColor: decorationColor,
    );
    // return TextStyle(
    //     fontSize: finalFontSize,
    //     fontWeight: _getFontWeight(fontWeight),
    //     fontStyle: fontStyle,
    //     fontFamily: fontFamilyLight ? "Pastoral-Light" : "Pastoral-Medium",
    //     letterSpacing: letterSpacing,
    //     color: finalColor,
    //     decoration: decoration,
    //     height: height,
    //     wordSpacing: wordSpacing);
  }

  static TextStyle getTitleTextStyle(
      {int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize,
      FontStyle? fontStyle,
      String? fontFamily}) {
    return GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: _getFontWeight(fontWeight),
        fontStyle: fontStyle,
        textStyle: TextStyle(fontFamily: fontFamily),
        letterSpacing: letterSpacing,
        color: color,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  //Text Themes
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff4a4c4f))),
    displayMedium: GoogleFonts.oswald(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff4a4c4f))),
    displaySmall: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff4a4c4f))),
    headlineMedium: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff4a4c4f))),
    headlineSmall: GoogleFonts.sourceSansPro(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff4a4c4f))),
    titleLarge: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff4a4c4f))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    bodyLarge: GoogleFonts.nunitoSans(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff4a4c4f))),
    bodyMedium: GoogleFonts.dmSerifText(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff4a4c4f))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
    labelMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff4a4c4f))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 08, color: Color(0xff4a4c4f))),
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 102, color: Colors.white)),
    displayMedium: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 64, color: Colors.white)),
    displaySmall: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 51, color: Colors.white)),
    headlineMedium: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 36, color: Colors.white)),
    headlineSmall: GoogleFonts.sourceSansPro(
        textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
    titleLarge: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 18, color: Colors.white)),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Colors.white)),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    bodyLarge: GoogleFonts.nunitoSans(
        textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
    bodyMedium: GoogleFonts.dmSerifText(
        textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Colors.white)),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    labelMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Colors.white)),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 08, color: Colors.white)),
  );

  static ThemeData themeData(
      ColorScheme colorScheme, Color focusColor, TextTheme textTheme) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
            color: colorScheme.background,
            actionsIconTheme: IconThemeData(color: colorScheme.onBackground),
            iconTheme: IconThemeData(color: colorScheme.onBackground),
            toolbarHeight: AppBar().preferredSize.height,
            elevation: 0),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          },
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        iconTheme: IconThemeData(color: colorScheme.onSecondary),
        canvasColor: colorScheme.background,
        textTheme: textTheme,
        scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        backgroundColor: colorScheme.background,
        bottomAppBarColor: Colors.transparent,
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent));
  }

  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
      seedColor: _lightFocusColor,
      primary: const Color(0XFFFFC257), //  PRIMARY_COLOR
      onPrimary: const Color(0XFFF3D733), //PRIMARY_DARK_COLOR
      onPrimaryContainer: const Color(0XFFFFBB00), //TRICERY_COLOR
      primaryContainer: const Color(0XFFFFAF47), //ACCENT_COLOR
      // primaryVariant: Color(0XFFF8B823), //Get Button Aishwariyum
      secondary: Colors.grey, //SEC_TEXT_COLOR
      onSecondary: const Color(0XFF333232), //SECONDARY_COLOR
      onSecondaryContainer: const Color(0XFF393939), //BUTTON_COLOR_01
      background: const Color(0XFFF5F5F5), //BACKGROUND_COLOR
      onBackground: const Color(0XFFFDF7D6), //PRIMARY_LIGHT_COLOR
      surface: const Color(0XFFFFFFFF), //WHITE_COLOR
      onSurface: const Color(0XFFFFE4C1), //SAND_BOX_COLOR
      surfaceTint: const Color(0XFFFFF7CF), //SAND_BOX_COLOR2
      onTertiary: const Color(0XFF000000), //BLACK_COLOR
      onTertiaryContainer: const Color(0XFF10AC34), //BUTTON_COLOR_02
      inversePrimary: const Color(0XFF70C133), //Cart Green
      inverseSurface: const Color(0XFF4AC71E), //Get Button
      onSurfaceVariant: const Color(0XFF2D4754), //Fruit Expand
      surfaceVariant: const Color(0XFFFFCD5A), //fruit card color
      onInverseSurface: const Color.fromARGB(255, 35, 61, 15),
      error: Colors.red,
      onErrorContainer: const Color(0XFF620800), //Scheme Text
      errorContainer:
          const Color(0XFFA42B2B), //Akshayam Scheme Button/Card Color
      onError: Colors.white,
      brightness: Brightness.light,
      secondaryContainer: const Color.fromARGB(255, 97, 97, 97) //Bottom_COLOR
      );

  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: _darkFocusColor,
    primary: const Color(0XFFFFC257),
    onPrimary: const Color(0XFFF3D733),
    onPrimaryContainer: const Color(0XFFFFBB00),
    primaryContainer: const Color(0XFFFFAF47),
    secondary: const Color(0xFFec9410),
    onSecondary: const Color(0xff9999aa),
    onSecondaryContainer: const Color(0xff9999aa),
    background: const Color(0xff151515),
    onBackground: const Color(0x0DFFFFFF),
    surface: const Color(0xff1E2746),
    onSurface: Colors.white,
    error: Colors.red,
    errorContainer: Colors.red,
    onError: Colors.white,
    brightness: Brightness.dark,
  );
}
