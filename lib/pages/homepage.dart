import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';
import 'package:newpedia/pages/detail.dart';
import 'package:newpedia/services/apiberita.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<NewsArticle>> _newsArticles;
  // Untuk merefresh data
  Future<void> _fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // pada saat update data
      _newsArticles = NewsService().fetchNews();
    });
  }

  @override
  void initState() {
    super.initState();
    _newsArticles = NewsService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: FutureBuilder<List<NewsArticle>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal menampilkan berita'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available'));
          } else {
            return RefreshIndicator(
                color: Colors.blue,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    NewsArticle article = snapshot.data![index];
                    return Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ListTile(
                        trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: article.urlToImage != null &&
                                  article.urlToImage.isNotEmpty
                              ? Image.network(
                                  article.urlToImage,
                                  width: 90,
                                  height: 130,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 90,
                                      height: 130,
                                      color: Colors.grey,
                                      child: Center(
                                        child: Text(
                                          'Invalid argument(s)',
                                          style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  width: 90,
                                  height: 130,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      'Gambar tidak tersedia',
                                      style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                        title: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.author,
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 500,
                              child: Text(
                                article.title,
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            article.publishedAt,
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(article: article)));
                        },
                      ),
                    );
                  },
                ),
                onRefresh: _fetchData);
          }
        },
      ),
    );
  }
}

AppBar Appbar() {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 10.0,
    shadowColor: Colors.black,
    title: RichText(
        text: TextSpan(
            text: 'News',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
          TextSpan(
              text: 'Pedia',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent))
        ])),
    centerTitle: true,
  );
}
