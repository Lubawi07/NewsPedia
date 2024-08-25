import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newpedia/models/newsapi.dart';

class NewsService {
  // API SERVICES YANG SUDAH FIX
  final String apiUrl = 'https://newsapi.org/v2';
  final String apiKey = '373aeb0d4e29409bae6c0eb6ecb12f78';

  // GET DATA
  Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=373aeb0d4e29409bae6c0eb6ecb12f78'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<NewsArticle> articles =
          body.map((dynamic item) => NewsArticle.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception("Failed to load news");
    }
  }

  //SEARCH DATA
  Future<List<NewsArticle>> searchnews(String query) async {
    final response = await http.get(Uri.parse('$apiUrl/everything?q=$query&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<NewsArticle> articles =
          body.map((dynamic item) => NewsArticle.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception("Failed to load news");
    }
  }

  // final String apiUrl = 'google-news13.p.rapidapi.com';
  // final String apiKey = 'd33f2f7976msh113c01a5c72bec2p11c268jsn048d5c10e6db';
  // Future<List<NewsArticle>> fetchNews() async {
  //   final response = await http.get(Uri.parse(apiUrl + apiKey), headers: {
  //     'X-RapidAPI-Key': apiKey,
  //   });
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(response.body);
  //     List<dynamic> body = json['articles'];
  //     List<NewsArticle> articles =
  //         body.map((dynamic item) => NewsArticle.fromJson(item)).toList();
  //     return articles;
  //   } else {
  //     throw Exception("Failed to load news");
  //   }
  // }
}
