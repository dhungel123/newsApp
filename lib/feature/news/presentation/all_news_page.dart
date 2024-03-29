import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/news_page.dart';
//git remote set-url origin https://github.com/dhungel123/newsApp.git
//$ ssh-keygen -t rsa -b 4096 -C "dhungelujjwal441@gmail.com"
class AllNewsPage extends StatelessWidget {
  const AllNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('All News'),
          centerTitle: true,),

        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.red,
              //isScrollable: true,
                tabs: [

              Tab(text: 'Top News',),

              Tab(text: 'Entertainment',),

              Tab(text: 'Sports',),


            ]),

            Expanded(
              child: TabBarView(
                  children:[
                    NewsPage(),
                Center(child: Text('Entertainment News yeta auacha')),
                Center(child: Text('Sports News yeta auacha')),


              ] ),
            )
          ],
        ),

      ),
    );
  }
}
