import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/constant/app_color.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColor.scaffoldBackgroundLight,
    primaryContainer: AppColor.primary,
    onPrimary: AppColor.white,
    inversePrimary: AppColor.lightText,
    secondary: AppColor.secoundary,
    tertiary: AppColor.turtiary,
    onInverseSurface: AppColor.lightText,
    error: AppColor.lightRed,
  );
  static const darkColorScheme = ColorScheme.dark(
    primary: AppColor.scaffoldBackgroundDark,
    primaryContainer: AppColor.primary,
    onPrimary: AppColor.secoundary,
    inversePrimary: AppColor.white,
    inverseSurface: AppColor.darkGrey,
    onInverseSurface: AppColor.white,
    onPrimaryContainer: AppColor.scaffoldBackgroundLight,
    secondary: AppColor.darkGrey,
    tertiary: AppColor.white,
    error: AppColor.white,
  );
}

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: AppColorSchemes.lightColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: AppColorSchemes.lightColorScheme.primary,
      iconTheme: IconThemeData(
        color: AppColorSchemes.lightColorScheme.onInverseSurface,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColor.secoundary,
      rangePickerShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      rangePickerBackgroundColor:
          AppColorSchemes.lightColorScheme.onInverseSurface,
      rangePickerHeaderBackgroundColor: AppColor.darkGrey,
      // rangePickerHeaderHeadlineStyle: defaultAppTextStyle(fontSize: 20),
      // rangePickerHeaderHelpStyle: defaultAppTextStyle(fontSize: 16),
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
    scaffoldBackgroundColor: AppColorSchemes.lightColorScheme.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorSchemes.lightColorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
        elevation: 3,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      splashColor: AppColor.white,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: AppColorSchemes.lightColorScheme.onInverseSurface,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 1,
      color: AppColorSchemes.lightColorScheme.inversePrimary.withOpacity(0.1),
    ),
  );
  static final darkTheme = ThemeData(
    colorScheme: AppColorSchemes.darkColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: AppColorSchemes.darkColorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColorSchemes.darkColorScheme.onInverseSurface,
      ),
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
    scaffoldBackgroundColor: AppColorSchemes.darkColorScheme.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor: AppColorSchemes.lightColorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
        shadowColor: const Color.fromARGB(213, 153, 150, 150),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      splashColor: AppColor.darkGrey,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 3,
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: AppColorSchemes.lightColorScheme.onInverseSurface,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 1,
      color: AppColorSchemes.lightColorScheme.inversePrimary.withOpacity(0.1),
    ),
  );
}

class AppTextTheme {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: GoogleFonts.roboto(
          color: colorScheme.onInverseSurface,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: GoogleFonts.roboto(
          color: colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.roboto(
          color: colorScheme.onInverseSurface,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: GoogleFonts.roboto(
          color: colorScheme.inversePrimary,
          fontSize: 38,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.roboto(
          color: colorScheme.inversePrimary,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.roboto(
          color: colorScheme.inversePrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );
}
