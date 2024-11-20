import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';
import 'package:newpedia/pages/detail.dart';
import 'package:newpedia/services/apiberita.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSearchDelegate extends SearchDelegate {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];
  Future<List<NewsArticle>>? _searchResults;

  // Mengubah placeholder teks di SearchBar
  @override
  String get searchFieldLabel => 'Cari berita hari ini...';

  @override
  TextInputType get keyboardType => TextInputType.text;

  @override
  TextStyle get searchFieldStyle => GoogleFonts.poppins();

  // Mendapatkan pencarian terbaru dari SharedPreferences
  Future<void> loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    recentSearches = prefs.getStringList('recentSearches') ?? [];
  }

  // Menyimpan pencarian terbaru ke SharedPreferences
  Future<void> saveRecentSearch(String query) async {
    final prefs = await SharedPreferences.getInstance();
    if (!recentSearches.contains(query)) {
      recentSearches.insert(0, query); // Tambahkan ke awal daftar
      if (recentSearches.length > 5)
        recentSearches = recentSearches.sublist(0, 5); // Batasi ke 5 pencarian
      prefs.setStringList('recentSearches', recentSearches);
    }
  }

  Future<void> _performSearch(String query) async {
    _searchResults = NewsService().searchnews(query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // if (_searchController.text.isNotEmpty)
      IconButton(
        onPressed: () {
          // _searchController.clear();
          // _searchResults = null;
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Tooltip(
      message: 'Tombol kembali',
      textStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
      child: IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Simpan pencarian yang dilakukan ke dalam riwayat pencarian
    saveRecentSearch(query);

    // Bangun hasil pencarian berdasarkan query
    return FutureBuilder<List<NewsArticle>>(
      future: NewsService().searchnews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Tidak ada hasil'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final article = snapshot.data![index];
              return ListTile(
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
                      builder: (context) => DetailPage(article: article),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return FutureBuilder(
        future: loadRecentSearches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          }
          return ListView.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              final recentQuery = recentSearches[index];
              return ListTile(
                trailing: Icon(Icons.arrow_outward),
                leading: Icon(Icons.history),
                title: Text(recentQuery),
                titleTextStyle: GoogleFonts.poppins(fontSize: 13),
                onTap: () {
                  query = recentQuery;
                  showResults(context); // Menampilkan hasil pencarian
                },
              );
            },
          );
        },
      );
    } else {
      // Tampilkan saran pencarian lainnya atau lakukan pencarian sesuai query
      return FutureBuilder<List<NewsArticle>>(
        future: NewsService().searchnews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada hasil'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return ListTile(
                  leading: Icon(Icons.search),
                  title: Text(article.title),
                  titleTextStyle: GoogleFonts.poppins(fontSize: 13),
                  onTap: () {
                    query = article.title;
                    showResults(context);
                  },
                );
              },
            );
          }
        },
      );
    }
  }
}
