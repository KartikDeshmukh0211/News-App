import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/screens/category_view.dart';

class CardTile extends StatelessWidget {
  CardTile({super.key, required this.data});
  CategoryData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CategoryViewScreen(url :data.newsUrl),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  data.imageUrl == ''
                      ? "https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75"
                      : data.imageUrl,
                  width: 130,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 130,
                  height: 100,
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Text(
                    data.name,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
