
import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/news_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}