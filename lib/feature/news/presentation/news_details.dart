import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/news_model.dart';
import 'package:news_app/feature/news/presentation/widgets/news_card.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, this.news, this.newsList}) : super(key: key);
  final Articles? news;

  final List<Articles>? newsList;

  @override
  Widget build(BuildContext context) {
    // to do seperate method for below query
    // we filtered the news by removing the currently selected news
    List<Articles>? similarNews = newsList?.where((element) => element!=news).toList();
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
                SizedBox(height: 8,),

                Text('See more:\n${news?.url}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),),

                SizedBox(height: 8,),

                const Text('Similar news:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: similarNews?.length ?? 0,
              itemBuilder: (context,index){
                var news = similarNews?[index];
                return InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>NewsDetails(
                        news: news,
                        newsList: newsList,
                      )));
                    },
                    child: NewsCard(news:news,fromNewsDetails: false,));
              },

            ),



              ],
            ),
          ),


        ],
      ),
    );
  }
}
