import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/news_model.dart';
import 'package:news_app/feature/news/presentation/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
        style: TextStyle(fontWeight: FontWeight.bold,fontSize:20.0,color: Colors.white),),),
      body: ListView(
        children: [
          NewsCard(news: news,fromNewsDetails: true,),
          SizedBox(
            width: 200,
            child: ElevatedButton(onPressed: (){}, child:Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                const Text('Add to Favorites')
              ],
            )),
          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text('Content:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text(news?.content ?? ''),
                SizedBox(height: 8,),

                InkWell(
                  onTap: (){
                     String? url=news?.url;
                     callingMethod(url!);


                  },

                    child: Text('See more:\n${news?.url}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),)),

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
  Future<void> callingMethod(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
  throw Exception('Could not launch $url');
  }
  }
}
