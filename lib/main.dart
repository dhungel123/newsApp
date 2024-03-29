
import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/all_news_page.dart';
import 'package:news_app/feature/news/presentation/news_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AllNewsPage()
    );
  }
}