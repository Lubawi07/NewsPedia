import 'package:intl/intl.dart';

class NewsArticle {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String content;
  final String publishedAt;

  NewsArticle({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.content,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'] ?? 'Tidak ada author',
      title: json['title'] ?? "Tidak ada judul",
      description: json['description'] ?? "Tidak ada deskripsi",
      urlToImage: json['urlToImage'] ?? "Tidak ada gambar",
      url: json['url'] ?? "Tidak ada url",
      content: json['content'] ?? "Tidak ada konten",
      publishedAt: json['publishedAt'] != null
          ? DateFormat('dd-MM-yyyy kk:mm a').format(DateTime.parse(json['publishedAt']))
          : 'Tidak ada tanggal publikasi',
    );
  }
}
