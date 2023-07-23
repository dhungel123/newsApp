import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/news/data/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  void initState() {
    super.initState();

  }
  NetworkRequest network= NetworkRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Top News'),centerTitle:true,backgroundColor: Colors.grey,),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        children: [


          FutureBuilder<List<Articles>?>(
            // We call the method that actually brings data from the server
            future:network.getTopNews(),
              // in shapshort we get the data what we passed in the FutureBuilder
              builder: (context,snapshot){

              if(snapshot.hasData){
                return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:snapshot.data?.length ?? 0,
                    itemBuilder: (context,index){
                      var news=snapshot.data?[index];
                    return Card(
                      //margin:EdgeInsets.all(8),
                      elevation: 8,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12,right: 12),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(text: "News Title ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.yellow)),
                                    TextSpan(text:' ${news?.title}'),

                                  ]
                                ),),
                              Image.network(news?.urlToImage ?? ''),
                              SizedBox(height: 12,),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(text: "Description ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.yellow)),
                                    TextSpan(text: '${news?.description}')
                                  ]
                                ),
                              ),
                              SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${news?.author}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text("${news?.publishedAt}",style: TextStyle(color: Colors.white),)


                                ],
                              )


                            ],
                          ),
                        )
                    );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 2,
                      );

                },
                    );


              }

              else if(snapshot.hasError){
                print("Error:${snapshot.error}");
                return Center(child: Text("Error:${snapshot.error}"),);

              }

              else{
                return Center(child: CircularProgressIndicator());
              }

              }
          )
        ],
      ),
    );
  }
}
