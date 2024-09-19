import 'package:e_com/utils/theme/bottom_sheet_theme.dart';
import 'package:e_com/utils/theme/chip_theme.dart';
import 'package:e_com/utils/theme/custom_themes/check_box_theme.dart';
import 'package:e_com/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_com/utils/theme/custom_themes/text_field_theme.dart';
import 'package:e_com/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'custom_themes/appbar_theme.dart';
import 'elevated_button_theme.dart';

class TAppTheme{

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    textTheme:TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipThemeData,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,


  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    textTheme:TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipThemeData,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}