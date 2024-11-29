import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category_data.dart';

class Categories {
  List<CategoryData> category = [];

  Future<void> getCategories() async {
    try {
      final url = Uri.https(
        'newsapi.org',
        '/v2/top-headlines',
        {
          'country': 'us',
          'apiKey': '6f6f61369d41488c80769647d3725dfa',
        },
      );

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['articles'] != null) {
          for (final item in data['articles']) {
            category.add(
              CategoryData(
                newsUrl: item['url'] ?? '',
                imageUrl: item['urlToImage'] ?? '',
                name: item['source']['name'] ?? 'Unknown',
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
