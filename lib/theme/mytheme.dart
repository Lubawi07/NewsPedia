import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme {
  static final lightmode = ThemeData(
    // Light theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.poppins()),
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
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final darkmode = ThemeData(
    // Dark theme  
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: GoogleFonts.poppins(),
            unselectedLabelStyle: GoogleFonts.poppins(),
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
              systemNavigationBarColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent
            ),
            ),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
          brightness: Brightness.dark,
  );
}
