import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/color/customcolor.dart';

class Mytheme {
  static final lightmode = ThemeData(
    // Light theme
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     backgroundColor: Colors.white,
    //     selectedItemColor: Colors.blue,
    //     type: BottomNavigationBarType.fixed,
    //     unselectedItemColor: Colors.grey,
    //     selectedLabelStyle: GoogleFonts.poppins(),
    //     unselectedLabelStyle: GoogleFonts.poppins()),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: CustomColor.SoftWhite,
      indicatorColor: Colors.blue.withOpacity(0.5),
      indicatorShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: GoogleFonts.poppins(),
      labelColor: Colors.blue,
      unselectedLabelStyle: GoogleFonts.poppins(),
      indicatorColor: Colors.blue,
      // indicatorSize: TabBarIndicatorSize.label
    ),
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      // Statusbar dan navbar akan terganti jika tema diubah menjadi light mode
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: CustomColor.SoftWhite,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: CustomColor.SoftWhite
    ),
    brightness: Brightness.light,
  );

  static final darkmode = ThemeData(
    // Dark theme
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: Colors.black,
    //   selectedItemColor: Colors.blue,
    //   type: BottomNavigationBarType.fixed,
    //   unselectedItemColor: Colors.grey,
    //   selectedLabelStyle: GoogleFonts.poppins(),
    //   unselectedLabelStyle: GoogleFonts.poppins(),
    // ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: CustomColor.SoftBlack,
      indicatorColor: Colors.blue.withOpacity(0.5),
      indicatorShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    tabBarTheme: TabBarTheme(
        labelStyle: GoogleFonts.poppins(),
        labelColor: Colors.blue,
        unselectedLabelStyle: GoogleFonts.poppins(),
        indicatorColor: Colors.blue),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme().apply(displayColor: Colors.white),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.black),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      // Status bar
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: CustomColor.SoftBlack,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: CustomColor.SoftBlack
    ),
    brightness: Brightness.dark,
  );
}
