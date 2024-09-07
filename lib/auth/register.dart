import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/components/navbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// Untuk menambahkan controller pada textfield

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 65),
              child: Center(
                child: Text('Daftar', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
                labelStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                hintText: 'Masukkkan username',
                hintStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                labelStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                hintText: 'Masukkkan email',
                hintStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: 'Password',
                labelStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                hintText: 'Masukkkan password',
                hintStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 30),
            child: FilledButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Nav()));
              },
              child: Text(
                "Daftar",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(370, 50)),
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Center(
              child: Text('Atau menggunakan', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),),),
            ),
            Padding(padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: FilledButton.icon(
              onPressed: () {
              },
              iconAlignment: IconAlignment.start,
              icon: FaIcon(FontAwesomeIcons.facebook),
              label: Text('Lanjutkan dengan facebook', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold),),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(370, 50)),
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}