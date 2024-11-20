import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/pages/delegate/search.dart';
import 'package:newpedia/pages/detail.dart';
import 'package:newpedia/services/apiberita.dart';
import 'package:newpedia/models/newsapi.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({super.key});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<NewsArticle>> _newsArticles;

  final List<String> _categories = [
    'general',
    'gaming',
    'technology',
    'sports',
    'health',
    'entertainment',
    'science',
    'business'
  ];

  final Map<String, String> _categoryTranslate = {
    'general': 'Semua',
    'gaming': 'Gaming',
    'technology': 'Teknologi',
    'sports': 'Olahraga',
    'health': 'Kesehatan',
    'entertainment': 'Hiburan',
    'science': 'Sains',
    'business': 'Bisnis'
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _fetchNewsByCategory(_categories[0]); // Default: kategori pertama
  }

  // Get data berdasarkan kategori
  void _fetchNewsByCategory(String category) {
    setState(() {
      _newsArticles = NewsService().fetchNewsByCategory(category);
    });
  }

  // Refresh data berita
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    String currentCategory = _categories[_tabController.index];
    _fetchNewsByCategory(currentCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: _categories.map((category) {
          _fetchNewsByCategory(category);
          return FutureBuilder<List<NewsArticle>>(
            future: _newsArticles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                    
                  color: Colors.blue,
                ));
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
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 500,
                                  child: Text(
                                    article.title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(article: article)));
                            },
                          ),
                        );
                      },
                    ),
                    onRefresh: _onRefresh);
              }
            },
          );
        }).toList(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
        )
      ],
      title: Text(
        'Kategori',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      elevation: 10.0,
      shadowColor: Colors.black,
      bottom: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        controller: _tabController,
        tabs: _categories.map((category) {
          return Tab(
            child: Text(
              _categoryTranslate[category] ?? category,
              style: GoogleFonts.poppins(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
