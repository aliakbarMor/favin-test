import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:favin_test/theme/colors.dart';

class AppTheme {
  static darkTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        errorColor: AppColors.error,
        cardColor: AppColors.card,
        dividerColor: AppColors.light,
        backgroundColor: AppColors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: const TextStyle(color: AppColors.light, fontSize: 24),
              headline5: const TextStyle(color: AppColors.light, fontSize: 22),
              headline6: const TextStyle(
                  color: AppColors.light,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              subtitle1: const TextStyle(
                  color: AppColors.light,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodyText1: const TextStyle(color: AppColors.light, fontSize: 16),
              bodyText2: const TextStyle(color: AppColors.light, fontSize: 14),
              subtitle2: const TextStyle(
                  color: AppColors.light,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              button: const TextStyle(
                  color: AppColors.link,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
              caption: const TextStyle(color: AppColors.light, fontSize: 12),
              overline: const TextStyle(
                  fontSize: 11, color: AppColors.light, letterSpacing: 0.2),
            ),
        iconTheme: ThemeData.dark().iconTheme.copyWith(color: AppColors.light),
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            surfaceTintColor: AppColors.primary,
            elevation: 0,
            backgroundColor: AppColors.black,
            foregroundColor: AppColors.light,
            iconTheme: ThemeData.dark().iconTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white)),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.primary),
        ),
      );

  static lightTheme() => ThemeData(
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: const TextStyle(color: AppColors.dark, fontSize: 24),
              headline5: const TextStyle(color: AppColors.dark, fontSize: 22),
              headline6: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              subtitle1: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodyText1: const TextStyle(color: AppColors.dark, fontSize: 16),
              bodyText2: const TextStyle(color: AppColors.dark, fontSize: 14),
              subtitle2: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              button: const TextStyle(
                  color: AppColors.link,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
              caption: const TextStyle(color: AppColors.dark, fontSize: 12),
              overline: const TextStyle(
                  fontSize: 11, color: AppColors.dark, letterSpacing: 0.2),
            ),
        fontFamily: 'IranYekan',
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        errorColor: AppColors.error,
        cardColor: AppColors.card,
        dividerColor: AppColors.divider,
        backgroundColor: AppColors.white,
        iconTheme: ThemeData.light().iconTheme.copyWith(color: AppColors.dark),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            surfaceTintColor: AppColors.primary,
            elevation: 0,
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.dark,
            iconTheme: ThemeData.light().iconTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white)),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.primary),
        ),
      );
}
