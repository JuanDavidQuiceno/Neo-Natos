/// Here the theme of the app is established (colors, fonts with their sizes and characteristics).
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'colors.dart';

ThemeData lightThemeData = ThemeData(
  primarySwatch: AppColors.primaryColor.toMaterialColor(),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: AppColors.white,
  hoverColor: AppColors.primaryColor.withOpacity(0.2),
  brightness: Brightness.light,
  hintColor: AppColors.hintColor,
  listTileTheme: ListTileThemeData(
    selectedTileColor: AppColors.primaryColor.withOpacity(0.1),
    iconColor: AppColors.iconUnSelect,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.white,
    secondary: AppColors.primaryColor,
    onSecondary: AppColors.white,
    background: AppColors.white,
    onBackground: AppColors.textColor,
    surface: AppColors.white,
    onSurface: AppColors.textColor,
    error: AppColors.red,
    onError: AppColors.red,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColor,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: AppColors.primaryColor,
    size: 24,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: GoogleFonts.roboto(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: GoogleFonts.roboto(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 10,
    centerTitle: false,
    titleSpacing: 0,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
      size: 24,
    ),
    titleTextStyle: GoogleFonts.roboto(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontSize: 26,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 22,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 18,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: GoogleFonts.roboto(
      fontSize: 24,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 20,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
  ),
);

// ThemeData darkThemeData = ThemeData(
//   primarySwatch: AppColors.primaryColor.toMaterialColor(),
//   primaryColor: AppColors.primaryColor,
//   cardColor: Color(0xFF2A2D3E),
//   hoverColor: Color.fromARGB(255, 199, 216, 229).withOpacity(0.2),
//   iconTheme: IconThemeData(
//     color: AppColors.primaryColor,
//     size: 28,
//   ),
//   brightness: Brightness.dark,
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xFF212332),
//     elevation: 10,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: Colors.white54),
//     titleTextStyle: TextStyle(
//       color: Colors.blueGrey[100],
//       fontSize: 20,
//       fontFamily: 'Montserrat',
//       fontWeight: FontWeight.w400,
//       letterSpacing: 3,
//     ),
//   ),
//   primaryTextTheme: TextTheme(
//     button: TextStyle(
//       color: Colors.blueGrey[200],
//       decorationColor: Colors.blueGrey[50],
//     ),
//     headline4: TextStyle(
//       fontSize: 34,
//       color: AppColors.white,
//       fontWeight: FontWeight.bold,
//     ),
//     headline5: TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//     ),
//     headline6: TextStyle(
//       fontSize: 20,
//       color: AppColors.white,
//       fontWeight: FontWeight.normal,
//     ),
//     subtitle1: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.normal,
//     ),
//     subtitle2: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.normal,
//     ),
//   ),
// );
