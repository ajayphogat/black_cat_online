import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';
/*
class MyTheme {
  static final light = ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color(0xffF5F6FA),

      appBarTheme: const AppBarTheme(


          iconTheme: IconThemeData(color: AppColors.black),
          actionsIconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(color: Colors.black),
          color: Colors.white,
          elevation: 0),
      textTheme: const TextTheme(
          headline6: TextStyle(
              fontWeight: FontWeight.w600)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),));
}*/

class Themes {
  static final light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      shadowColor: Colors.white,
      // canvasColor: Colors.red,
      fontFamily: GoogleFonts.openSans().fontFamily,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.cornflowerBlue),
    /*  primarySwatch:const MaterialColor(0xFF000000, {
        50: Color(0xFF000001),
        300: Color(0xFF000002),
        900: Color(0xFF000003)
      }),*/
      primarySwatch: Colors.blueGrey,
      checkboxTheme: CheckboxThemeData(
        // overlayColor: MaterialStateColor.resolveWith((states) =>Colors.red),
        checkColor: MaterialStateColor.resolveWith((states) =>Colors.white),
        fillColor:  MaterialStateColor.resolveWith((states) =>Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
        ),
        // side: BorderSide(color: Colors.redAccent)
      ),


      appBarTheme: const AppBarTheme(
          // backgroundColor: Colors.white,
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(

        style:  ElevatedButton.styleFrom(
          // foregroundColor: AppColors.black,
          backgroundColor: AppColors.black,
          textStyle: GoogleFonts.openSans(
              fontSize: 20.0, color: AppColors.white, fontWeight: FontWeight.w700),
          minimumSize: const Size(145, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
      ),
      textTheme:  TextTheme(
        headlineLarge:GoogleFonts.openSans(fontSize: 26, color: AppColors.black, fontWeight: FontWeight.w700),
        headline1: GoogleFonts.openSans(fontSize: 24, color: Colors.black,fontWeight: FontWeight.w700),

        headline2: GoogleFonts.openSans(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w700),
        headline3: GoogleFonts.openSans(fontSize: 22, color: AppColors.white, fontWeight: FontWeight.w700),
        headline4: GoogleFonts.openSans(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w700),
        headline5: GoogleFonts.openSans(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w700),
        headline6: GoogleFonts.openSans(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w700),
        labelMedium: GoogleFonts.openSans(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700),



        bodyText1: GoogleFonts.openSans(fontSize: 16, color: Colors.black),
        bodyText2: GoogleFonts.openSans(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w700),

        subtitle1: GoogleFonts.openSans(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
        subtitle2: GoogleFonts.openSans(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        overline: GoogleFonts.openSans(fontSize: 12, color: Colors.red.shade400),

        button: GoogleFonts.openSans(fontSize: 12, color: Colors.black),
        caption: GoogleFonts.openSans(fontSize: 10, color: Colors.black),


      ));

  //  this is Dark theme for whole application .............


  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColorLight: Colors.black,
    appBarTheme: const AppBarTheme(color: Colors.white),
    // primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headlineLarge:GoogleFonts.openSans(fontSize: 26, color: AppColors.black, fontWeight: FontWeight.w700),
      headline1: GoogleFonts.openSans(fontSize: 24, color: Colors.black,fontWeight: FontWeight.w700),

      headline2: GoogleFonts.openSans(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w700),
      headline3: GoogleFonts.openSans(fontSize: 22, color: AppColors.white, fontWeight: FontWeight.w700),
      headline4: GoogleFonts.openSans(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w700),
      headline5: GoogleFonts.openSans(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w700),
      headline6: GoogleFonts.openSans(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w700),
      labelMedium: GoogleFonts.openSans(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700),



      bodyText1: GoogleFonts.openSans(fontSize: 16, color: Colors.black),
      bodyText2: GoogleFonts.openSans(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w700),

      subtitle1: GoogleFonts.openSans(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
      subtitle2: GoogleFonts.openSans(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
      overline: GoogleFonts.openSans(fontSize: 12, color: Colors.red.shade400),

      button: GoogleFonts.openSans(fontSize: 12, color: Colors.black),
      caption: GoogleFonts.openSans(fontSize: 10, color: Colors.black),


    )
  );


}
