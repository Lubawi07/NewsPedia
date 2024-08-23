import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';

class DetailPage extends StatelessWidget {
  final NewsArticle article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              article.title,
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              article.author,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ), 
            SizedBox(height: 5),
            Text(
              article.publishedAt,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w300),
            ),
            Padding(padding: EdgeInsets.only(top: 10),
            child: article.urlToImage != null && article.urlToImage.isNotEmpty
                ? Image.network(article.urlToImage)
                : Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        'Gambar tidak tersedia',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            ),
            SizedBox(height: 10),
            Text(
              article.content,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      ),
      
    );
  }

  AppBar Appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10.0,
      shadowColor: Colors.black,
      title: Text("Detail Berita",
          style:
          GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500)),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outline))
      ],
    );
  }
}