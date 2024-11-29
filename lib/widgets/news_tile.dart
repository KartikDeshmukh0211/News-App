import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/article_view.dart';

class NewsTile extends StatelessWidget {
  NewsTile({super.key, required this.article});
  Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ArticleViewScreen(url: article.newsUrl),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(width: 1)
        ),
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.imgurl,
              ),
            ),
            Text(
              article.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              article.description,
            ),
          ],
        ),
      ),
    );
  }
}
