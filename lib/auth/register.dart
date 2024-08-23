import 'package:flutter/material.dart';
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
            Padding(padding: EdgeInsets.only(
              top: 30,
              right: 10,
              left: 10
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.person),
                labelText: "Username",
                hintText: "Masukkan username anda"
              ),
              keyboardType: TextInputType.text,
            ),
            ),
            Padding(padding: EdgeInsets.only(
              top: 20,
              right: 10,
              left: 10
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                hintText: "Masukkan alamat email anda"
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            ),
            Padding(padding: EdgeInsets.only(
              top: 20,
              right: 10,
              left: 10
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Password",
                hintText: "Gunakan password yang kuat"
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            ),
             //Filled button ('Daftar')
            Padding(
              padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Nav()));
              },
              child: Text(
                "Daftar",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(350, 50)),
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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