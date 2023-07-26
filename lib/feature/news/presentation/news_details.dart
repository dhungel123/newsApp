import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/news_model.dart';
import 'package:news_app/feature/news/presentation/widgets/news_card.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, this.news}) : super(key: key);
  final Articles? news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(news?.title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize:12.0,color: Colors.white),),),
      body: ListView(
        children: [
          NewsCard(news: news,fromNewsDetails: true,),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text('Content:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text(news?.content ?? ''),
                SizedBox(height: 8,)


              ],
            ),
          ),


        ],
      ),
    );
  }
}
