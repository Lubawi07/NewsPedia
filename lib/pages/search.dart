import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';
import 'package:newpedia/pages/detail.dart';
import 'package:newpedia/services/apiberita.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  // Untuk tabbar pada bagian dekat dengan appbar
  late TabController _tabController;
  // Untuk mencari berita 
  final TextEditingController _searchController = TextEditingController();
  Future<List<NewsArticle>>? _searchResults;

  // yang vsync : this, ini harus disambungkan dengan with singletickerproviderstatemixin
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener((){
      setState(() {
      });
    });
    super.initState();
  }

  // Fungsi untuk melakukan pencarian
  Future<void> _performSearch(String query) async {
    setState(() {
      _searchResults = NewsService().searchnews(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: 'Semua',),
                Tab(text: 'Gaming'),
                Tab(text: 'Teknologi'),
                Tab(text: 'Olahraga'),
                Tab(text: 'Kesehatan'),
                Tab(text: 'Hiburan'),
            ]),
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            // pinned  digunakan untuk menentukan ketika appbar nya menghilang berarti false dan ketika appbanrya akan terlihat ketika discroll bawah atas (true)
            pinned: false,
            title: SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mic_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Cari berita hari ini... ",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                keyboardType: TextInputType.text,
                onSubmitted: (value) {
                  _performSearch(value);
                },
              ),
            ),
          ),
          _searchResults == null
              ? SliverFillRemaining(
                  child: Column(
                  children: [
                    
                  ],
                ))
              : FutureBuilder<List<NewsArticle>>(
                  future: _searchResults,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SliverFillRemaining(
                        child: Center(
                            child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsetsDirectional.only(top: 10),
                                  child: ListTile(
                                    trailing: Container(
                                      width: 90,
                                      height: 130,
                                      color: Colors.white,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 110,
                                          height: 15,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Container(
                                            width: 200,
                                            height: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        )),
                      );
                    } else if (snapshot.hasError) {
                      return SliverFillRemaining(
                        child: Center(child: Text('Error: ${snapshot.error}')),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return SliverFillRemaining(
                        child: Center(child: Text('No results found')),
                      );
                    } else {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            NewsArticle article = snapshot.data![index];
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
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(article: article)));
                              },
                            );
                          },
                          childCount: snapshot.data!.length,
                        ),
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
