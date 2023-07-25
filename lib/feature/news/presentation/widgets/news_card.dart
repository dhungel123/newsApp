import 'package:flutter/material.dart';

import '../../data/date_time_formated.dart';
import '../../data/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, this.news}) : super(key: key);
  final Articles? news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12,right: 12),
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
