
import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/news/data/date_time_formated.dart';
import 'package:news_app/feature/news/data/news_model.dart';
import 'package:news_app/feature/news/presentation/news_details.dart';
import 'package:news_app/feature/news/presentation/widgets/news_card.dart';


class EntertainmentNews extends StatefulWidget {
  const EntertainmentNews({Key? key}) : super(key: key);

  @override
  State<EntertainmentNews> createState() => _EntertainmentNewsState();
}

class _EntertainmentNewsState extends State<EntertainmentNews> {

  @override
  void initState() {
    super.initState();
  }

  NetworkRequest network = NetworkRequest();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await network.getTopNews();
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: [


          FutureBuilder<List<Articles>?>(
            // We call the method that actually brings data from the server
              future: network.getTopNews(),
              // in shapshort we get the data what we passed in the FutureBuilder
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var news = snapshot.data?[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetails(
                                      news: news,
                                    )));
                          },
                          child: NewsCard(news: news,fromNewsDetails: false,));
                    },

                  );
                }

                else if (snapshot.hasError) {
                  print("Error:${snapshot.error}");
                  return Center(child: Text("Error:${snapshot.error}"),);
                }

                else {
                  return Center(child: CircularProgressIndicator());
                }
              }
          )
        ],
      ),
    );
  }
}
