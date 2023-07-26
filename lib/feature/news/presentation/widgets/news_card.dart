import 'package:flutter/material.dart';

import '../../data/date_time_formated.dart';
import '../../data/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news, required this.fromNewsDetails}) : super(key: key);
  final Articles? news;
  final bool fromNewsDetails;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: fromNewsDetails? newsCardWidget(): Card(
        child: newsCardWidget()
      ),
    );
  }
  newsCardWidget(){
   return Padding(
     padding: const EdgeInsets.all(16.0),
     child: Column(
        children: [

          RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                children: [
                  //    TextSpan(text: "News Title ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red)),
                  TextSpan(text:' ${news?.title}'),

                ]
            ),),
          SizedBox(
            height: 12,
          ),
          Image.network(news?.urlToImage ?? ''),
          SizedBox(height: 12,),
          RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  //   TextSpan(text: "Description ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.red)),
                  TextSpan(text: '${news?.description}')
                ]
            ),
          ),
          SizedBox(height: 12,),
          fromNewsDetails ? SizedBox.shrink() :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${news?.author}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text("${DateTimeFormated.convertDateTime(news?.publishedAt ?? '')}",style: TextStyle(color: Colors.black),)


            ],
          )


        ],
      ),
   );

  }
}
