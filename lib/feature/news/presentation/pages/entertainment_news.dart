
import 'package:flutter/material.dart';

import '../../../../config/network/network_request.dart';
import '../../data/news_model.dart';
import '../news_details.dart';
import '../widgets/news_card.dart';


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
        await network.getEntertainmentNews();
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: [


          FutureBuilder<List<Articles>?>(
            // We call the method that actually brings data from the server
              future: network.getEntertainmentNews(),
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
                                      newsList: snapshot.data,
                                    )));
                          },
                          child: NewsCard(news: news, fromNewsDetails:false,

                          )
                      );
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
