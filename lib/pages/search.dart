import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.blue,
            suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.mic_outlined),),
            suffixIconColor: Colors.blue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: "Cari berita hari ini",
            hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.normal),
            contentPadding: EdgeInsets.only(top: 0),
            fillColor: Colors.white30,
            filled: true,
            focusColor: Colors.white,
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}