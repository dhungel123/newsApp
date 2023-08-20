import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/pages/entertainment_news.dart';
import 'package:news_app/feature/news/presentation/pages/news_page.dart';
import 'package:news_app/feature/news/presentation/pages/sports_page.dart';
//git remote set-url origin https://github.com/dhungel123/newsApp.git
//$ ssh-keygen -t rsa -b 4096 -C "dhungelujjwal441@gmail.com"
class AllNewsPage extends StatelessWidget {
   AllNewsPage({Key? key}) : super(key: key);
  String? filepath;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:  Text('All News'),

          actions: [

           // IconButton(onPressed: (){}, icon: Icon(Icons.search)),

            CircleAvatar(
              radius: 25.0,
              backgroundImage:filepath!=null ? Image.file(File(filepath!)).image: NetworkImage('https://th.bing.com/th/id/OIP.WlUDXSME4D1KBxKlZEtVuwHaKA?pid=ImgDet&rs=1'),
            ),


          ],
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

                    EntertainmentNews(),

                    SportsPage(),


              ] ),
            )
          ],
        ),

      ),
    );
  }
}
