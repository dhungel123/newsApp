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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Top News'),centerTitle:true,backgroundColor: Colors.red,),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        children: [


          FutureBuilder<List<Articles>?>(
            future:NetworkRequest().getTopNews(),
              builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:snapshot.data?.length ?? 0,
                    itemBuilder: (context,index){
                    return Card(
                      margin:EdgeInsets.all(8),
                      elevation: 8,
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: "News Title ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.yellow)),
                                    TextSpan(text:' News Title: ${snapshot.data?[index].title}'),

                                  ]
                                ),),
                              SizedBox(height: 12,),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: "Description ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.yellow)),
                                    TextSpan(text: '${snapshot.data?[index].description}')
                                  ]
                                ),
                              ),
                            ],
                          ),
                        )
                    );
                    }
                    );

              }else if(snapshot.hasError){
                return Center(child: Text("Error:${snapshot.error}"),);

              }else{
                return Center(child: CircularProgressIndicator());
              }

              }
          )
        ],
      ),
    );
  }
}
