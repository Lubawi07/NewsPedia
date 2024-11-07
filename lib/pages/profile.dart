import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/pages/setting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/qu-pgr.jpg'),
              ),
              title: Text(
                "Andhika Lubawi",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "lubawi@gmail.com",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                print("Menekan profil");
              },
              trailing: TextButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.blue),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text(
                "Pengaturan",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Tema, bahasa",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
                print("Menekan pengaturan");
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: ListTile(
              leading: Icon(Icons.security),
              title: Text(
                "Keamanan",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Ubah kata sandi",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                print("Menekan keamanan");
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: ListTile(
                leading: Icon(Icons.help_outline),
                title: Text(
                  "Butuh bantuan ?",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "Hubungi kami jika butuh bantuan",
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  print("Menekan bantuan");
                },
                trailing: Icon(Icons.keyboard_arrow_right)),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                "Tentang aplikasi",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Memahami lebih lanjut tentang aplikasi",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                            title: Text('NewsPedia versi : 1.0'),
                          )
                        ],
                      );
                    });
                print("Menekan tentang aplikasi");
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ],
      )),
    );
  }

  AppBar Appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 10.0,
      shadowColor: Colors.black,
      title: Text("Profil",
          style:
              GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500)),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
    );
  }
}
