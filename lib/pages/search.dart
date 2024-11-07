import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpedia/models/newsapi.dart';
import 'package:newpedia/pages/detail.dart';
import 'package:newpedia/services/apiberita.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  Future<List<NewsArticle>>? _searchResults;
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  // Fungsi untuk melakukan pencarian
  Future<void> _performSearch(String query) async {
    setState(() {
      _searchResults = NewsService().searchnews(query);
    });
  }

  // Fungsi untuk mulai mendengarkan suara
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (error) => print('Error: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (result) {
          setState(() {
            _searchController.text = result.recognizedWords;
          });
          _performSearch(result.recognizedWords);
        });
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            pinned: false,
            title: SizedBox(
                height: 50,
                child: SearchBar(
                    hintText: "Cari berita hari ini...",
                    leading: Icon(Icons.search),
                    trailing: <Widget>[
                      // Clear search
                      if (_searchController.text.isNotEmpty)
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchResults = null;
                          });
                        },
                      ),
                      // On mic for search data
                      Tooltip(
                        message: 'Nyalakan mic untuk pencarian',
                        textStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
                        child: IconButton(
                          icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                          onPressed: _listen,
                        ),
                      ),
                    ],
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      _performSearch(value);
                    })),
          ),
          _searchResults == null
              ? SliverFillRemaining(
                  child: Center(
                      child: Text('Masukkan kata kunci untuk mencari berita')),
                )
              : FutureBuilder<List<NewsArticle>>(
                  future: _searchResults,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasError) {
                      return SliverFillRemaining(
                        child: Center(child: Text('Error: ${snapshot.error}')),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return SliverFillRemaining(
                        child: Center(child: Text('Tidak ada hasil')),
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
