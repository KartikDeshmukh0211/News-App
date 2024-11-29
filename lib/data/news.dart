import 'dart:convert';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    try {
      final url = Uri.https(
        'newsapi.org',
        '/v2/top-headlines',
        {'sources': 'bbc-news', 'apiKey': '6f6f61369d41488c80769647d3725dfa'},
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['articles'] != null) {
          for (final item in data['articles']) {
            news.add(
              Article(
                author: item['author'] ?? 'Unknown',
                title: item['title'] ?? 'No Title',
                description: item['description'] ?? 'No Description',
                imgurl: item['urlToImage'] ?? '',
                newsUrl: item['url'] ?? '',
              ),
            );
          }
        } else {
          // print("No articles found in the response.");
        }
      } else {
        // print("Failed to fetch news. Status Code: ${response.statusCode}");
        // print("Response body: ${response.body}");
      }
    } catch (e) {
      // print("An error occurred while fetching news: $e");
    }
  }
}
