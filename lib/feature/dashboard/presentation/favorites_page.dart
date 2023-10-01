

import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/pages/news_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Favorites Example',
      home: FavoritesPage(),
    );
  }
}

class NewsArticle {
  final String title;
  final String content;

  NewsArticle({required this.title, required this.content});
}


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Set<NewsArticle> favorites = {}; // Set to store favorite news articles

  // Function to add or remove a news article from favorites
  void toggleFavorite(NewsArticle article) {
    setState(() {
      if (favorites.contains(article)) {
        favorites.remove(article); // Remove article from favorites
      } else {
        favorites.add(article); // Add article to favorites
      }
    });
  }

  // Function to check if a news article is in favorites
  bool isFavorite(NewsArticle article) {
    return favorites.contains(article);
  }

  // Sample list of news articles
  final List<NewsArticle> newsArticles = [
    NewsArticle(
      title: 'Flutter News 1',
      content: 'This is the content of Flutter News 1.',
    ),
    NewsArticle(
      title: 'Flutter News 2',
      content: 'This is the content of Flutter News 2.',
    ),
    // Add more news articles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.favorite),
        backgroundColor: Colors.lightGreen,
        title: Text('Favorites News'),
        centerTitle: true,
      ),
      body:NewsPage()
    );
  }
}
