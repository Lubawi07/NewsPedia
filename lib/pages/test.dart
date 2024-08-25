import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';
import 'package:newpedia/pages/detail.dart';
import 'package:newpedia/services/apiberita.dart';
import 'package:shimmer/shimmer.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<List<NewsArticle>> _newsArticles;
  late Future<List<NewsArticle>> _carouselArticles; // Data untuk carousel

  Future<void> _fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _newsArticles = NewsService().fetchNews();
      _carouselArticles = NewsService().fetchNews(); // Fetch data carousel
    });
  }

  @override
  void initState() {
    super.initState();
    _newsArticles = NewsService().fetchNews();
    _carouselArticles = NewsService().fetchNews(); // Initialize data carousel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: FutureBuilder<List<NewsArticle>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(padding: EdgeInsetsDirectional.only(top: 10),
                  child: ListTile(
                    trailing: Container(
                      width: 90,
                      height: 130,
                      color: Colors.white,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 110,
                          height: 15,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(top: 5),
                        child: Container(
                          width: 200,
                          height: 50,
                          color: Colors.white,
                        ),
                        ),
                      ],  
                    ),
                  )
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal menampilkan berita'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available'));
          } else {
            return RefreshIndicator(
              color: Colors.blue,
              child: Column(
                children: [
                  // Carousel Slider di atas
                  FutureBuilder<List<NewsArticle>>(
                    future: _carouselArticles,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 200,
                            color: Colors.white,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Failed to load carousel'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No carousel data available'));
                      } else {
                        return CarouselSlider.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index, realIndex) {
                            final article = snapshot.data![index];
                            return Column(
                              children: [
                                Image.network(
                                  article.urlToImage ?? '',
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey,
                                      child: Center(
                                        child: Text(
                                          'Image not available',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  article.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                          ),
                        );
                      }
                    },
                  ),
                  // List news yang tersedia
                  Expanded(
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
                                                color: Colors.red,
                                              ),
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
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.author,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 500,
                                  child: Text(
                                    article.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                article.publishedAt,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    DetailPage(article: article),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              onRefresh: _fetchData,
            );
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
    leading: IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
    centerTitle: true,
  );
}
