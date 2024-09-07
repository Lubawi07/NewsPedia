import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SingleChildScrollView(
      ),
    );
  }

  AppBar Appbar() {
    return AppBar( 
      automaticallyImplyLeading: false,
      elevation: 10.0,
      shadowColor: Colors.black,
      title: Text("BookMark", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500)),
      centerTitle: true,
    );
  }
}