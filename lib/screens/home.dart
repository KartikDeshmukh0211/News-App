import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/categories.dart';
import 'package:news_app/data/news.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/widgets/card_tile.dart';
import 'package:news_app/widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> newsData = [];
  List<CategoryData> categoryData = [];
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllNews();
    getAllCategory();
    // print(newsData);
  }

  void getAllCategory() async {
    Categories categ = Categories();
    await categ.getCategories();
    setState(() {
      categoryData = categ.category;
      _isLoading = false;
    });
  }

  void getAllNews() async {
    try {
      News newClass = News();
      await newClass.getNews();
      setState(() {
        newsData = newClass.news;
        // _isLoading = false;
      });
    } catch (e) {
      // print("Error fetching news: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Daily News"),
          elevation: 0.5,
          centerTitle: true,
        ),
        body: _isLoading
            ? const Center(
              child: CircularProgressIndicator(),
            )
            : Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "CATEGORIES",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: categoryData.length,
                      itemBuilder: (ctx, idx) =>
                          CardTile(data: categoryData[idx]),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "TOP HEADLINES",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newsData.length,
                      itemBuilder: (ctx, idx) => NewsTile(
                        article: newsData[idx],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
