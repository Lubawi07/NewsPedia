import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newpedia/components/navbar.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.white),
        appBarTheme: AppBarTheme(color: Colors.white),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme().apply(displayColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.black),
        appBarTheme: AppBarTheme(color: Colors.black),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: Nav()
    );
  }
}