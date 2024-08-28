import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Mode gelap'),
                trailing: Switch(
                    activeTrackColor: Colors.blue,
                    activeColor: Colors.white,
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    }),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Ganti bahasa', style: GoogleFonts.poppins(),),
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Reset password',style: GoogleFonts.poppins(),),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Histori', style: GoogleFonts.poppins(),),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifikasi', style: GoogleFonts.poppins(),),
              ),
            ],
          ),
        ));
  }

  AppBar Appbar() {
    return AppBar(
      elevation: 10.0,
      shadowColor: Colors.black,
      title: Text(
        'Pengaturan',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
    );
  }
}
