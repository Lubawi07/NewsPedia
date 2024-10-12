import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newpedia/auth/register.dart';
import 'package:newpedia/components/navbar.dart';
import 'package:newpedia/pages/bookmark.dart';
import 'package:newpedia/pages/homepage.dart';
import 'package:newpedia/pages/profile.dart';
import 'package:newpedia/pages/search.dart';
import 'package:newpedia/pages/setting.dart';
import 'package:newpedia/theme/mytheme.dart';
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
          // '/pengaturan': (context) => SettingPage(),

          // Auth page
          '/register': (context) => RegisterPage(),

          // Components for navbar 
          '/navbar' : (context) => Nav(),
        },
        theme: Mytheme.lightmode,
        darkTheme: Mytheme.darkmode,
        // For to the dark mode use your system if available
        themeMode: ThemeMode.system,
        
        home: Nav());
  }
}
