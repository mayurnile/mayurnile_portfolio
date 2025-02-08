import 'package:flutter/material.dart';

class AppTheme {
  // constructor
  const AppTheme();

  // main colors
  static const Color primaryColor = Color(0xFFE9B171);
  static const Color secondaryColor = Color(0xFFC32285);
  static const Color ternaryColor = Color(0xFF2D9687);

  // font colors
  static const Color fontDarkColor = Color(0xFFFFFFFF);
  static const Color fontLightColor = Color(0xFFCECECE);

  // other colors
  static const Color backgroundColor = Color(0xFF0C0C0C);

  // theme data
  static ThemeData getAppThemeData() => ThemeData(
        visualDensity: VisualDensity.standard,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Josefin Sans',
        iconTheme: const IconThemeData(color: fontLightColor),
        scrollbarTheme: const ScrollbarThemeData()
            .copyWith(thumbColor: WidgetStateProperty.all(primaryColor)),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.w700,
            color: fontDarkColor,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Victor Mono',
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
            color: fontDarkColor,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Victor Mono',
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: fontDarkColor,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Victor Mono',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: fontDarkColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Victor Mono',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: fontDarkColor,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Victor Mono',
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: fontDarkColor,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Space Grotesk',
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: fontLightColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Space Grotesk',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: fontLightColor,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Space Grotesk',
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            color: fontLightColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: primaryColor,
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontFamily: 'Victor Mono',
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  // Custom Themed Outlined Button Style
  static ButtonStyle getOutlinedButtonStyle(bool isSmall, Color color) =>
      ButtonStyle(
        elevation: WidgetStateProperty.all(0.0),
        side: WidgetStateProperty.all(BorderSide(color: color)),
        padding: WidgetStateProperty.all(
          isSmall
              ? const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 18.0,
                )
              : const EdgeInsets.symmetric(
                  vertical: 22.0,
                  horizontal: 36.0,
                ),
        ),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color.withOpacity(0.05);
            }
            return null; // Defer to the widget's default.
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return color.withOpacity(0.12);
            }
            return null; // Defer to the widget's default.
          },
        ),
      );

  // Custom Themed Squared Outlined Button Style
  static ButtonStyle getSquaredOutlinedButtonStyle(bool isSmall, Color color) =>
      ButtonStyle(
        elevation: WidgetStateProperty.all(0.0),
        side: WidgetStateProperty.all(BorderSide(color: color)),
        padding: WidgetStateProperty.all(
          isSmall
              ? const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 18.0,
                )
              : const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 24.0,
                ),
        ),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color.withOpacity(0.05);
            }
            return null; // Defer to the widget's default.
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return color.withOpacity(0.12);
            }
            return null; // Defer to the widget's default.
          },
        ),
      );
}

// headline1 -> displayLarge
// headline2 -> displayMedium
// headline3 -> displaySmall
// headline4 -> headlineMedium
// headline5 -> headlineSmall
// headline6 -> titleLarge
// bodyText1 -> bodyLarge
// bodyText2 -> bodyMedium
// subtitle1 -> titleMedium