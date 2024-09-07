import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final NewsArticle article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

    // Untuk mengarahkan user ke halaman browser dengan mengklik baca selengkapnya
    Future<void> _launchURL(String url) async {
    final Uri urlUri = Uri.parse(url);
    if (await canLaunchUrl(urlUri)) {
      await launchUrl(
        urlUri,
        mode: LaunchMode.externalApplication
      );
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 30, right: 10),
        child: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          label: Text(
            "Simpan",
            style: GoogleFonts.poppins(color: Colors.blue),
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: Text('Pilih kategori untuk menyimpan berita :'),
                      ),
                      ListTile(
                        leading: Icon(Icons.games_sharp),
                        title: Text('Gaming'),
                      ),
                      ListTile(
                        leading: Icon(Icons.laptop_chromebook),
                        title: Text('Teknologi'),
                      ),
                      ListTile(
                        leading: Icon(Icons.health_and_safety_sharp),
                        title: Text('Kesehatan'),
                      ),
                    ],
                  );
                });
          },
          icon: Icon(
            Icons.bookmark_outline,
            color: Colors.blue,
          ),
        ),
      ),
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
              Padding(
                padding: EdgeInsets.only(top: 10),
                child:
                    article.urlToImage != null && article.urlToImage.isNotEmpty
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: ()=> _launchURL(article.url),
                child: Text('Baca selengkapnya', style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.w500),),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar Appbar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: (){
          }, 
        icon: Icon(Icons.more_vert))
      ],
      elevation: 10.0,
      shadowColor: Colors.black,
      title: Text("Detail Berita",
          style:
              GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500)),
      centerTitle: true,
    );
  }
}
