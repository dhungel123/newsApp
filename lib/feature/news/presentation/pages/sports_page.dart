import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/news/presentation/news_details.dart';
import 'package:news_app/feature/news/presentation/widgets/news_card.dart';

import '../../data/news_model.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  NetworkRequest networkRequest=NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await networkRequest.getSportsNews();
        }
    , child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      children: [
        FutureBuilder<List<Articles>?>(
          future: networkRequest.getSportsNews(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context,index){
                      var news=snapshot.data?[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>NewsDetails(
                                news: news,
                                newsList: snapshot.data,
                              )
                          )
                          );
                        },
                        child: NewsCard(
                            news: news, fromNewsDetails: false
                        ),
                      );
                    }
                );
              }
              else if(snapshot.hasError){
                return Center(child: Text("Error:${snapshot.error}"),);
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            }
        )

      ],
    ),
    );
  }
}
