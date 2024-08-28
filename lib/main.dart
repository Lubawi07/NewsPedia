import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/auth/register.dart';
import 'package:newpedia/components/navbar.dart';
import 'package:newpedia/pages/bookmark.dart';
import 'package:newpedia/pages/homepage.dart';
import 'package:newpedia/pages/profile.dart';
import 'package:newpedia/pages/search.dart';
import 'package:newpedia/pages/setting.dart';
// import 'package:newpedia/splash/splash_screen.dart';
// import 'package:projek_perpus/pages/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // UI application
          '/home': (context) => Homepage(),
          '/cari': (context) => SearchPage(),
          '/bookmark': (context) => BookMark(),
          '/profil': (context) => Profile(),
          '/pengaturan': (context) => SettingPage(),
          // Auth page
          '/register': (context) => RegisterPage(),
        },
        theme: ThemeData(
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
          appBarTheme: AppBarTheme(color: Colors.white),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          tabBarTheme: TabBarTheme(
              labelStyle: GoogleFonts.poppins(),
              labelColor: Colors.blue,
              unselectedLabelStyle: GoogleFonts.poppins(),
              indicatorColor: Colors.blue),
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme().apply(displayColor: Colors.white),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.black),
          appBarTheme: AppBarTheme(color: Colors.black),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        home: Nav());
  }
}
