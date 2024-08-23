import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newpedia/components/navbar.dart';
// import 'package:newpedia/components/navbar.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Nav()
    );
  }
}